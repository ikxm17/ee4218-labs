#include "xil_printf.h"
#include "xparameters.h"
#include "xtmrctr.h"

int TIMER_Init(XTmrCtr* TmrCtrInstancePtr, UINTPTR BaseAddr, u8 TmrCtrNumber);
u32 TIMER_Start(XTmrCtr* TmrCtrInstancePtr, u8 TmrCtrNumber);
u32 TIMER_GetDurationFromStart(XTmrCtr* TmrCtrInstancePtr, u8 TmrCtrNumber, u32 start_val);
int TIMER_Stop(XTmrCtr* TmrCtrInstancePtr, u8 TmrCtrNumber);