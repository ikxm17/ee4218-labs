#ifndef USER_UART_H
#define USER_UART_H

/***************************** Include Files *******************************/
#include "xil_types.h"
#include "xuartps.h"

/************************** Constant Definitions ***************************/

/************************** Function Prototypes ****************************/

int UART_Init(XUartPs *Uart_Ps, UINTPTR BaseAddress);

u32 UART_RxToBuffer(XUartPs *Uart_Ps, u32 *BufferPtr, u32 NumBytes);
u32 UART_TxFromBuffer(XUartPs *Uart_Ps, u8 *BufferPtr, u32 NumBytes);

#endif /* USER_UART_H */