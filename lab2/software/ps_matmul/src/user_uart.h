#ifndef USER_UART_H
#define USER_UART_H

/***************************** Include Files *******************************/
#include "xil_types.h"
#include "xuartps.h"

/************************** Constant Definitions ***************************/

/************************** Function Prototypes ****************************/

#ifndef SDT
int initUart(XUartPs *Uart_Ps, u16 DeviceId);
#else
int initUart(XUartPs *Uart_Ps, UINTPTR BaseAddress);
#endif

u32 uartToBuffer(XUartPs *Uart_Ps, u8 *BufferPtr, u32 NumBytes);
u32 bufferToUart(XUartPs *Uart_Ps, u8 *BufferPtr, u32 NumBytes);

#endif /* USER_UART_H */