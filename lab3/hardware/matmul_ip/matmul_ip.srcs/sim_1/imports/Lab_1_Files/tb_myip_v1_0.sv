`timescale 1ns / 1ps

/* 
----------------------------------------------------------------------------------
--	(c) Rajesh C Panicker, NUS
--  Description : Self-checking testbench for Matrix Multiplication AXI Stream Coprocessor.
--	License terms :
--	You are free to use this code as long as you
--		(i) DO NOT post a modified version of this on any public repository;
--		(ii) use it only for educational purposes;
--		(iii) accept the responsibility to ensure that your implementation does not violate any intellectual property of any entity.
--		(iv) accept that the program is provided "as is" without warranty of any kind or assurance regarding its suitability for any particular purpose;
--		(v) send an email to rajesh.panicker@ieee.org briefly mentioning its use (except when used for the course EE4218 at the National University of Singapore);
--		(vi) retain this notice in this file or any files derived from this.
----------------------------------------------------------------------------------
*/

//`define BEHAV_SIM // ! Comment when running post-synthesis simulations. This can be automated by making another simulation set.
// `define NON_CONTINUOUS_SIM // ! Uncomment to enable non-continuous TLAST and TREADY behavior for stress testing.

module tb_myip_v1_0(

    );

    /* AXI Stream Interface */
	localparam AXIS_WORD_SIZE = 32;

	logic ACLK = 0;    							// Synchronous clock
    logic ARESETN; 								// System reset, active low
    // Slave in interface
    logic S_AXIS_TREADY;  						// Ready to accept data in
	logic [AXIS_WORD_SIZE - 1:0] S_AXIS_TDATA;  // Data in
    logic S_AXIS_TLAST;   						// Optional data in qualifier
    logic S_AXIS_TVALID;  						// Data in is valid
    // Master out interface
	logic M_AXIS_TREADY;  						// Connected slave device is ready to accept data out
	logic [AXIS_WORD_SIZE - 1:0] M_AXIS_TDATA;   // Data out
	logic M_AXIS_TLAST;   						// Optional data out qualifier
    logic M_AXIS_TVALID;  						// Data out is valid
    
	localparam NUMBER_OF_TESTCASES = 1; 

	// ! The elements in the matrices are stored in a flattened array, so additional localparams are used to define their shapes 
	localparam WIDTH  = 8;  // width of an input vector
	// Inner dimension of matrix A and B
	localparam NUMBER_OF_INNER_DIMENSIONS = 8;
	// Parameters for matrix A
	localparam NUMBER_OF_A_ROWS = 64;
	localparam NUMBER_OF_A_WORDS = NUMBER_OF_A_ROWS * NUMBER_OF_INNER_DIMENSIONS; 
	// Parameters for matrix B
	localparam NUMBER_OF_B_COLS = 1;
	localparam NUMBER_OF_B_WORDS = NUMBER_OF_INNER_DIMENSIONS * NUMBER_OF_B_COLS;
	// Total number of input words
	localparam NUMBER_OF_INPUT_WORDS = NUMBER_OF_A_WORDS + NUMBER_OF_B_WORDS;
	// Total number of output words
	localparam NUMBER_OF_OUTPUT_WORDS = NUMBER_OF_A_ROWS * NUMBER_OF_B_COLS;

	// Non-continuous simulation parameters
	localparam PACKET_SIZE = 64;              // Words per TX packet before asserting TLAST
	localparam SEND_GAP_CYCLES = 4;           // Idle cycles (TVALID low) between TX packets
	localparam RECV_BURST_SIZE = 16;          // Words to accept before applying back-pressure
	localparam RECV_BACKPRESSURE_CYCLES = 3;  // Cycles to hold TREADY low during back-pressure

	// Inputs for A and B matrices are loaded from test_input.mem
	logic [WIDTH-1:0] expected_A_memory [0:NUMBER_OF_A_WORDS-1];
	logic [WIDTH-1:0] expected_B_memory [0:NUMBER_OF_B_WORDS-1];
	logic [WIDTH-1:0] expected_RES_memory [0:NUMBER_OF_OUTPUT_WORDS-1]; // to store results from

	logic [WIDTH-1:0] input_words_memory [0:NUMBER_OF_TESTCASES * NUMBER_OF_INPUT_WORDS - 1]; 
	logic [WIDTH-1:0] output_words_memory [0:NUMBER_OF_OUTPUT_WORDS-1];
	
	integer i, testcase_num, input_word_count, output_word_count, cycle_count;
`ifdef NON_CONTINUOUS_SIM
	integer packet_word_count, recv_burst_count, gap_i;
`endif
	logic prev_M_AXIS_TLAST = 1'b0;

	/* DUT instantiation */
    myip_v1_0 #(
        .NUMBER_OF_A_ROWS(NUMBER_OF_A_ROWS),
        .NUMBER_OF_INNER_DIMENSIONS(NUMBER_OF_INNER_DIMENSIONS),
        .NUMBER_OF_B_COLS(NUMBER_OF_B_COLS),
		.NUMBER_OF_A_WORDS(NUMBER_OF_A_WORDS),
		.NUMBER_OF_B_WORDS(NUMBER_OF_B_WORDS),
		.NUMBER_OF_INPUT_WORDS(NUMBER_OF_INPUT_WORDS),
		.NUMBER_OF_OUTPUT_WORDS(NUMBER_OF_OUTPUT_WORDS)
    ) dut (
        .ACLK(ACLK),
        .ARESETN(ARESETN),
        .S_AXIS_TREADY(S_AXIS_TREADY),
        .S_AXIS_TDATA(S_AXIS_TDATA),
        .S_AXIS_TLAST(S_AXIS_TLAST),
        .S_AXIS_TVALID(S_AXIS_TVALID),
        .M_AXIS_TVALID(M_AXIS_TVALID),
        .M_AXIS_TDATA(M_AXIS_TDATA),
        .M_AXIS_TLAST(M_AXIS_TLAST),
        .M_AXIS_TREADY(M_AXIS_TREADY)
    );

	/* Clock generation */
	localparam CLOCK_PERIOD = 100;
	localparam CLOCK_HALF_PERIOD = CLOCK_PERIOD / 2;
	always #CLOCK_HALF_PERIOD ACLK = ~ACLK; // invert ACLK every 5 time units (ns) --> period of 10 ns --> 100 MHz clock
    always @(posedge ACLK) cycle_count = cycle_count + 1;
	always_ff @(posedge ACLK) prev_M_AXIS_TLAST <= M_AXIS_TLAST;

`ifdef BEHAV_SIM
	task check_idle_state();
		assert(dut.state == dut.Idle) else $fatal(1, "DUT not in IDLE state when expected - stopping simulation");
	endtask

	task check_read_inputs_state();
		assert(dut.state == dut.Read_Inputs) else $fatal(1, "DUT not in READ_INPUTS state when expected - stopping simulation");
	endtask

	task check_compute_state();
		assert(dut.state == dut.Compute) else $fatal(1, "DUT not in COMPUTE state when expected - stopping simulation");
	endtask

	task check_write_outputs_state();
		assert(dut.state == dut.Write_Outputs) else $fatal(1, "DUT not in WRITE_OUTPUTS state when expected - stopping simulation");
	endtask

	task automatic verify_a_b_ram();
		integer i;
		integer a_errors = 0;
		integer b_errors = 0;

		$display("Checking A and B RAM contents against expected values.");
		// Check A RAM contents
		for (i = 0; i < NUMBER_OF_A_WORDS; i = i + 1) begin
			if (dut.A_RAM.RAM[i] === expected_A_memory[i]) $display("  ✓ A_RAM[%0d] = 0x%h (PASS)", i, dut.A_RAM.RAM[i]);
			else begin
            	$error("  ✗ A_RAM[%0d] mismatch! Expected: 0x%h, Got: 0x%h", i, expected_A_memory[i], dut.A_RAM.RAM[i]);
            	a_errors++;
        	end
		end

		// Check B RAM contents
		$display("Checking B_RAM...");
    	for (i = 0; i < NUMBER_OF_B_WORDS; i = i + 1) begin
        	if (dut.B_RAM.RAM[i] === expected_B_memory[i]) $display("  ✓ B_RAM[%0d] = 0x%h (PASS)", i, dut.B_RAM.RAM[i]);
			else begin
            	$error("  ✗ B_RAM[%0d] mismatch! Expected: 0x%h, Got: 0x%h", i, expected_B_memory[i], dut.B_RAM.RAM[i]);
            	b_errors++;
        	end
		end

		// Overall assertion
    	if (a_errors == 0 && b_errors == 0) $display("RAM A AND RAM B CHECKS PASSED");
    	else begin
        	$display("RAM CHECKS FAILED:");
			$display("RAM A total errors: %0d", a_errors);
        	$display("RAM B total errors: %0d", b_errors);
        	$fatal(1, "RAM A and RAM B verification failed - stopping simulation");
    	end
	endtask

	task automatic verify_res_ram();
		integer i;
		integer res_errors = 0;

		$display("Checking RES RAM contents against expected values.");
		// Check RES RAM contents
		for (i = 0; i < NUMBER_OF_OUTPUT_WORDS; i = i + 1) begin
			if (dut.RES_RAM.RAM[i] === expected_RES_memory[i]) $display("  ✓ RES_RAM[%0d] = 0x%h (PASS)", i, dut.RES_RAM.RAM[i]);
			else begin
			$error("  ✗ RES_RAM[%0d] mismatch! Expected: 0x%h, Got: 0x%h", i, expected_RES_memory[i], dut.RES_RAM.RAM[i]);
			res_errors++;
			end
		end

		// Overall assertion
		if (res_errors == 0) $display("RES RAM CHECKS PASSED");
		else begin
			$display("RES RAM CHECKS FAILED:");
			$display("RES RAM total errors: %0d", res_errors);
			$fatal(1, "RES RAM verification failed - stopping simulation");
		end
	endtask
`endif

    task calculate_expected();
        integer i, j, k;
        logic [31:0] accum;
        for (i = 0; i < NUMBER_OF_A_ROWS; i = i + 1) begin
            for (j = 0; j < NUMBER_OF_B_COLS; j = j + 1) begin
                accum = 0;
                for (k = 0; k < NUMBER_OF_INNER_DIMENSIONS; k = k + 1) begin
                    // Row-major indexing: (row * row_width) + col
                    accum = accum + (expected_A_memory[i*NUMBER_OF_INNER_DIMENSIONS + k] * expected_B_memory[k*NUMBER_OF_B_COLS + j]);
                end
                // Apply the scaling factor (acc >> 8) used in your design
                expected_RES_memory[i*NUMBER_OF_B_COLS + j] = accum[15:8]; 
            end
        end
	endtask	

	task automatic verify_output();
		integer i;
		integer output_errors = 0;

		$display("Checking output words against expected values.");
		// Check output words
		for (i = 0; i < NUMBER_OF_OUTPUT_WORDS; i = i + 1)
			if (output_words_memory[i] === expected_RES_memory[i]) $display("  ✓ Output_Word[%0d] = 0x%h (PASS)", i, output_words_memory[i]);
		else begin
			$error("  ✗ Output_Word[%0d] mismatch! Expected: 0x%h, Got: 0x%h", i, expected_RES_memory[i], output_words_memory[i]);
			output_errors++;
		end

		// Overall assertion
		if (output_errors == 0) begin
			$display("OUTPUT WORDS CHECKS PASSED");
		end else begin
			$display("OUTPUT WORDS CHECKS FAILED:");
			$display("Output words total errors: %0d", output_errors);
			$fatal(1, "Output words verification failed - stopping simulation");
		end
	endtask

	initial begin
		/* Store test vectors and calculate expected results */
		// Load test vectors from .mem file
		$display("Loading Memory.");
		$readmemh("test_input.mem", input_words_memory, 0, (NUMBER_OF_TESTCASES * NUMBER_OF_INPUT_WORDS) - 1); // load input words

		/* Set signals to reset co-processor */
		#25						// needed to make inputs and capture from testbench not aligned with clock edges
		ARESETN = 1'b0; 		// apply reset (active low)
		S_AXIS_TDATA = 32'hxxxx; // no valid data
		S_AXIS_TVALID = 1'b0;   // no valid data placed on the S_AXIS_TDATA yet
		S_AXIS_TLAST = 1'b0; 	// not required unless we are dealing with an unknown number of inputs. Ignored by the coprocessor. We will be asserting it correctly anyway
		M_AXIS_TREADY = 1'b0;	// not ready to receive data from the co-processor yet.   

		#CLOCK_PERIOD		// hold reset for CLOCK_PERIOD
		ARESETN = 1'b1;	// release reset
		for (testcase_num = 0; testcase_num < NUMBER_OF_TESTCASES; testcase_num = testcase_num + 1) begin
			// Separate A and B matrices
			for (i = 0; i < NUMBER_OF_A_WORDS; i = i + 1) begin
				expected_A_memory[i] = input_words_memory[testcase_num * NUMBER_OF_INPUT_WORDS + i];
			end
			for (i = 0; i < NUMBER_OF_B_WORDS; i = i + 1) begin
				expected_B_memory[i] = input_words_memory[testcase_num * NUMBER_OF_INPUT_WORDS + NUMBER_OF_A_WORDS + i];
			end

			calculate_expected(); // Calculate expected result for matrix multiplication
			/* Simulating as the master */
			/* Set signals to load test vectors into DUT's RAMs */
			cycle_count = 0; // reset cycle counter everytime a new testcase starts
`ifdef NON_CONTINUOUS_SIM
			// NON-CONTINUOUS SEND: Assert TLAST at packet boundaries, insert gaps between packets.
			input_word_count = 0;
			packet_word_count = 0;
			S_AXIS_TVALID = 1'b1;
			while (input_word_count < NUMBER_OF_INPUT_WORDS) begin
				if (S_AXIS_TREADY) begin
					S_AXIS_TDATA = input_words_memory[testcase_num * NUMBER_OF_INPUT_WORDS + input_word_count];
					// Assert TLAST at end of each packet OR on the very last word
					if (input_word_count == (NUMBER_OF_INPUT_WORDS) - 1)
						S_AXIS_TLAST = 1'b1;
					else if (packet_word_count == PACKET_SIZE - 1)
						S_AXIS_TLAST = 1'b1;
					else
						S_AXIS_TLAST = 1'b0;
					input_word_count = input_word_count + 1;
					packet_word_count = packet_word_count + 1;
					// After completing a packet (and there are more words to send), insert a gap
					if (packet_word_count == PACKET_SIZE && input_word_count < NUMBER_OF_INPUT_WORDS) begin
						#CLOCK_PERIOD; // let coprocessor capture last word of packet
						S_AXIS_TVALID = 1'b0;
						S_AXIS_TLAST = 1'b0;
						S_AXIS_TDATA = 32'hxxxx;
						for (gap_i = 0; gap_i < SEND_GAP_CYCLES; gap_i = gap_i + 1)
							#CLOCK_PERIOD;
						S_AXIS_TVALID = 1'b1;
						packet_word_count = 0;
					end else begin
						#CLOCK_PERIOD;
					end
				end else begin
					#CLOCK_PERIOD;
				end
			end
`else		
			// CONTINUOUS SEND
			input_word_count = 0;
			S_AXIS_TVALID = 1'b1; // assert to indicate valid data is placed on S_AXIS_TDATA
			while (input_word_count < NUMBER_OF_INPUT_WORDS) begin
				if (S_AXIS_TREADY) begin // S_AXIS_TREADY is asserted by the co-processor in response to assertion of S_AXIS_TVALID
					S_AXIS_TDATA = input_words_memory[testcase_num * NUMBER_OF_INPUT_WORDS + input_word_count];
					if (input_word_count == (NUMBER_OF_INPUT_WORDS) - 1)
						S_AXIS_TLAST = 1'b1; // indicate last word
					else
						S_AXIS_TLAST = 1'b0;
					input_word_count = input_word_count + 1;
				end
				#CLOCK_PERIOD;				// wait for one clock cycle for co-processor to capture data (if S_AXIS_TREADY was set)
											// or before checking S_AXIS_TREADY again (if S_AXIS_TREADY was not set)
			end
`endif
			// no longer give data to co-processor
			S_AXIS_TDATA = 32'hxxxx; // no valid data
			S_AXIS_TVALID = 1'b0; // deassert S_AXIS_TVALID since no more data to send
			S_AXIS_TLAST = 1'b0; // deassert S_AXIS_TLAST
			
			/* Simulating as the slave */
			output_word_count = 0;
			M_AXIS_TREADY = 1'b1; // assert to indicate ready to receive data from co-processor
`ifdef NON_CONTINUOUS_SIM
			// NON-CONTINUOUS RECEIVE: Periodically deassert TREADY to simulate back-pressure
			recv_burst_count = 0;
			while (M_AXIS_TLAST | ~prev_M_AXIS_TLAST) begin // receive data until the falling edge of M_AXIS_TLAST
				if (M_AXIS_TVALID && M_AXIS_TREADY) begin // proper AXI handshake
					output_words_memory[output_word_count] = M_AXIS_TDATA;
					output_word_count = output_word_count + 1;
					recv_burst_count = recv_burst_count + 1;
					// After receiving RECV_BURST_SIZE words, apply back-pressure (unless TLAST is asserted)
					if (recv_burst_count == RECV_BURST_SIZE && !(M_AXIS_TLAST)) begin
						#CLOCK_PERIOD;
						M_AXIS_TREADY = 1'b0;
						for (gap_i = 0; gap_i < RECV_BACKPRESSURE_CYCLES; gap_i = gap_i + 1)
							#CLOCK_PERIOD;
						M_AXIS_TREADY = 1'b1;
						recv_burst_count = 0;
					end else begin
						#CLOCK_PERIOD;
					end
				end else begin
					#CLOCK_PERIOD;
				end
			end
`else		
			// CONTINUOUS RECEIVE
			while (M_AXIS_TLAST | ~prev_M_AXIS_TLAST) begin // receive data until the falling edge of M_AXIS_TLAST
				if (M_AXIS_TVALID) begin
					output_words_memory[output_word_count] = M_AXIS_TDATA;
					output_word_count = output_word_count + 1;
				end
				#CLOCK_PERIOD;
			end
`endif
			M_AXIS_TREADY = 1'b0; // deassert M_AXIS_TREADY since no more data to receive

			repeat (1) @(posedge ACLK); // wait for a one clock cycle before checking results

			/* Check results */
			$display("=========================================");
			$display("Testcase %0d:", testcase_num + 1);
			$display("  Matrix A: %0d x %0d", NUMBER_OF_A_ROWS, NUMBER_OF_INNER_DIMENSIONS);
			$display("  Matrix B: %0d x %0d", NUMBER_OF_INNER_DIMENSIONS, NUMBER_OF_B_COLS);
			$display("  Result:   %0d x %0d", NUMBER_OF_A_ROWS, NUMBER_OF_B_COLS);
			$display("  Cycles Used:   %0d", cycle_count);
			// check all RAM and output contents
`ifdef BEHAV_SIM 
			verify_a_b_ram();
			verify_res_ram();
`endif
			verify_output();
			$display("=========================================");
		end

		$finish;       	
	end
endmodule
