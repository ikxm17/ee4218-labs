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
    
	/* DUT instantiation */
    myip_v1_0 dut ( 
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

	/* DUT states */
	typedef enum logic [2:0] {
		IDLE = 4'b1000,
		READ_INPUTS = 4'b0100,
		COMPUTE = 4'b0010,
		WRITE_OUTPUTS = 4'b0001
	} state_t;
	
	/* TODO: 
		1. Load test vectors and calculate expected results (copy hannah's golden model), store them in some array
		2. Load the test vectors into the dut, and check the RAM contents in Compute state
		3. Check the RES_RAM contents in Write_Outputs state
		4. In Write_Outputs state, at every clock cycle, store  M_AXIS_TDATA into an array 
		4. Wait for M_AXIS_TLAST to be asserted, and check the stored array against the expected results
	*/
	
	// ! The elements in the matrices are stored in a flattened array, so additional localparams are used to define their shapes 
	localparam WIDTH  = 8;  // width of an input vector
	// Parameters for matrix A
	localparam NUMBER_OF_A_WORDS = 8; 
	localparam NUMBER_OF_A_ROWS = 2;
	// Parameters for matrix B
	localparam NUMBER_OF_B_WORDS = 4;
	localparam NUMBER_OF_B_COLS = 1;
	// Inner dimension of matrix A and B
	localparam NUMBER_OF_INNER_DIMENSIONS = 4;
	// Total number of input words
	localparam NUMBER_OF_INPUT_WORDS = NUMBER_OF_A_WORDS + NUMBER_OF_B_WORDS;
	// Total number of output words
	localparam NUMBER_OF_OUTPUT_WORDS = NUMBER_OF_A_ROWS * NUMBER_OF_B_COLS;
	
	// Inputs for A and B matrices are loaded from test_input.mem
	logic [WIDTH-1:0] expected_A_memory [0:NUMBER_OF_A_WORDS-1];
	logic [WIDTH-1:0] expected_B_memory [0:NUMBER_OF_B_WORDS-1];
	logic [WIDTH-1:0] expected_RES_memory [0:NUMBER_OF_OUTPUT_WORDS-1]; // to store results from

	logic [WIDTH-1:0] input_words_memory [0:NUMBER_OF_INPUT_WORDS-1]; 
	logic [WIDTH-1:0] output_words_memory [0:NUMBER_OF_OUTPUT_WORDS-1];
	
	integer i, input_word_count, output_word_count;
	logic prev_M_AXIS_TLAST = 1'b0;

	/* Clock generation */
	always #5 ACLK = ~ACLK; // invert ACLK every 5 time units (ns) --> period of 10 ns --> 100 MHz clock
    always_ff @(posedge ACLK) prev_M_AXIS_TLAST <= M_AXIS_TLAST; 

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

	task check_idle_state();
		assert(dut.state == dut.Idle) else $fatal(1, "DUT not in IDLE state when expected - stopping simulation");
	endtask

	task check_read_inputs_state();
		assert(dut.state == dut.Read_Inputs) else $fatal(1, "DUT not in READ_INPUTS state when expected - stopping simulation");
	endtask

	task check_compute_state();
		assert(dut.state == dut.Compute) else $fatal(1, "DUT not in COMPUTE state when expected - stopping simulation");
		verify_a_b_ram();
	endtask

	task check_write_outputs_state();
		assert(dut.state == dut.Write_Outputs) else $fatal(1, "DUT not in WRITE_OUTPUTS state when expected - stopping simulation");
		verify_res_ram();
	endtask

	initial begin
		/* Store test vectors and calculate expected results */
		// Load test vectors from .mem file
		$display("Loading Memory.");
		$readmemh("test_input.mem", input_words_memory, 0, NUMBER_OF_INPUT_WORDS-1); // load input words

		// Separate A and B matrices
		for (i = 0; i < NUMBER_OF_A_WORDS; i = i + 1) begin
			expected_A_memory[i] = input_words_memory[i];
		end

		for (i = 0; i < NUMBER_OF_B_WORDS; i = i + 1) begin
			expected_B_memory[i] = input_words_memory[NUMBER_OF_A_WORDS + i];
		end

		// Calculate expected result
		calculate_expected();

		/* Set signals to reset co-processor */
		#25						// needed to make inputs and capture from testbench not aligned with clock edges
		ARESETN = 1'b0; 		// apply reset (active low)
		S_AXIS_TDATA = 32'hxxxx; // no valid data
		S_AXIS_TVALID = 1'b0;   // no valid data placed on the S_AXIS_TDATA yet
		S_AXIS_TLAST = 1'b0; 	// not required unless we are dealing with an unknown number of inputs. Ignored by the coprocessor. We will be asserting it correctly anyway
		M_AXIS_TREADY = 1'b0;	// not ready to receive data from the co-processor yet.   

		#10				// hold reset for 10 ns.
		ARESETN = 1'b1;	// release reset

		wait(dut.state == dut.Idle);
		check_idle_state();

		/* Simulating as the master */
		/* Set signals to load test vectors into DUT's RAMs */
		input_word_count = 0;
		S_AXIS_TVALID = 1'b1; // assert to indicate valid data is placed on S_AXIS_TDATA
		input_word_count = 0;
		while (input_word_count < NUMBER_OF_INPUT_WORDS) begin
			if (S_AXIS_TREADY) begin // S_AXIS_TREADY is asserted by the co-processor in response to assertion of S_AXIS_TVALID
				S_AXIS_TDATA = input_words_memory[input_word_count];
				if (input_word_count == NUMBER_OF_INPUT_WORDS - 1)
					S_AXIS_TLAST = 1'b1; // indicate last word
				else
					S_AXIS_TLAST = 1'b0;
				input_word_count = input_word_count + 1;
				check_read_inputs_state();
			end							
			#10;						// wait for one clock cycle for co-processor to capture data (if S_AXIS_TREADY was set)
										// or before checking S_AXIS_TREADY again (if S_AXIS_TREADY was not set)
		end
		// no longer give data to co-processor
		S_AXIS_TDATA = 32'hxxxx; // no valid data
		S_AXIS_TVALID = 1'b0; // deassert S_AXIS_TVALID since no more data to send
		S_AXIS_TLAST = 1'b0; // deassert S_AXIS_TLAST
		
		/* Simulating as the slave */
		output_word_count = 0;
		M_AXIS_TREADY = 1'b1; // assert to indicate ready to receive data from co-processor
		while (M_AXIS_TLAST | ~prev_M_AXIS_TLAST) begin // receive data until the falling edge of M_AXIS_TLAST
			if (M_AXIS_TVALID) begin
				output_words_memory[output_word_count] = M_AXIS_TDATA;
				output_word_count = output_word_count + 1;
			end
			#10;
		end
		M_AXIS_TREADY = 1'b0; // deassert M_AXIS_TREADY since no more data to receive

		verify_output();
		
		$finish;       	
	end
endmodule
