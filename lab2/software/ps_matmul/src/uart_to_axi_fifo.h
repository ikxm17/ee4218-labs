#ifndef XUARTPS_TO_FIFO_H
#define XUARTPS_TO_FIFO_H

/***************************** Include Files *******************************/
#include "xil_types.h"
#include "xllfifo.h"

/************************** Constant Definitions ***************************/
#define UART_BASEADDR		XPAR_XUARTPS_0_BASEADDR
#define UART_CLOCK_HZ		XPAR_XUARTPS_0_CLOCK_HZ
#define WORD_SIZE 			4		/* Size of words in bytes */
#define NO_OF_PACKETS 		8
#define CHAR_ESC			0x1b	/* 'ESC' character is used as terminator */

/************************** Function Prototypes ****************************/
#ifndef SDT
int UartToAxiFifo(u32 UartBaseAddress, XLlFifo *InstancePtr, u16 DeviceId);
#else
int UartToAxiFifo(u32 UartBaseAddress, XLlFifo *InstancePtr, UINTPTR BaseAddress);
#endif

#endif /* XUARTPS_TO_FIFO_H */