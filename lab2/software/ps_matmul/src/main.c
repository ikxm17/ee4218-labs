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

/************************** Variable Definitions ***************************/
XLlFifo FifoInstance;
XUartPs Uart_Ps;
XTmrCtr TimerCounter;

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



#define NO_INPUT_ELEMENTS 20
#define ELEMENT_SIZE_IN_BYTES 4
#define INPUT_BYTES NO_INPUT_ELEMENTS*ELEMENT_SIZE_IN_BYTES
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
		xil_printf("Axi Streaming FIFO Polling Example Test Failed\n\r");
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