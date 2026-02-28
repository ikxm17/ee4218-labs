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

#define NUM_ROWS_A    64
#define NUM_INNER_DIM 8
#define NUM_COLS_B    1

#define NO_INPUT_ELEMENTS     (NUM_ROWS_A * NUM_INNER_DIM + NUM_INNER_DIM * NUM_COLS_B)
#define ELEMENT_SIZE_IN_BYTES 1
#define INPUT_BYTES           NO_INPUT_ELEMENTS * ELEMENT_SIZE_IN_BYTES
#define OUTPUT_BYTES          (NUM_ROWS_A * NUM_COLS_B) * ELEMENT_SIZE_IN_BYTES