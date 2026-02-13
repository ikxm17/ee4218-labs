/***************************** Include Files *******************************/
#include "uart_to_axi_fifo.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"
#include "xllfifo.h"

/************************** Variable Definitions ***************************/
XLlFifo FifoInstance;

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
	int Status;

	/* Run the uart to fifo write function */
#ifndef SDT
	Status = UartToAxiFifo(UART_BASEADDR, &FifoInstance, FIFO_DEV_ID);
#else
	Status = UartToAxiFifo(UART_BASEADDR, &FifoInstance, XPAR_XLLFIFO_0_BASEADDR);
#endif
	
	if (Status != XST_SUCCESS) {
		xil_printf("Axi Streaming FIFO Polling Example Test Failed\n\r");
		xil_printf("--- Exiting main() ---\n\r");
		return XST_FAILURE;
	}

	xil_printf("Successfully ran Axi Streaming FIFO Polling Example\n\r");
	xil_printf("--- Exiting main() ---\n\r");

	return XST_SUCCESS;
}