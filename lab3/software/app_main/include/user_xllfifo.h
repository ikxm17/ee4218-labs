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
#include "xllfifo.h"

int AXI_Init(XLlFifo* AxiFifo, u32 BaseAddress);
u8 XLlFifo_TxSend(XLlFifo* InstancePtr, u32* BufferPtr, u32 NumWords);
u8 XLlFifo_RxReceive(XLlFifo* InstancePtr, u32* BufferPtr, u32 NumWords);

#ifdef __cplusplus
}
#endif
#endif /* __XLLFIFO_H__ */