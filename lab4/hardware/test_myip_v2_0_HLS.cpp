/*
----------------------------------------------------------------------------------
--  (c) Rajesh C Panicker, NUS,
--  Description : Self-checking testbench for AXI Stream Matrix Multiplication
--                Coprocessor (HLS).
--
--  Matrix dimensions:
--      A  :  M x K  =  64 x 8  =  512 words  (row-major, streamed first)
--      B  :  K x N  =   8 x 1  =    8 words  (row-major, streamed second)
--      C  :  M x N  =  64 x 1  =   64 words  (row-major output)
--
--  S_AXIS input stream (520 words total):
--      [ A[0][0], A[0][1], ..., A[63][7],   <- 512 words, Matrix A
--        B[0][0], B[1][0], ..., B[7][0]  ]  <-   8 words, Matrix B
--
--  M_AXIS output stream (64 words total):
--      [ C[0][0], C[1][0], ..., C[63][0] ]  <- 64 words, C = A * B
--
--  Input matrices are loaded from "input_data.mem" at runtime.
--
--  License terms :
--  You are free to use this code as long as you
--      (i) DO NOT post a modified version of this on any public repository;
--      (ii) use it only for educational purposes;
--      (iii) accept the responsibility to ensure that your implementation does
--            not violate any intellectual property of any entity.
--      (iv) accept that the program is provided "as is" without warranty of
--            any kind or assurance regarding its suitability for any particular
--            purpose;
--      (v) send an email to rajesh.panicker@ieee.org briefly mentioning its use
--            (except when used for the course EE4218/CEG5203 at NUS);
--      (vi) retain this notice in this file or any files derived from this.
----------------------------------------------------------------------------------
*/

#include <stdio.h>
#include <stdlib.h>
#include "hls_stream.h"
#include "ap_axi_sdata.h"

typedef ap_axis<32,0,0,0> AXIS;

/***************** Coprocessor function declaration *********************/
void myip_v2_0_HLS(hls::stream<AXIS>& S_AXIS, hls::stream<AXIS>& M_AXIS);

/***************** Matrix dimensions (edit here only) *********************/
#define M 64   // Rows of A  /  Rows of C
#define K  8   // Cols of A  /  Rows of B
#define N  1   // Cols of B  /  Cols of C

/***************** Derived word counts — do not edit *********************/
#define SIZE_A                (M * K)   // 512
#define SIZE_B                (K * N)   //   8
#define NUMBER_OF_INPUT_WORDS (SIZE_A + SIZE_B)   // 520
#define NUMBER_OF_OUTPUT_WORDS (M * N)            //  64

/************************** Variable Definitions *****************************/
// Flat input stream: [ A (row-major) | B (row-major) ]
int test_input_memory          [NUMBER_OF_INPUT_WORDS];
int test_result_expected_memory[NUMBER_OF_OUTPUT_WORDS];
int result_memory              [NUMBER_OF_OUTPUT_WORDS];

// Pointer aliases into the flat input buffer — no extra copies
int *mat_A = test_input_memory;           // [M][K]  =  mat_A[i*K + k]
int *mat_B = test_input_memory + SIZE_A;  // [K][N]  =  mat_B[k*N + j]

/*****************************************************************************
* load_mem_file()
*   Reads whitespace-separated integers from a .mem file (lines starting with
*   '#' are treated as comments and skipped) into test_input_memory[].
*   Returns 0 on success, -1 on failure.
******************************************************************************/
int load_mem_file(const char *filename)
{
    FILE *fp = fopen(filename, "r");
    if (!fp) {
        fprintf(stderr, "ERROR: Cannot open memory file '%s'\n", filename);
        return -1;
    }

    int idx = 0;
    char line[512];

    while (fgets(line, sizeof(line), fp) && idx < NUMBER_OF_INPUT_WORDS) {
        // Skip comment and blank lines
        if (line[0] == '#' || line[0] == '\n' || line[0] == '\r')
            continue;

        char *tok = strtok(line, " \t\n\r");
        while (tok && idx < NUMBER_OF_INPUT_WORDS) {
            test_input_memory[idx++] = atoi(tok);
            tok = strtok(NULL, " \t\n\r");
        }
    }
    fclose(fp);

    if (idx != NUMBER_OF_INPUT_WORDS) {
        fprintf(stderr,
                "ERROR: Expected %d values in '%s', but only read %d.\n",
                NUMBER_OF_INPUT_WORDS, filename, idx);
        return -1;
    }
    printf("Loaded %d words from '%s'.\n\n", idx, filename);
    return 0;
}

/*****************************************************************************
* compute_expected()
*   Software golden reference:  C[i][j] = sum_{k} A[i][k] * B[k][j]
*   Stored row-major in test_result_expected_memory[i*N + j].
******************************************************************************/
void compute_expected(void)
{
    int i, j, k;
    for (i = 0; i < M; i++) {
        for (j = 0; j < N; j++) {
            int acc = 0;
            for (k = 0; k < K; k++) {
                acc += mat_A[i * K + k] * mat_B[k * N + j];
            }
            test_result_expected_memory[i * N + j] = acc >> 8;
        }
    }
}

/*****************************************************************************
* print_vector()
*   Utility: print a column vector (N=1 case) with its row index.
******************************************************************************/
void print_vector(const char *name, int *data, int rows)
{
    printf("%s (%d x 1):\n", name, rows);
    int i;
    for (i = 0; i < rows; i++) {
        printf("  [%2d]  %d\n", i, data[i]);
    }
    printf("\n");
}

/*****************************************************************************
* Main
******************************************************************************/
int main()
{
    int word_cnt;
    int success;
    AXIS read_output, write_input;
    hls::stream<AXIS> S_AXIS;
    hls::stream<AXIS> M_AXIS;

    /* ------------------------------------------------------------------ */
    /* 1. Load A and B from .mem file                                      */
    /* ------------------------------------------------------------------ */
    if (load_mem_file("input_data.mem") != 0)
        return 1;

    /* ------------------------------------------------------------------ */
    /* 2. Compute expected result C = A * B  (software golden reference)  */
    /* ------------------------------------------------------------------ */
    compute_expected();

    /* Optional: inspect inputs and expected output */
    printf("Matrix B (8 x 1):\n");
    for (int k = 0; k < K; k++)
        printf("  B[%d] = %d\n", k, mat_B[k]);
    printf("\n");
    print_vector("Expected output C = A*B", test_result_expected_memory, M);

    /* ------------------------------------------------------------------ */
    /* 3. Stream 520 words into S_AXIS: first A (512), then B (8)         */
    /* ------------------------------------------------------------------ */
    printf("Transmitting %d words to co-processor "
           "(A: %d words, B: %d words)...\n",
           NUMBER_OF_INPUT_WORDS, SIZE_A, SIZE_B);

    for (word_cnt = 0; word_cnt < NUMBER_OF_INPUT_WORDS; word_cnt++) {
        write_input.data = test_input_memory[word_cnt];
        write_input.keep = 0xFU;
        write_input.strb = 0xFU;
        write_input.last = (word_cnt == NUMBER_OF_INPUT_WORDS - 1) ? 1 : 0;
        S_AXIS.write(write_input);
    }

    /* ------------------------------------------------------------------ */
    /* 4. Invoke the co-processor                                          */
    /* ------------------------------------------------------------------ */
    myip_v2_0_HLS(S_AXIS, M_AXIS);

    /* ------------------------------------------------------------------ */
    /* 5. Read 64 output words from M_AXIS                                */
    /*    Each word is C[row][0] for row = 0..63                          */
    /* ------------------------------------------------------------------ */
    printf("Receiving %d words from co-processor...\n\n",
           NUMBER_OF_OUTPUT_WORDS);

    for (word_cnt = 0; word_cnt < NUMBER_OF_OUTPUT_WORDS; word_cnt++) {
        read_output = M_AXIS.read();
        result_memory[word_cnt] = read_output.data;
    }

    print_vector("Received C (co-processor output)", result_memory, M);

    /* ------------------------------------------------------------------ */
    /* 6. Self-check: compare against software golden reference           */
    /* ------------------------------------------------------------------ */
    success = 1;
    printf("Comparing results...\n");

    for (word_cnt = 0; word_cnt < NUMBER_OF_OUTPUT_WORDS; word_cnt++) {
        if (result_memory[word_cnt] != test_result_expected_memory[word_cnt]) {
            printf("  MISMATCH at C[%2d][0]: got %d, expected %d\n",
                   word_cnt,
                   result_memory[word_cnt],
                   test_result_expected_memory[word_cnt]);
            success = 0;
        }
    }

    if (success) {
        printf("\nTest PASSED: all %d output words match.\n",
               NUMBER_OF_OUTPUT_WORDS);
        return 0;
    } else {
        printf("\nTest FAILED.\n");
        return 1;
    }
}