#include "user_axi_timer.h"
#include "xparameters.h"
#include "xtmrctr.h"
#include "xil_printf.h"

// FUNCTIONS 

//initialise Timer, return Status
	int TIMER_Init(XTmrCtr *TmrCtrInstancePtr, UINTPTR BaseAddr, u8 TmrCtrNumber)
{
	int Status;

	/*
	 * Initialize the timer counter so that it's ready to use,
	 * specify the device ID that is generated in xparameters.h
	 */
	Status = XTmrCtr_Initialize(TmrCtrInstancePtr, BaseAddr);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built
	 * correctly, use the 1st timer in the device (0)
	 */
	Status = XTmrCtr_SelfTest(TmrCtrInstancePtr, TmrCtrNumber);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the Autoreload mode of the timer counters.
	 */
	XTmrCtr_SetOptions(TmrCtrInstancePtr, TmrCtrNumber,
			   XTC_AUTO_RELOAD_OPTION);
    return Status;
}

u32 TIMER_Start(XTmrCtr *TmrCtrInstancePtr, u8 TmrCtrNumber)
{
    XTmrCtr_Start(TmrCtrInstancePtr, TmrCtrNumber);
	u32 start_val = XTmrCtr_GetValue(TmrCtrInstancePtr, TmrCtrNumber);
	return start_val;
}

u32 TIMER_GetDurationFromStart(XTmrCtr *TmrCtrInstancePtr, u8 TmrCtrNumber, u32 start_val)
{
    u32 current_val = XTmrCtr_GetValue(TmrCtrInstancePtr, TmrCtrNumber);
    return (current_val - start_val);
}
int TIMER_Stop(XTmrCtr *TmrCtrInstancePtr, u8 TmrCtrNumber)
{
    XTmrCtr_Stop(TmrCtrInstancePtr, TmrCtrNumber);
    return XST_SUCCESS;
}