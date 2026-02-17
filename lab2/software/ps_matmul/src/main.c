/***************************** Include Files *******************************/
#include "user_uart.h"
#include "user_axi_timer.h"
#include "user_xllfifo.h"
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
XLlFifo AxiFifo;
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
// AXI FIFO constants
#ifndef SDT
#define FIFO_DEV_ID	XPAR_AXI_FIFO_0_DEVICE_ID
#else
#define XLLFIFO_BASEADDRESS XPAR_XLLFIFO_0_BASEADDR
#endif

#define NUM_ROWS_A 2
#define NUM_INNER_DIM 4
#define NUM_COLS_B 1

#define NO_INPUT_ELEMENTS (NUM_ROWS_A * NUM_INNER_DIM + NUM_INNER_DIM * NUM_COLS_B)
#define ELEMENT_SIZE_IN_BYTES 1
#define INPUT_BYTES NO_INPUT_ELEMENTS*ELEMENT_SIZE_IN_BYTES
#define OUTPUT_BYTES (NUM_ROWS_A * NUM_COLS_B)*ELEMENT_SIZE_IN_BYTES 

const XLlFifo_TxParams TX_PARAMS = {
	.word_size = 4, // in bytes
	.number_of_packets = 1,
	.max_packet_length = INPUT_BYTES, 
	.transmission_length = 4 * INPUT_BYTES // in bytes
};

const XLlFifo_RxParams RX_PARAMS = {
	.word_size = 4
};

/* Function prototypes */
void matrix_multiply(u32* matrice_buffer, uint8_t* result, uint8_t num_rows_a, uint8_t num_inner_dim, uint8_t num_cols_b);

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
	int Status = XST_SUCCESS;
	u32 UART_ReceiveBuffer[INPUT_BYTES];
	u32 AXI_ReceiveBuffer[INPUT_BYTES];
	u8 UART_TransmitBuffer[OUTPUT_BYTES];
	u32 StartTime;
	u32 AxiSendDuration; 
	u32 MatmulDuration; 

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

	// Initialise AXI
	#ifndef SDT
	AXI_Init(&AxiFifo, FIFO_DEV_ID);
	#else
	AXI_Init(&AxiFifo, XLLFIFO_BASEADDRESS);
	#endif

	// Initalise AXI FIFO
	XLlFifo_TxConfig XLlFifo_TxConfig = {&AxiFifo, UART_ReceiveBuffer, &TX_PARAMS};
	XLlFifo_RxConfig XLlFifo_RxConfig = {&AxiFifo, AXI_ReceiveBuffer, &RX_PARAMS};

	// infinite loop to receive data via uart and send res back
	while (1){
		// Receive data from UART to Rxbuffer
		UART_RxToBuffer(&Uart_Ps, UART_ReceiveBuffer, INPUT_BYTES);
		if (Status != XST_SUCCESS) {
			xil_printf("Failed to read into ReceiveBuffer \n\r");
			xil_printf("--- Exiting main() ---\n\r");
			return XST_FAILURE;
		}
		// Start Timer
		StartTime = TIMER_Start(&TimerCounter, TIMER_COUNTER_0);
		
		// Send data from RxBuffer to AXI FIFO
		XLlFifo_TxSend(&XLlFifo_TxConfig);
		// Receive data from AXI FIFO in loopback mode
		XLlFifo_RxReceive(&XLlFifo_RxConfig);
		AxiSendDuration = TIMER_GetDurationFromStart(&TimerCounter, TIMER_COUNTER_0, StartTime);

		// Perform Matmul on ouput of AXI FIFO and store in SendBuffer
		matrix_multiply(AXI_ReceiveBuffer, UART_TransmitBuffer, NUM_ROWS_A, NUM_INNER_DIM, NUM_COLS_B);
		MatmulDuration = TIMER_GetDurationFromStart(&TimerCounter, TIMER_COUNTER_0, AxiSendDuration);
		Status = TIMER_Stop(&TimerCounter, TIMER_COUNTER_0);
		
		// Write to UART 
		UART_TxFromBuffer(&Uart_Ps, UART_TransmitBuffer, OUTPUT_BYTES);
		
		// After completing write to UART
		xil_printf("Time taken to receive %d bytes over UART: %d clock cycles\n\r", INPUT_BYTES, AxiSendDuration);
		xil_printf("Time taken to perform matrix multiplication: %d clock cycles\n\r", MatmulDuration);
	}
	return XST_SUCCESS;
}

void matrix_multiply(u32* matrice_buffer, uint8_t* result, uint8_t num_rows_a, uint8_t num_inner_dim, uint8_t num_cols_b) {
	for (size_t i = 0; i < num_rows_a; i++) {
		for (size_t j = 0; j < num_cols_b; j++) {
			u32 temp = 0;
			for (size_t k = 0; k < num_inner_dim; k++) {
				temp += (matrice_buffer[i * num_inner_dim + k] * matrice_buffer[(num_rows_a * num_inner_dim) + k * num_cols_b + j]);
			}
			result[i * num_cols_b + j] = temp >> 8;
		}
	}
	
}