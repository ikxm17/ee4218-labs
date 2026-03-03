/**
 * @file main.c
 * @author your name (you@domain.com)
 * @brief
 * @version 0.1
 * @date 2026-02-24
 *
 * @copyright Copyright (c) 2026
 *
 */

#include "main.h"
#include "user_axi_timer.h"
#include "user_uart.h"
#include "user_xllfifo.h"
#include "user_axi_dma.h"
#include "user_helpers.h"

#include "xil_printf.h"
#include "xil_types.h"

/************************** Variable Definitions ***************************/
// Buffers
uint8_t  uart_txbuf[OUTPUT_BYTES];
uint32_t uart_rxbuf[INPUT_BYTES];
uint32_t axi_rxbuf[OUTPUT_BYTES];

// Peripherals
XLlFifo axi_fifo;
XUartPs uart_ps;
XTmrCtr timer_counter;
XAxiDma axi_dma;

// Variables for measuring time taken
uint32_t start_time;
uint32_t matmul_with_software_duration;
uint32_t matmul_with_fifo_duration;
uint32_t matmul_with_dma_duration;

/************************** Function Prototypes ***************************/
void user_setup(void), user_loop(void);
void matrix_multiply(uint32_t* matrice_buffer, uint8_t* result, uint8_t num_rows_a, uint8_t num_inner_dim, uint8_t num_cols_b);

int main(void)
{
	user_setup();
	while (1) {
		user_loop();
	}
	return 1;
}

void user_setup(void)
{

// Initalise UART
	UART_Init(&uart_ps, XUARTPS_BASEADDRESS);

// Initalise Timer
	TIMER_Init(&timer_counter, XTMRCTR_BASEADDRESS, TIMER_COUNTER_0);

// Initialise AXI FIFO
	AXI_Init(&axi_fifo, XLLFIFO_BASEADDRESS);

DMA_Init(&axi_dma, AXIDMA_BASE_ADDR);
}

void user_loop(void)
{
	// Receive input matrices from UART peripheral and UART receive buffer
	UART_RxToBuffer(&uart_ps, uart_rxbuf, INPUT_BYTES);

	/* Software matrix multiplication */
	// Start timer for collecting time measurements
	start_time = TIMER_Start(&timer_counter, TIMER_COUNTER_0);
	matrix_multiply(uart_rxbuf, uart_txbuf, NUM_ROWS_A, NUM_INNER_DIM, NUM_COLS_B);
	matmul_with_software_duration = TIMER_GetDurationFromStart(&timer_counter, TIMER_COUNTER_0, start_time);
	// Transmit result and time taken for software matrix multiplication through UART
	UART_TxFromBuffer(&uart_ps, (uint8_t*)(uart_txbuf), OUTPUT_BYTES);
	UART_TxFromBuffer(&uart_ps, (uint8_t*)&matmul_with_software_duration, 4);

	/* Co-processor matrix multiplication interfaced via AXI Stream FIFO */
	// Start timer for collecting time measurements
	memset(uart_txbuf, 0, OUTPUT_BYTES); 
	start_time = TIMER_Start(&timer_counter, TIMER_COUNTER_0);
	// Send input matrices from UART receive buffer to AXI Stream FIFO
	XLlFifo_TxSend(&axi_fifo, uart_rxbuf, sizeof(uart_rxbuf) / sizeof(uart_rxbuf[0]));
	// Receive result from co-processor through AXI Stream FIFO
	XLlFifo_RxReceive(&axi_fifo, axi_rxbuf, sizeof(axi_rxbuf) / sizeof(axi_rxbuf[0]));
	matmul_with_fifo_duration = TIMER_GetDurationFromStart(&timer_counter, TIMER_COUNTER_0, start_time);
	// Transmit result and time taken for co-processor matrix multiplication through UART
	u32_to_u8(axi_rxbuf, uart_txbuf, OUTPUT_BYTES);
	UART_TxFromBuffer(&uart_ps, (uint8_t*)(uart_txbuf), OUTPUT_BYTES);
	UART_TxFromBuffer(&uart_ps, (uint8_t*)&matmul_with_fifo_duration, 4);

	/* Co-processor matrix multiplication interfaced with AXI DMA */
	// set output buffer to 0 for proper result checking
	memset(uart_txbuf, 0, OUTPUT_BYTES); 
	start_time = TIMER_Start(&timer_counter, TIMER_COUNTER_0);
	DMA_TxSend(&axi_dma, (uintptr_t)AXIDMA_TX_BUFFER_ADDR, (uintptr_t)uart_rxbuf, INPUT_BYTES * sizeof(uint32_t));
	DMA_RxReceive(&axi_dma, (uintptr_t)AXIDMA_RX_BUFFER_ADDR, (uintptr_t)axi_rxbuf, OUTPUT_BYTES * sizeof(uint32_t));
	matmul_with_dma_duration = TIMER_GetDurationFromStart(&timer_counter, TIMER_COUNTER_0, start_time);
	u32_to_u8(axi_rxbuf, uart_txbuf, OUTPUT_BYTES);
	UART_TxFromBuffer(&uart_ps, (uint8_t*)(uart_txbuf), OUTPUT_BYTES);
	UART_TxFromBuffer(&uart_ps, (uint8_t*)&matmul_with_dma_duration, 4);

}

void matrix_multiply(uint32_t* matrice_buffer, uint8_t* result, uint8_t num_rows_a, uint8_t num_inner_dim, uint8_t num_cols_b)
{
	for (size_t i = 0; i < num_rows_a; i++) {
		for (size_t j = 0; j < num_cols_b; j++) {
			uint32_t temp = 0;
			for (size_t k = 0; k < num_inner_dim; k++) {
				temp +=
					(matrice_buffer[i * num_inner_dim + k] * matrice_buffer[(num_rows_a * num_inner_dim) + k * num_cols_b + j]);
			}
			result[i * num_cols_b + j] = temp >> 8;
		}
	}
}