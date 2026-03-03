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

	/* 1. Hardware Reset the DMA */
    XAxiDma_Reset(AxiDma);

    /* 2. Wait for the hardware to finish resetting */
    // In Run mode, the CPU might skip past this before the HW is ready
    int TimeOut = 10000; 
    while (TimeOut > 0) {
        if (XAxiDma_ResetIsDone(AxiDma)) {
            break;
        }
        TimeOut--;
    }
    
    if (TimeOut <= 0) {
        xil_printf("DMA Reset Failed!\r\n");
        return XST_FAILURE;
    }

    if(XAxiDma_HasSg(AxiDma)) return XST_FAILURE;

	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	// Xil_DCacheDisable(); // uncomment this as a last resort, which will avoid all cache related issues, but at the expense of performance.)
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

// int DMA_RxTx(XAxiDma *AxiDma, u32* InputSrcBufferPtr, u32* OutputDestBufferPtr, u32 NumInputWords, u32 NumOutputWords){
// 	int Status;
// 	// reset the DMA before each data read
// 	XAxiDma_Reset(AxiDma);
// 	while(!XAxiDma_ResetIsDone(AxiDma));
	
// 	// Cache flush to ensure input data is updated
// 	Xil_DCacheFlushRange((UINTPTR)InputSrcBufferPtr, 4*NumInputWords);
// 	Xil_DCacheInvalidateRange((u32) OutputDestBufferPtr, 4*NumOutputWords);

// 	// Start receive first to ensure that DMA is ready to check for M_AXIS_TLAST
// 	Status = XAxiDma_SimpleTransfer(AxiDma, (u32) OutputDestBufferPtr, 4*NumOutputWords, XAXIDMA_DEVICE_TO_DMA);
// 	if (Status != XST_SUCCESS) return XST_FAILURE;
// 	// Now send inputs to matmul IP
// 	Status = XAxiDma_SimpleTransfer(AxiDma, (u32) InputSrcBufferPtr, 4*NumInputWords, XAXIDMA_DMA_TO_DEVICE);
// 	if (Status != XST_SUCCESS) return XST_FAILURE;
// 	// Poll for results from DMA
// 	while (XAxiDma_Busy(AxiDma, XAXIDMA_DEVICE_TO_DMA)) {
//         /* Wait */
// 		// for debug
// 		u32 tx_sr = XAxiDma_ReadReg(AxiDma->RegBase, 0x04); // MM2S_SR
// 		u32 rx_sr = XAxiDma_ReadReg(AxiDma->RegBase, 0x34); // S2MM_SR
// 	}
	
// 	/* Invalidate the DestBuffer before receiving the data, in case the Data Cache is enabled */
// 	Xil_DCacheInvalidateRange((u32) OutputDestBufferPtr, 4*NumOutputWords);

// }
int DMA_RxTx(XAxiDma *AxiDma, u32* InPtr, u32* OutPtr, u32 InLen, u32 OutLen) {
    // 1. Check if we are already in error
    u32 sr = XAxiDma_ReadReg(AxiDma->RegBase, 0x04);
    if (sr & 0x70) { // Check for any error bits (4, 5, 6)
        xil_printf("DMA in error (0x%x). Resetting...\r\n", sr);
        XAxiDma_Reset(AxiDma);
        while(!XAxiDma_ResetIsDone(AxiDma));
    }
	u32 sr_rx = XAxiDma_ReadReg(AxiDma->RegBase, 0x34);
	if (sr_rx & 0x70) { 
		xil_printf("S2MM Error (0x%x). Hard Resetting...\r\n", sr_rx);
		XAxiDma_Reset(AxiDma);
		while(!XAxiDma_ResetIsDone(AxiDma));
	}

    // 2. Alignment Check Print (Debug)
    if (((UINTPTR)InPtr & 0x3) || ((UINTPTR)OutPtr & 0x3)) {
        xil_printf("ERROR: Buffers are not 4-byte aligned!\r\n");
        return XST_FAILURE;
    }

    // 3. Flush/Invalidate
    Xil_DCacheFlushRange((UINTPTR)InPtr, InLen * 4);
    Xil_DCacheInvalidateRange((UINTPTR)OutPtr, OutLen * 4);
	// Memory Barrier: Ensure cache ops finish before DMA starts
	dsb();
	
    // 4. Kick off (S2MM first, then MM2S)
    XAxiDma_SimpleTransfer(AxiDma, (UINTPTR)OutPtr, OutLen * 4, XAXIDMA_DEVICE_TO_DMA);
	while(XAxiDma_ReadReg(AxiDma->RegBase, 0x34) & XAXIDMA_HALTED_MASK);
    XAxiDma_SimpleTransfer(AxiDma, (UINTPTR)InPtr, InLen * 4, XAXIDMA_DMA_TO_DEVICE);

    // 5. Poll S2MM (Wait for TLAST from MatMul)
    while (XAxiDma_Busy(AxiDma, XAXIDMA_DEVICE_TO_DMA)) {
        u32 current_sr = XAxiDma_ReadReg(AxiDma->RegBase, 0x34);
        if (current_sr & 0x70) {
             xil_printf("DMA Crashed during RX! SR: 0x%08x\r\n", current_sr);
             break; 
        }
    }

    Xil_DCacheInvalidateRange((UINTPTR)OutPtr, OutLen * 4);
    return XST_SUCCESS;
}