/***************************** Include Files *******************************/
#include "user_uart.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_types.h"
#include "xuartps.h"
#include "xil_printf.h"
#include "xllfifo.h"

/************************** Variable Definitions ***************************/
XLlFifo FifoInstance;
XUartPs Uart_Ps;

#ifndef SDT
#define UART_DEVICE_ID          XPAR_XUARTPS_0_DEVICE_ID
#else
#define	XUARTPS_BASEADDRESS		XPAR_XUARTPS_0_BASEADDR
#endif

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
	Status = initUart(&Uart_Ps, UART_DEVICE_ID);
	
	uartToBuffer(&Uart_Ps, *ReceiveBuffer, INPUT_BYTES);
	if (Status != XST_SUCCESS) {
		xil_printf("Axi Streaming FIFO Polling Example Test Failed\n\r");
		xil_printf("--- Exiting main() ---\n\r");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran Axi Streaming FIFO Polling Example\n\r");
	xil_printf("--- Exiting main() ---\n\r");

	return XST_SUCCESS;
}