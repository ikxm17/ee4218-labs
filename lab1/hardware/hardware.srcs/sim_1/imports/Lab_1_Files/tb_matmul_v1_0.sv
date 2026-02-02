`timescale 1ns / 1ps

module tb_matrix_multiply;

    // Parameters matches the DUT
    parameter W = 8;
    parameter A_DBITS = 3;
    parameter B_DBITS = 2;
    parameter RES_DBITS = 1;
    parameter M = 2; // Rows of A
    parameter N = 4; // Cols of A / Rows of B
    parameter P = 1; // Cols of B

    // DUT Signals
    logic clk;
    logic ARESETN;
    logic Start;
    logic Done;
    logic A_read_en, B_read_en, RES_write_en;
    logic [A_DBITS-1:0] A_read_address;
    logic [B_DBITS-1:0] B_read_address;
    logic [RES_DBITS-1:0] RES_write_address;
    logic [W-1:0] A_read_data_out, B_read_data_out, RES_write_data_in;

    // Internal Memory Models
    logic [W-1:0] mem_A [0:(2**A_DBITS)-1];
    logic [W-1:0] mem_B [0:(2**B_DBITS)-1];
    logic [W-1:0] mem_RES [0:(2**RES_DBITS)-1];
    logic [W-1:0] expected_RES [0:(2**RES_DBITS)-1];

    // Clock Generation
    initial clk = 0;
    always #5 clk = ~clk; 

    // Instantiate DUT
    matrix_multiply #(
        .width(W), .A_depth_bits(A_DBITS), .B_depth_bits(B_DBITS), 
        .RES_depth_bits(RES_DBITS), .m(M), .n(N), .p(P)
    ) dut (.*);

    // Synchronous Memory Modeling
    // This accurately simulates the 1-cycle latency of FPGA Block RAM
    always_ff @(posedge clk) begin
        if (A_read_en) A_read_data_out <= mem_A[A_read_address];
        if (B_read_en) B_read_data_out <= mem_B[B_read_address];
        if (RES_write_en) mem_RES[RES_write_address] <= RES_write_data_in;
    end

    // --- Automatic Golden Model Task ---
    task calculate_expected();
        integer i, j, k;
        logic [31:0] accum;
        for (i = 0; i < M; i = i + 1) begin
            for (j = 0; j < P; j = j + 1) begin
                accum = 0;
                for (k = 0; k < N; k = k + 1) begin
                    // Row-major indexing: (row * row_width) + col
                    accum = accum + (mem_A[i*N + k] * mem_B[k*P + j]);
                end
                // Apply the scaling factor (acc >> 8) used in your design
                expected_RES[i*P + j] = accum[15:8]; 
            end
        end
    endtask

    // --- Main Test Procedure ---
    initial begin
        ARESETN = 0;
        Start = 0;


        // 1. Initialize Matrices (Row-First)
        // A = [[10, 20, 30, 40], [50, 60, 70, 80]]
        for(int i=0; i<8; i++) mem_A[i] = (i+1)*10;
        // B = [[2], [4], [6], [8]]
        for(int i=0; i<4; i++) mem_B[i] = (i+1)*2;

        // Calculate reference before starting hardware
        calculate_expected();

        // 1. Reset Sequence
        #25;           // Wait for a few ns
        ARESETN = 1;   // Release Reset
        repeat(2) @(posedge clk);

        Start = 0;
        repeat(2) @(posedge clk);
        
        // 2. Start Hardware
        $display("[%0t] Starting Matrix Multiplication...", $time);
        Start = 1;
        @(posedge clk);
        Start = 0;

        // 3. Monitor for Done
        wait(Done);
        repeat(4) @(posedge clk); // Buffer for final write

        // 4. Comparison Scoreboard
        $display("\n--- Scoreboard Check ---");
        for (int i = 0; i < (M*P); i++) begin
            if (mem_RES[i] === expected_RES[i]) begin
                $display("SUCCESS: Index %0d | Expected: %h | Got: %h", i, expected_RES[i], mem_RES[i]);
            end else begin
                $error("FAILURE: Index %0d | Expected: %h | Got: %h", i, expected_RES[i], mem_RES[i]);
            end
        end

        $finish;
    end

endmodule