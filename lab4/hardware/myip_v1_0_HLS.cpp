/*
----------------------------------------------------------------------------------
--	(c) Rajesh C Panicker, NUS,
--  Description : AXI Stream Coprocessor (HLS), implementing the sum of 4 numbers
--	License terms :
--	You are free to use this code as long as you
--		(i) DO NOT post a modified version of this on any public repository;
--		(ii) use it only for educational purposes;
--		(iii) accept the responsibility to ensure that your implementation does not violate any intellectual property of any entity.
--		(iv) accept that the program is provided "as is" without warranty of any kind or assurance regarding its suitability for any particular purpose;
--		(v) send an email to rajesh.panicker@ieee.org briefly mentioning its use (except when used for the course EE4218/CEG5203 at the National University of Singapore);
--		(vi) retain this notice in this file or any files derived from this.
----------------------------------------------------------------------------------
*/

#include "hls_stream.h"
#include "ap_int.h"
#include "ap_axi_sdata.h"

#define NUM_ROWS_A    64
#define NUM_INNER_DIM 8
#define NUM_COLS_B    1
#define MAT_A_SIZE 			(NUM_ROWS_A * NUM_INNER_DIM)
#define MAT_B_SIZE 			(NUM_INNER_DIM * NUM_COLS_B)
#define NO_INPUT_ELEMENTS   (NUM_ROWS_A * NUM_INNER_DIM + NUM_INNER_DIM * NUM_COLS_B)
#define NO_OUTPUT_ELEMENTS  (NUM_ROWS_A * NUM_COLS_B) 

// ACLK, ARESETN, TREADY, TDATA, TVALID are essential signals for AXIS. New version of AXI DMA seems to expect TSTRB and/or TKEEP as well.

typedef ap_axis<32,0,0,0> AXIS;  //data, user, id, dest

void myip_v1_0_HLS(hls::stream<AXIS>& S_AXIS, hls::stream<AXIS>& M_AXIS){
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=S_AXIS
#pragma HLS INTERFACE axis port=M_AXIS

	int word_cnt;
	// ap_uint<8> sum = 0; // using arbitrary precision
	//int sum = 0;		 // using 32 bit precision
	ap_uint<32> mat_A[MAT_A_SIZE];
	ap_uint<32> mat_B[MAT_B_SIZE];
	ap_uint<32> mat_RES[NO_OUTPUT_ELEMENTS];
	
	AXIS read_input, write_output;
		// get matrices A and B
		myip_v1_0_HLS_read_inputs:for(word_cnt = 0; word_cnt < NO_INPUT_ELEMENTS; word_cnt++){
			#pragma HLS pipeline off 
			#pragma HLS UNROLL off
			read_input = S_AXIS.read();
			if (word_cnt < MAT_A_SIZE) {
				mat_A[word_cnt] = read_input.data;
			}
			else {
				mat_B[word_cnt-MAT_A_SIZE] = read_input.data;
			}
		}
		
		// compute result
		myip_v1_0_HLS_compute:for(size_t i = 0; i < NUM_ROWS_A; i++){
			#pragma HLS pipeline off 
			for (size_t j = 0; j < NUM_COLS_B; j++) {
					ap_uint<32> temp = 0;
					for (size_t k = 0; k < NUM_INNER_DIM; k++) {
						temp +=
							(mat_A[i * NUM_INNER_DIM + k] * mat_B[k * NUM_COLS_B + j]);
					}
					mat_RES[i * NUM_COLS_B + j] = temp >> 8;
				}
		}
		
		// write outputs
		myip_v1_0_HLS_write_outputs:for(word_cnt = 0; word_cnt < NO_OUTPUT_ELEMENTS; word_cnt++){
			#pragma HLS pipeline off 
			#pragma HLS UNROLL off
			write_output.data = mat_RES[word_cnt];
			write_output.last = 0;
			write_output.keep = 0xFU; //TODO: find out whwat keep and strb are
			write_output.strb = 0xFU;
			if(word_cnt==NO_OUTPUT_ELEMENTS-1)
			{
				write_output.last = 1;
				// M_AXIS_TLAST is required to be asserted for the last word.
				// Else, the AXI Stream FIFO / AXI DMA will not know if all the words have been received from the co-processor.
			}
			M_AXIS.write(write_output);
		}
}
