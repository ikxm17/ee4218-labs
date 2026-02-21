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
 * @brief
 *
 * @param TxConfig
 * @return uint8_t
 */
uint8_t XLlFifo_TxSend(XLlFifo_TxConfig* TxConfig)
{
	u32 TotalWords = TxConfig->tx_params->number_of_packets * TxConfig->tx_params->max_packet_length;

	for (size_t i = 0; i < TotalWords; i++) {
		// Wait until there is at least one slot available
		while (XLlFifo_iTxVacancy(TxConfig->instance_ptr) == 0)
			;

		XLlFifo_TxPutWord(TxConfig->instance_ptr, *(TxConfig->source_addr + i));
	}

	// TLR write must be in BYTES (Words * 4)
	XLlFifo_iTxSetLen(TxConfig->instance_ptr, TxConfig->tx_params->transmission_length);

	while (!(XLlFifo_IsTxDone(TxConfig->instance_ptr)))
		;

	return XST_SUCCESS;
}

/**
 * @brief
 *
 * @param RxConfig
 * @return uint8_t
 */
uint8_t XLlFifo_RxReceive(XLlFifo_RxConfig* RxConfig)
{
	// 1. Wait for the FIFO to report that at least one packet is available
	while (XLlFifo_iRxOccupancy(RxConfig->instance_ptr) == 0)
		;

	// 2. Read the length register ONCE to "unlock" the packet
	u32 BytesToRead = XLlFifo_iRxGetLen(RxConfig->instance_ptr);
	u32 WordsToRead = BytesToRead / 4;

	// 3. Read the words
	for (size_t i = 0; i < WordsToRead; i++) {
		*(RxConfig->destination_addr + i) = XLlFifo_RxGetWord(RxConfig->instance_ptr);
	}

	return XLlFifo_IsRxDone(RxConfig->instance_ptr) ? XST_SUCCESS : XST_FAILURE;
}