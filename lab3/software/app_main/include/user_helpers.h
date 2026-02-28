/**
 * @file user_helpers.h
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2026-02-25
 * 
 * @copyright Copyright (c) 2026
 * 
 */

#ifndef USER_HELPERS_H
#define USER_HELPERS_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stddef.h>

void u8_to_u32(uint8_t* source, uint32_t* destination, uint32_t len);
void u32_to_u8(uint32_t* source, uint8_t* destination, uint32_t len);

#ifdef __cplusplus
}
#endif
#endif /* USER_HELPERS_H */
