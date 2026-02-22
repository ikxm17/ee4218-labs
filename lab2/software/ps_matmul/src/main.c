/***************************** Include Files *******************************/
#include "user_axi_timer.h"
#include "user_uart.h"
#include "user_xllfifo.h"
#include "xil_printf.h"
#include "xil_types.h"
#include "xllfifo.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xtmrctr.h"
#include "xuartps.h"

#include <stdint.h>

#ifdef USE_TEST_MATRICES
#include "test_matrices.h"
#endif

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

/************************** Variable Definitions ***************************/
// Buffers
u8  UART_TransmitBuffer[OUTPUT_BYTES];
u32 UART_ReceiveBuffer[INPUT_BYTES];
u32 AXI_ReceiveBuffer[INPUT_BYTES];

// Peripherals
XLlFifo FifoInstance;
XUartPs Uart_Ps;
XTmrCtr TimerCounter;
XLlFifo AxiFifo;

u32 StartTime;
u32 AxiSendDuration;
u32 MatmulDuration;

/************************** Function Prototypes ***************************/
void user_setup(void);
void user_loop(void);
void matrix_multiply(u32* matrice_buffer, uint8_t* result, uint8_t num_rows_a, uint8_t num_inner_dim, uint8_t num_cols_b);

void user_setup(void)
{
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
}

void user_loop(void)
{
	// Receive data from UART to Rxbuffer
	UART_RxToBuffer(&Uart_Ps, UART_ReceiveBuffer, INPUT_BYTES);
	// Start Timer
	StartTime = TIMER_Start(&TimerCounter, TIMER_COUNTER_0);

	// Send data from RxBuffer to AXI FIFO
	XLlFifo_TxSend(&AxiFifo, UART_ReceiveBuffer, sizeof(UART_ReceiveBuffer) / sizeof(UART_ReceiveBuffer[0]));
	// Receive data from AXI FIFO in loopback mode
	XLlFifo_RxReceive(&AxiFifo, AXI_ReceiveBuffer, sizeof(AXI_ReceiveBuffer) / sizeof(AXI_ReceiveBuffer[0]));
	AxiSendDuration = TIMER_GetDurationFromStart(&TimerCounter, TIMER_COUNTER_0, StartTime);

	// Perform Matmul on ouput of AXI FIFO and store in SendBuffer
	matrix_multiply(AXI_ReceiveBuffer, UART_TransmitBuffer, NUM_ROWS_A, NUM_INNER_DIM, NUM_COLS_B);
	MatmulDuration = TIMER_GetDurationFromStart(&TimerCounter, TIMER_COUNTER_0, AxiSendDuration);

	// Write to UART
	UART_TxFromBuffer(&Uart_Ps, UART_TransmitBuffer, OUTPUT_BYTES);
	UART_TxFromBuffer(&Uart_Ps, (u8*)&AxiSendDuration, 4);
	UART_TxFromBuffer(&Uart_Ps, (u8*)&MatmulDuration, 4);
}

int main(void)
{
	user_setup();
	while (1) {
#ifndef PROFILING
		user_loop();
#else
		XLlFifo_TxSend(&AxiFifo, UART_ReceiveBuffer, sizeof(UART_ReceiveBuffer) / sizeof(UART_ReceiveBuffer[0]));
		XLlFifo_RxReceive(&AxiFifo, AXI_ReceiveBuffer, sizeof(AXI_ReceiveBuffer) / sizeof(AXI_ReceiveBuffer[0]));
		matrix_multiply(AXI_ReceiveBuffer, UART_TransmitBuffer, NUM_ROWS_A, NUM_INNER_DIM, NUM_COLS_B);
#endif
	}
	return 1;
}

void matrix_multiply(u32* matrice_buffer, uint8_t* result, uint8_t num_rows_a, uint8_t num_inner_dim, uint8_t num_cols_b)
{
	for (size_t i = 0; i < num_rows_a; i++) {
		for (size_t j = 0; j < num_cols_b; j++) {
			u32 temp = 0;
			for (size_t k = 0; k < num_inner_dim; k++) {
				temp +=
					(matrice_buffer[i * num_inner_dim + k] * matrice_buffer[(num_rows_a * num_inner_dim) + k * num_cols_b + j]);
			}
			result[i * num_cols_b + j] = temp >> 8;
		}
	}
}