"""
pynq_matmul.py
--------------
PYNQ script to benchmark three matrix multiplication co-processors
(HDL, HLS, HLS Optimised), mirroring the logic in main.c / server.py.

Hardware layout (must match your block design):
    axi_dma_0  ↔  HDL matmul IP
    axi_dma_1  ↔  HLS matmul IP
    axi_dma_2  ↔  HLS Optimised matmul IP
    axi_timer_0    AXI Timer (free-running, used for cycle-accurate timing)

Input CSV (AB.csv):
    First  A_ROWS  rows  → Matrix A  (A_ROWS x INNER_DIM, one row per CSV line)
    Next   INNER_DIM rows → Matrix B  (INNER_DIM x B_COLS, one row per CSV line)
    Values may be decimal or 0x-prefixed hex.

Output CSVs:
    RES_HDL.csv, RES_HLS.csv, RES_HLS_OPTIM.csv  — results as hex bytes
"""

from pynq import Overlay, allocate
from pynq.lib import AxiGPIO          # only needed if you use GPIO; kept for reference
import numpy as np
import csv
import time
from ctypes import c_uint32

# ---------------------------------------------------------------------------
# Configuration — mirror main.h constants
# ---------------------------------------------------------------------------
BITSTREAM       = "design_1_wrapper.bit"   # path to your bitstream

INPUT_CSV           = "AB.csv"
SW_RESULT_CSV       = "RES_SW.csv"
HDL_RESULT_CSV      = "RES_HDL.csv"
HLS_RESULT_CSV      = "RES_HLS.csv"
HLS_OPTIM_RESULT_CSV = "RES_HLS_OPTIM.csv"

A_ROWS      = 64
INNER_DIM   =  8
B_COLS      =  1

INPUT_WORDS  = A_ROWS * INNER_DIM + INNER_DIM * B_COLS   # 520
OUTPUT_WORDS = A_ROWS * B_COLS                            #  64

# AXI Timer register offsets (from Xilinx PG079)
TCSR0_OFFSET = 0x00   # Timer 0 Control/Status Register
TLR0_OFFSET  = 0x04   # Timer 0 Load Register
TCR0_OFFSET  = 0x08   # Timer 0 Counter Register
TCSR0_ENT    = (1 << 7)   # Enable Timer bit
TCSR0_LOAD   = (1 << 5)   # Load bit (load TLR into TCR)
TCSR0_UDT    = (1 << 1)   # Up/Down count: 0 = count up


# ---------------------------------------------------------------------------
# CSV helpers  (mirrors server.py)
# ---------------------------------------------------------------------------
def parse_value(v):
    v = v.strip()
    return int(v, 16) if v.lower().startswith("0x") else int(v, 0)


def read_input_csv(filename):
    """
    Read A (A_ROWS x INNER_DIM) and B (INNER_DIM x B_COLS) from CSV.
    Returns:
        flat_words : list[int]  — 520 values ready to stream, A then B
        A          : np.ndarray (A_ROWS, INNER_DIM)
        B          : np.ndarray (INNER_DIM, B_COLS)
    """
    with open(filename, "r") as f:
        reader = csv.reader(f)
        data = [list(map(parse_value, row)) for row in reader if row]

    A = np.array(data[:A_ROWS],                      dtype=np.int64)
    B = np.array(data[A_ROWS : A_ROWS + INNER_DIM],  dtype=np.int64)

    assert A.shape == (A_ROWS, INNER_DIM), \
        f"Matrix A shape mismatch: expected ({A_ROWS},{INNER_DIM}), got {A.shape}"
    assert B.shape == (INNER_DIM, B_COLS), \
        f"Matrix B shape mismatch: expected ({INNER_DIM},{B_COLS}), got {B.shape}"

    # Flatten row-major: A first, then B
    flat_words = A.flatten().tolist() + B.flatten().tolist()
    assert len(flat_words) == INPUT_WORDS, \
        f"Expected {INPUT_WORDS} input words, got {len(flat_words)}"

    return flat_words, A, B


def compute_expected(A, B):
    """
    Software golden reference — mirrors matrix_multiply() in main.c:
        result[i][j] = (sum_k A[i][k] * B[k][j]) >> 8
    """
    raw = np.matmul(A.astype(np.int64), B.astype(np.int64))
    return (raw >> 8).astype(np.int64)


def save_result_csv(filename, result_array):
    """Save OUTPUT_WORDS results to CSV as hex bytes (mirrors server.py)."""
    flat = result_array.flatten()
    with open(filename, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow([f"0x{int(v) & 0xFF:02X}" for v in flat])
    print(f"  Result saved to {filename}")


def verify_result(name, received, expected):
    """Compare received (OUTPUT_WORDS,) int64 array against expected."""
    rec = received.reshape(A_ROWS, B_COLS)
    exp = expected.reshape(A_ROWS, B_COLS)
    if np.array_equal(rec, exp):
        print(f"  [PASS] {name} matches expected result")
        return True
    else:
        print(f"  [FAIL] {name} does NOT match expected result!")
        mismatches = np.argwhere(exp.flatten() != rec.flatten())
        for idx in mismatches[:5]:
            i = int(idx[0])
            print(f"    Index {i}: expected {exp.flatten()[i]}, got {rec.flatten()[i]}")
        if len(mismatches) > 5:
            print(f"    ... and {len(mismatches) - 5} more mismatches")
        return False


# ---------------------------------------------------------------------------
# AXI Timer helpers  (mirrors TIMER_Start / TIMER_GetDurationFromStart in main.c)
# ---------------------------------------------------------------------------
class AxiTimer:
    """
    Thin wrapper around the Xilinx AXI Timer (PG079).
    Assumes the timer MMIO region is already mapped via the overlay.

    Usage:
        timer = AxiTimer(overlay.axi_timer_0)
        t0    = timer.start()
        ...
        cycles = timer.elapsed(t0)
    """
    def __init__(self, ip_core):
        self._mmio = ip_core.mmio

    def _read(self, offset):
        return self._mmio.read(offset)

    def _write(self, offset, value):
        self._mmio.write(offset, value)

    def start(self):
        """
        Reset and start Timer 0 counting up.
        Returns the snapshot of TCR0 at start (should be ~0 after reset).
        Mirrors TIMER_Start() in user_axi_timer.c.
        """
        # Load 0 into TLR, then pulse LOAD to reset counter to 0
        self._write(TLR0_OFFSET, 0x00000000)
        self._write(TCSR0_OFFSET, TCSR0_LOAD)          # assert load
        self._write(TCSR0_OFFSET, TCSR0_ENT)            # clear load, enable + count up
        return self._read(TCR0_OFFSET)                  # snapshot (≈0)

    def elapsed(self, start_count):
        """
        Return cycles elapsed since start().
        Mirrors TIMER_GetDurationFromStart() in user_axi_timer.c.
        Handles single 32-bit wrap-around.
        """
        now = self._read(TCR0_OFFSET)
        if now >= start_count:
            return now - start_count
        else:
            # Wrapped around 32-bit counter
            return (0xFFFFFFFF - start_count) + now + 1


# ---------------------------------------------------------------------------
# DMA transfer helper  (mirrors DMA_TxSend + DMA_RxReceive in main.c)
# ---------------------------------------------------------------------------
def dma_run(dma, in_buf, out_buf):
    """
    Send in_buf to co-processor and receive result into out_buf.
    Blocks until both channels complete (polling, mirrors DMA_Busy loops).
    """
    dma.sendchannel.transfer(in_buf)
    dma.recvchannel.transfer(out_buf)
    dma.sendchannel.wait()
    dma.recvchannel.wait()


# ---------------------------------------------------------------------------
# Software matmul  (mirrors matrix_multiply() in main.c, for timing baseline)
# ---------------------------------------------------------------------------
def sw_matrix_multiply(flat_words):
    """
    Pure-Python matrix multiply matching the firmware implementation.
    Returns result as np.ndarray (OUTPUT_WORDS,) int64.
    """
    A = np.array(flat_words[:A_ROWS * INNER_DIM],
                 dtype=np.int64).reshape(A_ROWS, INNER_DIM)
    B = np.array(flat_words[A_ROWS * INNER_DIM:],
                 dtype=np.int64).reshape(INNER_DIM, B_COLS)
    raw = np.matmul(A, B)
    return (raw >> 8).astype(np.int64).flatten()


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main():
    # --- Load input data ---
    print(f"Reading input from '{INPUT_CSV}' ...")
    flat_words, A, B = read_input_csv(INPUT_CSV)
    expected = compute_expected(A, B).flatten()
    print(f"  A: {A.shape}, B: {B.shape}, input words: {len(flat_words)}\n")

    # --- Load overlay ---
    print(f"Loading overlay '{BITSTREAM}' ...")
    overlay = Overlay(BITSTREAM)

    # Retrieve DMA instances — names must match your block design
    dma0 = overlay.axi_dma_0   # HDL matmul
    dma1 = overlay.axi_dma_1   # HLS matmul
    dma2 = overlay.axi_dma_2   # HLS Optimised matmul

    # Retrieve AXI Timer
    # Adjust the attribute name to match your overlay (run overlay.ip_dict to check)
    timer = AxiTimer(overlay.axi_timer_0)

    print("Overlay loaded.\n")

    # --- Allocate physically contiguous DMA buffers ---
    # pynq.allocate handles cache flushing automatically (equivalent to
    # Xil_DCacheFlushRange / Xil_DCacheInvalidateRange in main.c)
    in_buf  = allocate(shape=(INPUT_WORDS,),  dtype=np.uint32)
    out_buf = allocate(shape=(OUTPUT_WORDS,), dtype=np.uint32)

    # Fill TX buffer with input data (A row-major, then B row-major)
    for i, v in enumerate(flat_words):
        in_buf[i] = int(v)

    results   = {}
    durations = {}

    # -----------------------------------------------------------------------
    # Software matmul (timing baseline — mirrors main.c software section)
    # -----------------------------------------------------------------------
    print("--- Software Matrix Multiplication ---")
    t0 = timer.start()
    sw_result = sw_matrix_multiply(flat_words)
    sw_cycles = timer.elapsed(t0)
    print(f"  Duration: {sw_cycles} cycles")
    save_result_csv(SW_RESULT_CSV, sw_result)
    verify_result("Software matmul", sw_result, expected)
    results["SW"]   = sw_result
    durations["SW"] = sw_cycles

    # -----------------------------------------------------------------------
    # HDL co-processor — AXI DMA 0
    # -----------------------------------------------------------------------
    print("\n--- HDL Matrix Multiplication (DMA 0) ---")
    out_buf[:] = 0                          # mirrors memset(uart_txbuf, 0, ...)
    t0 = timer.start()
    dma_run(dma0, in_buf, out_buf)
    hdl_cycles = timer.elapsed(t0)
    print(f"  Duration: {hdl_cycles} cycles")

    hdl_result = np.array(out_buf, dtype=np.int64).flatten()
    save_result_csv(HDL_RESULT_CSV, hdl_result)
    verify_result("HDL matmul", hdl_result, expected)
    results["HDL"]   = hdl_result
    durations["HDL"] = hdl_cycles

    # -----------------------------------------------------------------------
    # HLS co-processor — AXI DMA 1
    # -----------------------------------------------------------------------
    print("\n--- HLS Matrix Multiplication (DMA 1) ---")
    out_buf[:] = 0
    t0 = timer.start()
    dma_run(dma1, in_buf, out_buf)
    hls_cycles = timer.elapsed(t0)
    print(f"  Duration: {hls_cycles} cycles")

    hls_result = np.array(out_buf, dtype=np.int64).flatten()
    save_result_csv(HLS_RESULT_CSV, hls_result)
    verify_result("HLS matmul", hls_result, expected)
    results["HLS"]   = hls_result
    durations["HLS"] = hls_cycles

    # -----------------------------------------------------------------------
    # HLS Optimised co-processor — AXI DMA 2
    # -----------------------------------------------------------------------
    print("\n--- HLS Optimised Matrix Multiplication (DMA 2) ---")
    out_buf[:] = 0
    t0 = timer.start()
    dma_run(dma2, in_buf, out_buf)
    hls_optim_cycles = timer.elapsed(t0)
    print(f"  Duration: {hls_optim_cycles} cycles")

    hls_optim_result = np.array(out_buf, dtype=np.int64).flatten()
    save_result_csv(HLS_OPTIM_RESULT_CSV, hls_optim_result)
    verify_result("HLS Optim matmul", hls_optim_result, expected)
    results["HLS_OPTIM"]   = hls_optim_result
    durations["HLS_OPTIM"] = hls_optim_cycles

    # -----------------------------------------------------------------------
    # Summary  (mirrors server.py summary block)
    # -----------------------------------------------------------------------
    sw_cyc = durations["SW"]
    print("\n--- Summary ---")
    print(f"Software:     {sw_cyc} cycles")
    print(f"HDL IP:       {durations['HDL']} cycles")
    print(f"HLS IP:       {durations['HLS']} cycles")
    print(f"HLS Optim IP: {durations['HLS_OPTIM']} cycles")

    if sw_cyc > 0:
        print(f"Speedup (HDL):       {sw_cyc / durations['HDL']:.2f}x")
        print(f"Speedup (HLS):       {sw_cyc / durations['HLS']:.2f}x")
        print(f"Speedup (HLS Optim): {sw_cyc / durations['HLS_OPTIM']:.2f}x")

    # Free DMA buffers
    in_buf.freebuffer()
    out_buf.freebuffer()


if __name__ == "__main__":
    main()