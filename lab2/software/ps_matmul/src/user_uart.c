/******************************************************************************
* Copyright (C) 2010 - 2021 Xilinx, Inc.  All rights reserved.
* Copyright (C) 2022 - 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/***************************** Include Files *******************************/
#include "user_uart.h"
#include "xparameters.h"
#include "xuartps.h"
#include "xstatus.h"
// #include "xil_assert.h"
#include "xuartps_hw.h"
#include "xil_printf.h"
#include "xil_cache.h"

/**************************************************************************/
/* Init function for UART Driver Instance */
#ifndef SDT
	int UART_Init(XUartPs *Uart_Ps, u16 DeviceId)
#else
	int UART_Init(XUartPs *Uart_Ps, UINTPTR BaseAddress)
#endif
{	
	int Status = XST_SUCCESS;
	XUartPs_Config *Config;

	/*
	 * Initialize the UART driver so that it's ready to use
	 * Look up the configuration in the config table and then initialize it.
	 */
#ifndef SDT
	Config = XUartPs_LookupConfig(DeviceId);
#else
	Config = XUartPs_LookupConfig(BaseAddress);
#endif
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(Uart_Ps, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XUartPs_SetBaudRate(Uart_Ps, 115200);
	return Status;
}

/* Read from UART into Buffer */
u32 UART_RxToBuffer(XUartPs *Uart_Ps, u8 *BufferPtr, u32 NumBytes){
	/* Block receiving the buffer before data is fully transferred */
	u32 ReceivedCount = 0;
	while (ReceivedCount < NumBytes) {
		ReceivedCount +=
			XUartPs_Recv(Uart_Ps, (BufferPtr + ReceivedCount),
				      (NumBytes - ReceivedCount));
	}
	// returns number of bytes received
	return ReceivedCount;
}
/* Read from Buffer into UART */
u32 UART_TxFromBuffer(XUartPs *Uart_Ps, u8 *BufferPtr, u32 NumBytes){
	return XUartPs_Send(Uart_Ps, BufferPtr, NumBytes);
}
