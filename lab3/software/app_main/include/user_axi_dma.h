#ifndef USER_AXI_DMA_H
#define USER_AXI_DMA_H
#endif
/***************************** Include Files *******************************/
#include "xaxidma.h"
#include "xil_types.h"
#include "xparameters.h"

/************************** Constant Definitions ***************************/

/************************** Function Prototypes ****************************/

int     DMA_Init(XAxiDma* AxiDma, uintptr_t DeviceId);
uint8_t DMA_TxSend(XAxiDma* AxiDma, uintptr_t TxBufferPtr, uintptr_t SrcBufferPtr, uint32_t NumBytes);
uint8_t DMA_RxReceive(XAxiDma* AxiDma, uintptr_t RxBufferPtr, uintptr_t DestBufferPtr, uint32_t NumBytes);