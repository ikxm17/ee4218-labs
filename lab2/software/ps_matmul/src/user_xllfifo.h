/**
 * @file user_xllfifo.h
 * @author your name (you@domain.com)
 * @brief
 * @version 0.1
 * @date 2026-02-13
 *
 * @copyright Copyright (c) 2026
 *
 */

#ifndef __XLLFIFO_H__
#define __XLLFIFO_H__

#ifdef __cplusplus
extern "C" {
#endif
/*
 * INCLUDES
 */
#include <stdint.h>
#include "xllfifo.h"

typedef struct
{
	uint32_t word_size;
	uint32_t number_of_packets;
	uint32_t max_packet_length;
	uint32_t transmission_length;
} XLlFifo_TxParams;

typedef struct
{
	XLlFifo*          instance_ptr;
	uint32_t*         source_addr;
	XLlFifo_TxParams* tx_params;
} XLlFifo_TxConfig;

typedef struct
{
	uint32_t word_size;
} XLlFifo_RxParams;

typedef struct
{
	XLlFifo*          instance_ptr;
	uint32_t*         destination_addr;
	XLlFifo_RxParams* rx_params;
} XLlFifo_RxConfig;

#ifndef SDT
int AXI_Init(XLlFifo* AxiFifo, u8 DeviceId);
#else
int AXI_Init(XLlFifo* AxiFifo, u32 BaseAddress);
#endif
u8 XLlFifo_TxSend(XLlFifo* InstancePtr, u32* BufferPtr, u32 NumWords);
u8 XLlFifo_RxReceive(XLlFifo* InstancePtr, u32* BufferPtr, u32 NumWords);

#ifdef __cplusplus
}
#endif
#endif /* __XLLFIFO_H__ */