/**
 * @file user_xllfifo.c
 * @author your name (you@domain.com)
 * @brief
 * @version 0.1
 * @date 2026-02-13
 *
 * @copyright Copyright (c) 2026
 *
 */

#include "user_xllfifo.h"
#include <xllfifo.h>
#include <xllfifo_hw.h>

/* Init Function for AXI FIFO Instance */
#ifndef SDT
int AXI_Init(XLlFifo* AxiFifo, u8 DeviceId)
#else
int AXI_Init(XLlFifo* AxiFifo, u32 BaseAddress)
#endif
{
	int             Status = XST_SUCCESS;
	XLlFifo_Config* Config;
#ifndef SDT
	Config = XLlFfio_LookupConfig(DeviceId);
#else
	Config = XLlFfio_LookupConfig(BaseAddress);
#endif

	Status = XLlFifo_CfgInitialize(AxiFifo, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to initialize AXI FIFO \n\r");
		xil_printf("--- Exiting main() ---\n\r");
		return XST_FAILURE;
	}

	Status = XLlFifo_Status(AxiFifo);
	XLlFifo_IntClear(AxiFifo, 0xffffffff);
	Status = XLlFifo_Status(AxiFifo);
	if (Status != 0x0) {
		xil_printf(
			"\n ERROR : Reset value of ISR0 : 0x%x\t"
			"Expected : 0x0\n\r",
			XLlFifo_Status(AxiFifo)
		);
		return XST_FAILURE;
	}
	return Status;
}

/**
 * @brief Transmit function for AXI FIFO.
 *
 * @param InstancePtr
 * @param BufferPtr
 * @param NumWords
 * @return u8
 */
u8 XLlFifo_TxSend(XLlFifo* InstancePtr, u32* BufferPtr, u32 NumWords)
{
	u32       words_written     = 0;
	u32       words_transmitted = 0;
	const u32 words_to_bytes    = 4;
	volatile u32 vacancy = XLlFifo_iTxVacancy(InstancePtr);
	volatile u32 isr = XLlFifo_IntPending(InstancePtr);
	while (words_transmitted < NumWords) {
		words_written = 0;
		while (XLlFifo_iTxVacancy(InstancePtr) != 0 && (words_transmitted + words_written) < NumWords) {
			XLlFifo_TxPutWord(InstancePtr, BufferPtr[words_transmitted + words_written]);
			words_written++;
			vacancy = XLlFifo_iTxVacancy(InstancePtr);
			isr = XLlFifo_IntPending(InstancePtr);
		}
		XLlFifo_IntClear(InstancePtr, XLLF_INT_TC_MASK);
		XLlFifo_iTxSetLen(InstancePtr, words_written * words_to_bytes);
		while (!XLlFifo_IsTxDone(InstancePtr)) {
			vacancy = XLlFifo_iTxVacancy(InstancePtr);
			isr = InstancePtr ->BaseAddress + XLLF_ISR_OFFSET;
		};
		words_transmitted += words_written;
	}
	return XST_SUCCESS;
}

/**
 * @brief Receive function for AXI FIFO.
 *
 * @param InstancePtr
 * @param BufferPtr
 * @param NumWords
 * @return u8
 */
u8 XLlFifo_RxReceive(XLlFifo* InstancePtr, u32* BufferPtr, u32 NumWords)
{
	u32       words_received = 0;
	const u32 bytes_per_word = 4;
	u32 volatile occupancy = XLlFifo_RxOccupancy(InstancePtr);
	while (words_received < NumWords) {
		while (!XLlFifo_iRxOccupancy(InstancePtr)) {
			occupancy = XLlFifo_iRxOccupancy(InstancePtr);			
		};
		u32 packet_bytes = XLlFifo_iRxGetLen(InstancePtr);
		u32 packet_words = packet_bytes / bytes_per_word;

		for (size_t words = 0; words < packet_words; words++) {
			BufferPtr[words_received + words] = XLlFifo_RxGetWord(InstancePtr);
		}
		words_received += packet_words;
	}
	return XST_SUCCESS;
}