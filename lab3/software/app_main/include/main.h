/**
 * @file main.h
 * @author your name (you@domain.com)
 * @brief
 * @version 0.1
 * @date 2026-02-25
 *
 * @copyright Copyright (c) 2026
 *
 */

/************************** Constant Definitions ***************************/
// TODO: Remove all the non-SDT definitions, i.e. DEVICE IDs. The generated BSPs are in SDT-style (only BASEADDR defined in
// "xparameters.h")
#ifndef SDT
#define UART_DEVICE_ID XPAR_XUARTPS_0_DEVICE_ID
#else
#define XUARTPS_BASEADDRESS XPAR_XUARTPS_0_BASEADDR
#endif
// timer constants
#ifndef SDT
#define TMRCTR_DEVICE_ID XPAR_TMRCTR_0_DEVICE_ID
#else
#define XTMRCTR_BASEADDRESS XPAR_XTMRCTR_0_BASEADDR
#endif
#define TIMER_COUNTER_0 0
// AXI FIFO constants
#ifndef SDT
#define FIFO_DEV_ID XPAR_AXI_FIFO_0_DEVICE_ID
#else
#define XLLFIFO_BASEADDRESS XPAR_XLLFIFO_0_BASEADDR
#endif

// AXI DMA constants
#define AXIDMA_BASE_ADDR XPAR_AXI_DMA_0_BASEADDR
// Memory and buffer constants
#define DDR_BASE_ADDR XPAR_PSU_DDR_0_BASEADDRESS
// ! DDR_0 address range is from 0x0000000 to 0x7ff00000, as long as the offsets do not exceed this range
// ! Can refer to app_main.elf.size for size of memory segments
#define AXIDMA_BUFFER_BASE_ADDR_OFFSET 0x01000000 // Should be sufficiently large to not overlap with the program's other memory segments
#define AXIDMA_BUFFER_BASE_ADDR        DDR_BASE_ADDR + AXIDMA_BUFFER_BASE_ADDR_OFFSET
#define AXIDMA_TX_BUFFER_ADDR_OFFSET   0x00100000 // Should be sufficiently large to avoid being in the same cache line as other variables
#define AXIDMA_TX_BUFFER_ADDR          AXIDMA_BUFFER_BASE_ADDR + AXIDMA_TX_BUFFER_ADDR_OFFSET
#define AXIDMA_RX_BUFFER_ADDR_OFFSET   0x00300000 // Should be sufficiently large to avoid being in the same cache line as other variables
#define AXIDMA_RX_BUFFER_ADDR          AXIDMA_BUFFER_BASE_ADDR + AXIDMA_RX_BUFFER_ADDR_OFFSET

#define NUM_ROWS_A    64
#define NUM_INNER_DIM 8
#define NUM_COLS_B    1

#define NO_INPUT_ELEMENTS     (NUM_ROWS_A * NUM_INNER_DIM + NUM_INNER_DIM * NUM_COLS_B)
#define ELEMENT_SIZE_IN_BYTES 1
#define INPUT_BYTES           NO_INPUT_ELEMENTS* ELEMENT_SIZE_IN_BYTES
#define OUTPUT_BYTES          (NUM_ROWS_A * NUM_COLS_B) * ELEMENT_SIZE_IN_BYTES