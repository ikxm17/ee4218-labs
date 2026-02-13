/******************************************************************************
* Copyright (C) 2010 - 2021 Xilinx, Inc.  All rights reserved.
* Copyright (C) 2022 - 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/***************************** Include Files *******************************/
#include "uart_to_axi_fifo.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_assert.h"
#include "xuartps_hw.h"
#include "xil_printf.h"
#include "xil_cache.h"

/**************************************************************************/
/**
*
* This function receives data via UART and writes the data to AXI FIFO
* 
* @param	UartBaseAddress is the base address of the device
* @param	InstancePtr is a pointer to the XLlFifo instance
* @param	DeviceId/BaseAddress is the device identifier or base address
*
* @return	XST_SUCCESS if successful, XST_FAILURE if unsuccessful
*
* @note		None.
*
**************************************************************************/
#ifndef SDT
int UartToAxiFifo(u32 UartBaseAddress, XLlFifo *InstancePtr, u16 DeviceId)
#else
int UartToAxiFifo(u32 UartBaseAddress, XLlFifo *InstancePtr, UINTPTR BaseAddress)
#endif
{
	/* Local variables */
	u32 ReceiveBuffer[NO_OF_PACKETS];	/* Buffer for Receiving Data via UART */
	XLlFifo_Config *Config;
	int Status;
	int Index;
	u32 Running;
	u8 RecvChar;
	u32 CntrlRegister;
	
	Status = XST_SUCCESS;
	
	/* Initialize the Device Configuration Interface driver */
#ifndef SDT
	Config = XLlFfio_LookupConfig(DeviceId);
#else
	Config = XLlFfio_LookupConfig(BaseAddress);
#endif
	if (!Config) {
#ifndef SDT
		xil_printf("No config found for %d\r\n", DeviceId);
#endif
		return XST_FAILURE;
	}
	
	Status = XLlFifo_CfgInitialize(InstancePtr, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed\n\r");
		return Status;
	}
	
	/* Check for the Reset value */
	Status = XLlFifo_Status(InstancePtr);
	XLlFifo_IntClear(InstancePtr, 0xffffffff);
	Status = XLlFifo_Status(InstancePtr);
	if(Status != 0x0) {
		xil_printf("\n ERROR : Reset value of ISR0 : 0x%x\t"
			    "Expected : 0x0\n\r",
			    XLlFifo_Status(InstancePtr));
		return XST_FAILURE;
	}
	
	/* Init UART */
	CntrlRegister = XUartPs_ReadReg(UartBaseAddress, XUARTPS_CR_OFFSET);

	/* Enable TX and RX for the device */
	XUartPs_WriteReg(UartBaseAddress, XUARTPS_CR_OFFSET,
			  ((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
			   XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));
	
	/* Receive data via UART into ReceiveBuffer */
	Running = TRUE;
	Index = 0;
	while (Running) {
		/* Wait until there is data */
		while (!XUartPs_IsReceiveData(UartBaseAddress));

		RecvChar = XUartPs_ReadReg(UartBaseAddress, XUARTPS_FIFO_OFFSET);
		
		ReceiveBuffer[Index] = (u32)RecvChar;
		Index++;
		
		if ((CHAR_ESC == RecvChar) || (Index == NO_OF_PACKETS)) {
			Running = FALSE;
		}
	}

	/* Write data from ReceiveBuffer to AXI FIFO */
	for (int i = 0; i < NO_OF_PACKETS; i++) {
		/* Writing into the FIFO Transmit Port Buffer */
		if(XLlFifo_iTxVacancy(InstancePtr)) {
			XLlFifo_TxPutWord(InstancePtr,
				*(ReceiveBuffer + (i * WORD_SIZE)));
		}
	}
	
	/* Start Transmission by writing transmission length into the TLR */
	XLlFifo_iTxSetLen(InstancePtr, (NO_OF_PACKETS * WORD_SIZE));

	/* Check for Transmission completion */
	while(!(XLlFifo_IsTxDone(InstancePtr))) {
		/* Wait */
	}

	/* Transmission Complete */
	return XST_SUCCESS;
}