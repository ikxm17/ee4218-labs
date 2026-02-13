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

typedef struct {
    u32 word_size;
    u32 number_of_packets;
    u32 max_packet_length;
    u32 transmission_length;
} XLlFifo_TxParams;

typedef struct {
    XLlFifo* instance_ptr;
    u32* source_addr;
    XLlFifo_TxParams* tx_params;
} XLlFifo_TxConfig;

typedef struct {
    u32 word_size;
} XLlFifo_RxParams;

typedef struct {
    XLlFifo* instance_ptr;
    u32* destination_addr;
    XLlFifo_RxParams* rx_params;
} XLlFifo_RxConfig;

u8 XLlFifo_TxSend(XLlFifo_TxConfig* TxConfig);
u8 XLlFifo_RxReceive(XLlFifo_RxConfig* RxConfig);

#ifdef __cplusplus
}
#endif
#endif /* __XLLFIFO_H__ */