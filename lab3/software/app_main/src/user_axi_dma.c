#include "xil_types.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "user_axi_dma.h"

int DMA_Init(XAxiDma *AxiDma, u16 DeviceId){
    /* Initialize the XAxiDma device in simple mode for polling*/
	XAxiDma_Config *Config;
	Config = XAxiDma_LookupConfig(DeviceId);
	if (!Config) {
	  xil_printf("No config found for %d\r\n", DeviceId);
	  return XST_FAILURE;
	}

	int Status = XAxiDma_CfgInitialize(AxiDma, Config);
	if (Status != XST_SUCCESS) {
	  xil_printf("Initialization failed %d\r\n", Status);
	  return XST_FAILURE;
	}

	if(XAxiDma_HasSg(AxiDma)){
	  xil_printf("Device configured as SG mode \r\n");
	  return XST_FAILURE;
	}

	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	//Xil_DCacheDisable(); // uncomment this as a last resort, which will avoid all cache related issues, but at the expense of performance.)
}

int DMA_TxSend(XAxiDma *AxiDma, u32* SrcBufferPtr,  u32* DestBufferPtr, u32 NumWords){
    /* Flush the SrcBuffer and DestBuffer before the DMA transfer, in case the Data Cache is enabled */
	// SrcBuffer is in DDR, DestBuffer is in the device
		Xil_DCacheFlushRange((u32)(SrcBufferPtr), 4*NumWords);
		Xil_DCacheFlushRange((u32)(DestBufferPtr), 4*NumWords);

		int Status = XAxiDma_SimpleTransfer(AxiDma,(u32) (DestBufferPtr), 4*NumWords, XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
		  return XST_FAILURE;
		}
		while (XAxiDma_Busy(AxiDma,XAXIDMA_DMA_TO_DEVICE)) {
			//wait for transfer to complete
		}

		/* Transmission Complete */
}

int DMA_RxReceive(XAxiDma *AxiDma, u32* SrcBufferPtr, u32* DestBufferPtr, u32 NumWords){
	// SrcBuffer is in the device, DestBuffer in DDR
	int Status = XAxiDma_SimpleTransfer(AxiDma,(u32) (SrcBufferPtr), 4*NumWords, XAXIDMA_DEVICE_TO_DMA);
		if (Status != XST_SUCCESS) {
		  return XST_FAILURE;
		}
		while (XAxiDma_Busy(AxiDma,XAXIDMA_DEVICE_TO_DMA)) {
			//wait for transfer to complete
		}
		/* Invalidate the DestBuffer before receiving the data, in case the Data Cache is enabled */
		Xil_DCacheInvalidateRange((u32)(DestBufferPtr), 4*NumWords);

		/* Reception Complete */
}
