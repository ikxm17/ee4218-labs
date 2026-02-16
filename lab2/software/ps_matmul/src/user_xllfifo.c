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
    /* Write into the FIFO Transmit Port Buffer */
    for (size_t packet = 0; packet < TxConfig->tx_params->number_of_packets; packet++)
    {
        for (size_t len = 0; len < TxConfig->tx_params->max_packet_length; len++)
        {
            if (XLlFifo_iTxVacancy(TxConfig->instance_ptr))
            {
                XLlFifo_TxPutWord(TxConfig->instance_ptr, *(TxConfig->source_addr + (packet * TxConfig->tx_params->max_packet_length) + len));
            }
        }
    }

    /* Start transmission by writing transmission length (number of packets * packet length * word size) into the TLR */
    XLlFifo_iTxSetLen(TxConfig->instance_ptr, TxConfig->tx_params->transmission_length);

    /* Wait for transmission completion */
    while (!(XLlFifo_IsTxDone(TxConfig->instance_ptr)))
    {
        ;
    }

    /* Transmission Complete */
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
    uint32_t rx_word;
    static uint32_t rcv_len;
    while (XLlFifo_iRxOccupancy(RxConfig->instance_ptr) == 0)
    {
        rcv_len = XLlFifo_iRxGetLen(RxConfig->instance_ptr) / RxConfig->rx_params->word_size;
    }
    for (size_t len = 0; len < rcv_len; len++)
    {
        rx_word = XLlFifo_RxGetWord(RxConfig->instance_ptr);
        *(RxConfig->destination_addr + len) = rx_word;
    }

    if (XLlFifo_IsRxDone(RxConfig->instance_ptr) != TRUE)
    {
        return XST_FAILURE;
    }
    else
    {
        return XST_SUCCESS;
    }
}