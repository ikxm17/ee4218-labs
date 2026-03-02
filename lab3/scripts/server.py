import serial
import csv
import numpy as np

# --- Configuration ---
SERIAL_PORT = "/dev/ttyUSB1"
BAUD_RATE = 115200
TIMEOUT = 5

INPUT_CSV = "AB.csv"
SW_RESULT_CSV = "RES_SW.csv"
FIFO_RESULT_CSV = "RES_FIFO.csv"
DMA_RESULT_CSV = "RES_DMA.csv"

OUTPUT_BYTES = 64
DURATION_BYTES = 4

A_ROWS = 64
INNER_DIM = 8
B_COLS = 1


def parse_value(v):
    v = v.strip()
    if v.startswith("0x") or v.startswith("0X"):
        return int(v, 16)
    return int(v, 0)


def read_input_csv(filename):
    """Read input matrices from CSV and return raw bytes + numpy arrays for verification."""
    with open(filename, "r") as f:
        reader = csv.reader(f)
        data = [list(map(parse_value, row)) for row in reader]

    A = np.array(data[:A_ROWS])
    B = np.array(data[A_ROWS : A_ROWS + INNER_DIM])
    assert A.shape == (A_ROWS, INNER_DIM), f"A shape mismatch: {A.shape}"
    assert B.shape == (INNER_DIM, B_COLS), f"B shape mismatch: {B.shape}"
    return data, A, B


def compute_expected(A, B):
    """Compute expected result matching the firmware's fixed-point logic."""
    result = np.matmul(A.astype(np.int64), B.astype(np.int64))
    result = result >> 8
    return result.astype(np.int64)


def save_result_csv(filename, raw_bytes, num_bytes):
    """Save raw result bytes to CSV as hex values."""
    hex_data = [f"0x{b:02X}" for b in raw_bytes[:num_bytes]]
    with open(filename, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(hex_data)


def verify_result(name, raw_bytes, expected):
    """Compare received result against expected numpy array."""
    result = np.array(list(raw_bytes[:OUTPUT_BYTES]), dtype=np.int64)
    result = result.reshape(A_ROWS, B_COLS)

    if np.array_equal(expected, result):
        print(f"[PASS] {name} matches expected result")
        return True
    else:
        print(f"[FAIL] {name} does NOT match expected result!")
        # Show first few mismatches
        mismatches = np.argwhere(expected.flatten() != result.flatten())
        for idx in mismatches[:5]:
            i = idx[0]
            print(
                f"Index {i}: expected {expected.flatten()[i]}, got {result.flatten()[i]}"
            )
        if len(mismatches) > 5:
            print(f"... and {len(mismatches) - 5} more mismatches")
        return False


def main():
    # --- Read input and compute expected result ---
    data, A, B = read_input_csv(INPUT_CSV)
    expected = compute_expected(A, B)
    print(f"Input loaded: A={A.shape}, B={B.shape}")

    # --- Serial communication ---
    try:
        ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=TIMEOUT)
        print(f"Connected to {SERIAL_PORT} at {BAUD_RATE} baud.\n")

        # --- Send input matrices ---
        for row in data:
            for item in row:
                ser.write(int(item).to_bytes(1, byteorder="big"))
        print("Input data sent to FPGA.\n")

        # --- Receive software matmul result ---
        print("--- Software Matrix Multiplication ---")
        sw_payload = ser.read(OUTPUT_BYTES + DURATION_BYTES)
        if len(sw_payload) < OUTPUT_BYTES + DURATION_BYTES:
            print(
                f"Warning: Only received {len(sw_payload)}/{OUTPUT_BYTES + DURATION_BYTES} bytes"
            )

        sw_result_bytes = sw_payload[:OUTPUT_BYTES]
        sw_cycles = int.from_bytes(
            sw_payload[OUTPUT_BYTES : OUTPUT_BYTES + DURATION_BYTES], byteorder="little"
        )
        print(f"Duration: {sw_cycles} clock cycles")

        save_result_csv(SW_RESULT_CSV, sw_result_bytes, OUTPUT_BYTES)
        print(f"Result saved to {SW_RESULT_CSV}")
        verify_result("Software matmul", sw_result_bytes, expected)

        # --- Receive AXI FIFO matmul result ---
        print("\n--- AXI FIFO Matrix Multiplication ---")
        fifo_payload = ser.read(OUTPUT_BYTES + DURATION_BYTES)
        if len(fifo_payload) < OUTPUT_BYTES + DURATION_BYTES:
            print(
                f"Warning: Only received {len(fifo_payload)}/{OUTPUT_BYTES + DURATION_BYTES} bytes"
            )

        fifo_result_bytes = fifo_payload[:OUTPUT_BYTES]
        fifo_cycles = int.from_bytes(
            fifo_payload[OUTPUT_BYTES : OUTPUT_BYTES + DURATION_BYTES],
            byteorder="little",
        )
        print(f"Duration: {fifo_cycles} clock cycles")

        save_result_csv(FIFO_RESULT_CSV, fifo_result_bytes, OUTPUT_BYTES)
        print(f"Result saved to {FIFO_RESULT_CSV}")
        verify_result("AXI FIFO matmul", fifo_result_bytes, expected)

        # --- Receive AXI DMA matmul result ---
        print("\n--- AXI DMA Matrix Multiplication ---")
        dma_payload = ser.read(OUTPUT_BYTES + DURATION_BYTES)
        if len(dma_payload) < OUTPUT_BYTES + DURATION_BYTES:
            print(
                f"Warning: Only received {len(dma_payload)}/{OUTPUT_BYTES + DURATION_BYTES} bytes"
            )

        dma_result_bytes = dma_payload[:OUTPUT_BYTES]
        dma_cycles = int.from_bytes(
            dma_payload[OUTPUT_BYTES : OUTPUT_BYTES + DURATION_BYTES],
            byteorder="little",
        )
        print(f"Duration: {dma_cycles} clock cycles")

        save_result_csv(DMA_RESULT_CSV, dma_result_bytes, OUTPUT_BYTES)
        print(f"Result saved to {DMA_RESULT_CSV}")
        verify_result("AXI DMA matmul", dma_result_bytes, expected)

        # --- Summary ---
        if sw_cycles > 0:
            fifo_speedup = sw_cycles / fifo_cycles if fifo_cycles > 0 else float("inf")
            dma_speedup = sw_cycles / dma_cycles if dma_cycles > 0 else float("inf")
            print(f"\n--- Summary ---")
            print(f"Software:{sw_cycles} cycles")
            print(f"AXI FIFO:{fifo_cycles} cycles")
            print(f"AXI DMA:{dma_cycles} cycles")
            print(f"Speedup (FIFO):{fifo_speedup:.2f}x")
            print(f"Speedup (DMA):{dma_speedup:.2f}x")

        ser.close()

    except serial.SerialException as e:
        print(f"Serial Error: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")
        raise


if __name__ == "__main__":
    main()
