#include "user_axi_dma.h"
#include "xaxidma.h"
#include "xil_types.h"
#include "xparameters.h"

int DMA_Init(XAxiDma* AxiDma, uintptr_t DeviceId)
{
	/* Initialize the XAxiDma device in simple mode for polling*/
	XAxiDma_Config* Config;
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

	if (XAxiDma_HasSg(AxiDma))
		return XST_FAILURE;

	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	// uncomment this as a last resort, which will avoid all cache related issues, but at the expense of performance.
	// Xil_DCacheDisable();
	return XST_SUCCESS;
}

/**
 * @brief Transmit data to connected device with AXI DMA
 *
 * @param AxiDma
 * @param SrcBufferPtr
 * @param DestBufferPtr
 * @param NumBytes
 * @return uint8_t
 */
uint8_t DMA_TxSend(XAxiDma* AxiDma, uintptr_t TxBufferPtr, uintptr_t SrcBufferPtr, uint32_t NumBytes)
{
	// Write data to the specified TX buffer address
	memcpy((void*)TxBufferPtr, (void*)SrcBufferPtr, NumBytes);

	// Cache flush to update the memory in case the specified TX buffer address is in the cache line
	Xil_DCacheFlushRange((uintptr_t)(TxBufferPtr), NumBytes);

	// Initiate a DMA transfer from memory to the device through AXI DMA
	if (XAxiDma_SimpleTransfer(AxiDma, (uintptr_t)(TxBufferPtr), NumBytes, XAXIDMA_DMA_TO_DEVICE) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	while (XAxiDma_Busy(AxiDma, XAXIDMA_DMA_TO_DEVICE)); // wait for transfer to complete

	// Transmission Complete
	return XST_SUCCESS;
}

/**
 * @brief Receive data from connected device with AXI DMA
 *
 * @param AxiDma
 * @param RxBufferPtr
 * @param DestBufferPtr
 * @param NumBytes
 * @return uint8_t
 */
uint8_t DMA_RxReceive(XAxiDma* AxiDma, uintptr_t RxBufferPtr, uintptr_t DestBufferPtr, uint32_t NumBytes)
{
	// Initiate a DMA transfer from the device to memory through AXI DMA
	if (XAxiDma_SimpleTransfer(AxiDma, (uintptr_t)(RxBufferPtr), NumBytes, XAXIDMA_DEVICE_TO_DMA) != XST_SUCCESS) {
		return XST_FAILURE;
	}
	while (XAxiDma_Busy(AxiDma, XAXIDMA_DEVICE_TO_DMA)); // wait for transfer to complete

	// Invalidate to force a cache update in case the specifed RX buffer address is in the cache line
	Xil_DCacheInvalidateRange((uintptr_t)(RxBufferPtr), NumBytes);

	// Write data to the specified destination buffer address
	memcpy((void*)DestBufferPtr, (void*)RxBufferPtr, NumBytes);

	// Reception Complete
	return XST_SUCCESS;
}