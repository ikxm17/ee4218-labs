/***************************** Include Files *******************************/
#include "user_uart.h"
#include "user_axi_timer.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_types.h"
#include "xuartps.h"
#include "xil_printf.h"
#include "xllfifo.h"
#include "xtmrctr.h"

#include <stdint.h>

#ifdef USE_TEST_MATRICES
#include "test_matrices.h"
#endif

/************************** Variable Definitions ***************************/
XLlFifo FifoInstance;
XUartPs Uart_Ps;
XTmrCtr TimerCounter;
uint8_t result_matrix[64];

// Constant definitions
#ifndef SDT
#define UART_DEVICE_ID          XPAR_XUARTPS_0_DEVICE_ID
#else
#define	XUARTPS_BASEADDRESS		XPAR_XUARTPS_0_BASEADDR
#endif
// timer constants
#ifndef SDT
#define TMRCTR_DEVICE_ID	XPAR_TMRCTR_0_DEVICE_ID
#else
#define XTMRCTR_BASEADDRESS	XPAR_XTMRCTR_0_BASEADDR
#endif
#define TIMER_COUNTER_0	 0



#define NO_INPUT_ELEMENTS 4
#define ELEMENT_SIZE_IN_BYTES 4
#define INPUT_BYTES NO_INPUT_ELEMENTS*ELEMENT_SIZE_IN_BYTES

/* Function prototypes */
void matrix_multiply(uint8_t* matrix_a, uint8_t* matrix_b, uint8_t* result, uint8_t num_rows_a, uint8_t num_inner_dim, uint8_t num_cols_b);

/***************************************************************************/
/**
*
* Main function to call UART to AXI FIFO function
*
* @return	XST_SUCCESS if successful, XST_FAILURE if unsuccessful
*
* @note		None
*
****************************************************************************/
int main(void)
{	
	matrix_multiply(matrix_a, matrix_b, result_matrix, 64, 8, 1);
	for (size_t i = 0; i < 64; i++)
	{
		xil_printf("Result: %d, Label: %d\n", result_matrix[i], labels_matrix[i]);
	}
	

	while(1);

	int Status = XST_SUCCESS;
	u8 ReceiveBuffer[INPUT_BYTES];
	u32 StartTime;
	u32 Duration; 

	// Initalise UART
	#ifndef SDT
	UART_Init(&Uart_Ps, UART_DEVICE_ID);
	#else
	UART_Init(&Uart_Ps, XPAR_XUARTPS_0_BASEADDR);
	#endif

	// Initalise Timer 
	#ifndef SDT
	TIMER_Init(&TimerCounter, TMRCTR_DEVICE_ID, TIMER_COUNTER_0);
	#else
	TIMER_Init(&TimerCounter, XTMRCTR_BASEADDRESS, TIMER_COUNTER_0);
	#endif

	// Start Timer
	StartTime = TIMER_Start(&TimerCounter, TIMER_COUNTER_0);

	// Receive data from UART	
	UART_RxToBuffer(&Uart_Ps, ReceiveBuffer, INPUT_BYTES);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to read into ReceiveBuffer \n\r");
		xil_printf("--- Exiting main() ---\n\r");
		return XST_FAILURE;
	}
	

	// After completing write to UART
	Duration = TIMER_GetDurationFromStart(&TimerCounter, TIMER_COUNTER_0, StartTime);
	Status = TIMER_Stop(&TimerCounter, TIMER_COUNTER_0);
	xil_printf("Time taken to receive %d bytes over UART: %d clock cycles\n\r", INPUT_BYTES, Duration);
	xil_printf("Successfully ran Axi Streaming FIFO Polling Example\n\r");
	xil_printf("--- Exiting main() ---\n\r");

	return XST_SUCCESS;
}

void matrix_multiply(uint8_t* matrix_a, uint8_t* matrix_b, uint8_t* result, uint8_t num_rows_a, uint8_t num_inner_dim, uint8_t num_cols_b) {
	for (size_t i = 0; i < num_rows_a; i++) {
		for (size_t j = 0; j < num_cols_b; j++) {
			for (size_t k = 0; k < num_inner_dim; k++) {
				result[i * num_cols_b + j] += (matrix_a[i * num_inner_dim + k] * matrix_b[k * num_cols_b + j]) >> 8;
			}
		}
	}
}