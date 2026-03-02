#ifndef USER_AXI_DMA_H
#define USER_AXI_DMA_H
#endif
/***************************** Include Files *******************************/
#include "xil_types.h"
#include "xaxidma.h"
#include "xparameters.h"


/************************** Constant Definitions ***************************/

/************************** Function Prototypes ****************************/

int DMA_Init(XAxiDma *AxiDma, u16 DeviceId);
int DMA_TxSend(XAxiDma *AxiDma, u32* SrcBufferPtr,  u32* DestBufferPtr, u32 NumWords);
int DMA_RxReceive(XAxiDma *AxiDma, u32* SrcBufferPtr, u32* DestBufferPtr, u32 NumWords);