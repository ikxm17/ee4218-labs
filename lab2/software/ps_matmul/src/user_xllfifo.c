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

/**
 * @brief
 *
 * @param TxConfig
 * @return uint8_t
 */
uint8_t XLlFifo_TxSend(XLlFifo_TxConfig *TxConfig)
{
    u32 TotalWords = TxConfig->tx_params->number_of_packets * TxConfig->tx_params->max_packet_length;

    for (size_t i = 0; i < TotalWords; i++)
    {
        // Wait until there is at least one slot available
        while (XLlFifo_iTxVacancy(TxConfig->instance_ptr) == 0);
        
        XLlFifo_TxPutWord(TxConfig->instance_ptr, *(TxConfig->source_addr + i));
    }

    // TLR write must be in BYTES (Words * 4)
    XLlFifo_iTxSetLen(TxConfig->instance_ptr, TxConfig->tx_params->transmission_length);

    while (!(XLlFifo_IsTxDone(TxConfig->instance_ptr)));

    return XST_SUCCESS;
}

/**
 * @brief 
 * 
 * @param RxConfig 
 * @return uint8_t 
 */
uint8_t XLlFifo_RxReceive(XLlFifo_RxConfig *RxConfig)
{
    // 1. Wait for the FIFO to report that at least one packet is available
    while (XLlFifo_iRxOccupancy(RxConfig->instance_ptr) == 0);

    // 2. Read the length register ONCE to "unlock" the packet
    u32 BytesToRead = XLlFifo_iRxGetLen(RxConfig->instance_ptr);
    u32 WordsToRead = BytesToRead / 4; 

    // 3. Read the words
    for (size_t i = 0; i < WordsToRead; i++)
    {
        *(RxConfig->destination_addr + i) = XLlFifo_RxGetWord(RxConfig->instance_ptr);
    }

    return XLlFifo_IsRxDone(RxConfig->instance_ptr) ? XST_SUCCESS : XST_FAILURE;
}