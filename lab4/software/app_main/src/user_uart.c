/******************************************************************************
 * Copyright (C) 2010 - 2021 Xilinx, Inc.  All rights reserved.
 * Copyright (C) 2022 - 2023 Advanced Micro Devices, Inc. All Rights Reserved.
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

/***************************** Include Files *******************************/
#include "user_uart.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xuartps.h"
// #include "xil_assert.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xuartps_hw.h"

/**************************************************************************/
/* Init function for UART Driver Instance */
int UART_Init(XUartPs* Uart_Ps, UINTPTR BaseAddress)
{
	int             Status = XST_SUCCESS;
	XUartPs_Config* Config;

	/*
	 * Initialize the UART driver so that it's ready to use
	 * Look up the configuration in the config table and then initialize it.
	 */
	Config = XUartPs_LookupConfig(BaseAddress);
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
u32 UART_RxToBuffer(XUartPs* Uart_Ps, u32* BufferPtr, u32 NumBytes)
{
	/* Block receiving the buffer before data is fully transferred */
	u32 ReceivedCount = 0;
	u32 Received      = 0;
	u8  TempByte;
	while (ReceivedCount < NumBytes) {
		Received = XUartPs_Recv(Uart_Ps, &TempByte, 1);
		if (Received) {
			BufferPtr[ReceivedCount] = (u32)TempByte;
			ReceivedCount            = ReceivedCount + Received;
		}
	}
	// returns number of bytes received
	return ReceivedCount;
}

/* Read from Buffer into UART */
u32 UART_TxFromBuffer(XUartPs* Uart_Ps, u8* BufferPtr, u32 NumBytes)
{
	u32 bytes_sent = XUartPs_Send(Uart_Ps, BufferPtr, NumBytes);
	while (XUartPs_IsSending(Uart_Ps));
	return bytes_sent;
}
