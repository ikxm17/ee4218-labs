#include "hls_stream.h"
#include "ap_int.h"
#include "ap_axi_sdata.h"

#define NUM_ROWS_A    64
#define NUM_INNER_DIM 8
#define NUM_COLS_B    1
#define MAT_A_SIZE         (NUM_ROWS_A * NUM_INNER_DIM)
#define MAT_B_SIZE         (NUM_INNER_DIM * NUM_COLS_B)
#define NO_INPUT_ELEMENTS  (MAT_A_SIZE + MAT_B_SIZE)
#define NO_OUTPUT_ELEMENTS (NUM_ROWS_A * NUM_COLS_B)

typedef ap_axis<32,0,0,0> AXIS;

void myip_v2_0_HLS(hls::stream<AXIS>& S_AXIS, hls::stream<AXIS>& M_AXIS){
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=S_AXIS
#pragma HLS INTERFACE axis port=M_AXIS

    ap_uint<32> mat_A[MAT_A_SIZE];
    ap_uint<32> mat_B[MAT_B_SIZE];
    ap_uint<32> mat_RES[NO_OUTPUT_ELEMENTS];

    // Partition mat_A by the column (inner) dimension so all elements of a
    // row are accessible in parallel — one bank per k-index (8 banks).
    #pragma HLS ARRAY_PARTITION variable=mat_A cyclic factor=8 dim=1

    // Partition mat_B completely — it is only 8 elements, so all 8 can be
    // read simultaneously with zero memory contention.
    #pragma HLS ARRAY_PARTITION variable=mat_B complete dim=1

    // Partition mat_RES completely — 64 elements, one write per i-iteration
    // with no structural hazard needed.
    #pragma HLS ARRAY_PARTITION variable=mat_RES complete dim=1

    AXIS read_input, write_output;
    int word_cnt;

    // ----------------------------------------------------------------
    // DATAFLOW: allows the three stages (read → compute → write) to
    // overlap as a pipeline of tasks. As soon as the read loop finishes
    // one element, the compute stage can begin on already-read data.
    // Requires each array to be written by exactly one loop and read by
    // exactly one loop (producer-consumer model) — satisfied here.
    // ----------------------------------------------------------------
    #pragma HLS DATAFLOW

    // --- Stage 1: Read inputs ---
myip_v2_0_HLS_read_inputs:
    for(word_cnt = 0; word_cnt < NO_INPUT_ELEMENTS; word_cnt++){
        // PIPELINE: initiate one stream read every clock cycle (II=1).
        // Without this, the if/else branch stalls for multiple cycles.
        #pragma HLS PIPELINE II=2
        read_input = S_AXIS.read();
        if (word_cnt < MAT_A_SIZE)
            mat_A[word_cnt] = read_input.data;
        else
            mat_B[word_cnt - MAT_A_SIZE] = read_input.data;
    }

    // --- Stage 2: Compute C = A * B ---
myip_v2_0_HLS_compute:
    for(int i = 0; i < NUM_ROWS_A; i++){
        // PIPELINE on the outer loop: start a new row computation every
        // cycle after the pipeline fills. Combined with ARRAY_PARTITION,
        // all 8 MACs for one row execute in parallel within one II.
        #pragma HLS PIPELINE II=2
        for(int j = 0; j < NUM_COLS_B; j++){
            ap_uint<32> temp = 0;
            for(int k = 0; k < NUM_INNER_DIM; k++){
                // UNROLL: fully unroll the innermost k-loop so all 8
                // multiply-accumulate operations happen in parallel
                // within a single pipeline stage rather than sequentially.
                // This is what makes II=1 achievable on the outer loop.
                #pragma HLS UNROLL
                temp += mat_A[i * NUM_INNER_DIM + k] * mat_B[k * NUM_COLS_B + j];
            }
            mat_RES[i * NUM_COLS_B + j] = temp >> 8;
        }
    }

    // --- Stage 3: Write outputs ---
myip_v2_0_HLS_write_outputs:
    for(word_cnt = 0; word_cnt < NO_OUTPUT_ELEMENTS; word_cnt++){
        // PIPELINE: push one word into M_AXIS every clock cycle (II=1).
        #pragma HLS PIPELINE II=2
        write_output.data = mat_RES[word_cnt];
        write_output.keep = 0xFU;
        write_output.strb = 0xFU;
        write_output.last = (word_cnt == NO_OUTPUT_ELEMENTS - 1) ? 1 : 0;
        M_AXIS.write(write_output);
    }
}