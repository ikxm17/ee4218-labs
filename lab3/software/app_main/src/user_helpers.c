/**
 * @file user_helpers.c
 * @author your name (you@domain.com)
 * @brief
 * @version 0.1
 * @date 2026-02-25
 *
 * @copyright Copyright (c) 2026
 *
 */

#include "user_helpers.h"

void u8_to_u32(uint8_t* source, uint32_t* destination, uint32_t len)
{
	for (size_t i = 0; i < len; i++) destination[i] = (uint32_t)source[i];
}

void u32_to_u8(uint32_t* source, uint8_t* destination, uint32_t len)
{
	for (size_t i = 0; i < len; i++) destination[i] = (uint8_t)(source[i] & 0xFF);
}