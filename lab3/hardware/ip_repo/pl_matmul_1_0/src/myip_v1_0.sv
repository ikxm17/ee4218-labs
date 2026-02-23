`timescale 1ns / 1ps

/* 
----------------------------------------------------------------------------------
--	(c) Rajesh C Panicker, NUS
--  Description : Matrix Multiplication AXI Stream Coprocessor. Based on the orginal AXIS Coprocessor template (c) Xilinx Inc
-- 	Based on the orginal AXIS coprocessor template (c) Xilinx Inc
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
/*
-------------------------------------------------------------------------------
--
-- Definition of Ports
-- ACLK              : Synchronous clock
-- ARESETN           : System reset, active low
-- S_AXIS_TREADY  : Ready to accept data in
-- S_AXIS_TDATA   :  Data in 
-- S_AXIS_TLAST   : Optional data in qualifier
-- S_AXIS_TVALID  : Data in is valid
-- M_AXIS_TVALID  :  Data out is valid
-- M_AXIS_TDATA   : Data Out
-- M_AXIS_TLAST   : Optional data out qualifier
-- M_AXIS_TREADY  : Connected slave device is ready to accept data out
--
-------------------------------------------------------------------------------
*/

module myip_v1_0 # (
	parameter NUMBER_OF_A_ROWS = 64, // m
	parameter NUMBER_OF_INNER_DIMENSIONS = 8, // n
	parameter NUMBER_OF_B_COLS = 1, // p
	parameter NUMBER_OF_A_WORDS = 512,
	parameter NUMBER_OF_B_WORDS = 8,
	parameter NUMBER_OF_INPUT_WORDS = 520,
	parameter NUMBER_OF_OUTPUT_WORDS = 64
	)(
		// DO NOT EDIT BELOW THIS LINE ////////////////////
		ACLK,
		ARESETN,
		S_AXIS_TREADY,
		S_AXIS_TDATA,
		S_AXIS_TLAST,
		S_AXIS_TVALID,
		M_AXIS_TVALID,
		M_AXIS_TDATA,
		M_AXIS_TLAST,
		M_AXIS_TREADY
		// DO NOT EDIT ABOVE THIS LINE ////////////////////
	);

	input					ACLK;    // Synchronous clock
	input					ARESETN; // System reset, active low
	// slave in interface
	output	reg				S_AXIS_TREADY;  // Ready to accept data in
	input	[31 : 0]		S_AXIS_TDATA;   // Data in
	input					S_AXIS_TLAST;   // Optional data in qualifier
	input					S_AXIS_TVALID;  // Data in is valid
	// master out interface
	output	reg				M_AXIS_TVALID;  // Data out is valid
	output 	reg [31 : 0]	M_AXIS_TDATA;   // Data Out
	output	reg				M_AXIS_TLAST;   // Optional data out qualifier
	input					M_AXIS_TREADY;  // Connected slave device is ready to accept data out

//----------------------------------------
// Implementation Section
//----------------------------------------
// In this section, we povide an example implementation of MODULE myip_v1_0
// that does the following:
//
// 1. Read all inputs
// 2. Add each input to the contents of register 'sum' which acts as an accumulator
// 3. After all the inputs have been read, write out the content of 'sum', 'sum+1', 'sum+2', 'sum+3'
//
// You will need to modify this example for
// MODULE myip_v1_0 to implement your coprocessor


	// RAM parameters for assignment 1
	localparam A_depth_bits = $clog2(NUMBER_OF_A_WORDS);  	// 8 elements (A is a 2x4 matrix)
	localparam B_depth_bits = $clog2(NUMBER_OF_B_WORDS); 	// 4 elements (B is a 4x1 matrix)
	localparam RES_depth_bits = $clog2(NUMBER_OF_OUTPUT_WORDS);	// 2 elements (RES is a 2x1 matrix)
	localparam width = 8;			// all 8-bit data
	
	// wires (or regs) to connect to RAMs and matrix_multiply_0 for assignment 1
	// those which are assigned in an always block of myip_v1_0 shoud be changes to reg.
	logic	A_write_en;								// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg.
	logic	[A_depth_bits-1:0] A_write_address;		// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg. 
	logic	[width-1:0] A_write_data_in;			// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg.
	logic	A_read_en;								// matrix_multiply_0 -> A_RAM.
	logic	[A_depth_bits-1:0] A_read_address;		// matrix_multiply_0 -> A_RAM.
	logic	[width-1:0] A_read_data_out;			// A_RAM -> matrix_multiply_0.
	logic	B_write_en;								// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
	logic	[B_depth_bits-1:0] B_write_address;		// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
	logic	[width-1:0] B_write_data_in;			// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
	logic	B_read_en;								// matrix_multiply_0 -> B_RAM.
	logic	[B_depth_bits-1:0] B_read_address;		// matrix_multiply_0 -> B_RAM.
	logic	[width-1:0] B_read_data_out;			// B_RAM -> matrix_multiply_0.
	logic	RES_write_en;							// matrix_multiply_0 -> RES_RAM.
	logic	[RES_depth_bits-1:0] RES_write_address;	// matrix_multiply_0 -> RES_RAM.
	logic	[width-1:0] RES_write_data_in;			// matrix_multiply_0 -> RES_RAM.
	logic	RES_read_en;  							// myip_v1_0 -> RES_RAM. To be assigned within myip_v1_0. Possibly reg.
	logic	[RES_depth_bits-1:0] RES_read_address;	// myip_v1_0 -> RES_RAM. To be assigned within myip_v1_0. Possibly reg.
	logic	[width-1:0] RES_read_data_out;			// RES_RAM -> myip_v1_0
	
	// wires (or regs) to connect to matrix_multiply for assignment 1
	reg		Start; 								// myip_v1_0 -> matrix_multiply_0. To be assigned within myip_v1_0. Possibly reg.
	wire	Done;								// matrix_multiply_0 -> myip_v1_0. 

	// Define the states of state machine (one hot encoding)
	localparam Idle  = 4'b1000;
	localparam Read_Inputs = 4'b0100;
	localparam Compute = 4'b0010;
	localparam Write_Outputs  = 4'b0001;

	reg [3:0] state;
	logic [3:0] next_state;

	// Accumulator to hold sum of inputs read at any point in time
	reg [31:0] sum;

	// Counters to store the number inputs read & outputs written.
	// Could be done using the same counter if reads and writes are not overlapped (i.e., no dataflow optimization)
	// Left as separate for ease of debugging
	reg [$clog2(NUMBER_OF_INPUT_WORDS) - 1:0] read_counter = '0;
	reg [$clog2(NUMBER_OF_OUTPUT_WORDS) - 1:0] write_counter = '0;

   // CAUTION:
   // The sequence in which data are read in and written out should be
   // consistent with the sequence they are written and read in the driver's hw_acc.c file

	/* Next State Logic */
	always_comb begin: next_state_logic
		case (state)
			Idle: 	if (S_AXIS_TVALID == 1) next_state = Read_Inputs; else next_state = Idle;
			Read_Inputs: if ((read_counter == NUMBER_OF_INPUT_WORDS - 1) || S_AXIS_TLAST) next_state = Compute; else next_state = Read_Inputs;
			Compute: if (Done) next_state = Write_Outputs; else next_state = Compute;
			Write_Outputs: if (write_counter == NUMBER_OF_OUTPUT_WORDS - 1) next_state = Idle; else next_state = Write_Outputs;
			default: next_state = Idle;
		endcase
	end
		
	/* State Memory */
	always_ff @(posedge ACLK) begin: state_memory
		if (!ARESETN) state <= Idle; else state <= next_state;
	end
	
	/* Counters */
	always_ff @(posedge ACLK) begin: counters
		if (!ARESETN) begin
			read_counter <= '0;
			write_counter <= '0;
		end else begin
			case(state)
				Idle: begin
					read_counter <= '0;
					write_counter <= '0;
				end
				Read_Inputs: read_counter <= (S_AXIS_TVALID) ? read_counter + 1 : read_counter; // increment read counter only if data is valid (which asserts either A_write_en or B_write_en)
				Compute: write_counter <= (Done && M_AXIS_TREADY) ? write_counter + 1 : write_counter; // increment write counter only if both Done is asserted and slave is ready to accept data
				Write_Outputs: write_counter <= (M_AXIS_TREADY) ? write_counter + 1 : write_counter; // increment write counter only if data is valid and slave is ready to accept data
			endcase
		end
	end
	
	/* Datapath */
	always_comb begin: datapath
		A_write_data_in = S_AXIS_TDATA[width-1:0];
		B_write_data_in = S_AXIS_TDATA[width-1:0];
		M_AXIS_TDATA = {24'b0,  RES_read_data_out}; // zero-extend to 32 bits
		A_write_address = read_counter;
		B_write_address = read_counter - NUMBER_OF_A_WORDS;
		RES_read_address = write_counter;
	end

	/* Output Registers */
	always_ff @(posedge ACLK) begin: output_registers
		// M_AXIS_TVALID and M_AXIS_TLAST are registered to align with one clock cycle RES_RAM read latency
		M_AXIS_TVALID <= 1'b0;
		M_AXIS_TLAST <= 1'b0;
		case (state)
			Compute: M_AXIS_TVALID <= Done;
			Write_Outputs: begin
				M_AXIS_TVALID <= 1'b1;
				M_AXIS_TLAST <= (write_counter == NUMBER_OF_OUTPUT_WORDS - 1) ? 1'b1 : 1'b0;
			end
		endcase
	end

	/* Output Logic */
	always_comb begin: output_logic
		S_AXIS_TREADY = '0;
		A_write_en = '0;
		B_write_en = '0;
		RES_read_en = '0;
		Start = '0;
		case(state)
			Idle: ;
			Read_Inputs: begin
				S_AXIS_TREADY = 1'b1;
				// assert enable based on read_counter value
				if (read_counter < NUMBER_OF_A_WORDS) begin
					A_write_en = S_AXIS_TVALID; // only write when data is valid
					B_write_en = 1'b0;
				end
				if ((read_counter >= NUMBER_OF_A_WORDS) && (read_counter < NUMBER_OF_INPUT_WORDS)) begin
					B_write_en = S_AXIS_TVALID; // only write when data is valid
					A_write_en = 1'b0;
				end
				if (read_counter == NUMBER_OF_INPUT_WORDS - 1) begin
					Start = 1'b1; // assert Start to start matrix multiplication
				end
			end
			Compute: begin
				S_AXIS_TREADY = 1'b0; // deassert S_AXIS_TREADY once all inputs are read
				A_write_en = 1'b0;
				B_write_en = 1'b0;
				Start = 1'b0; // deassert Start once in Compute state
				RES_read_en = Done; // assert RES read_en when Done is asserted to account for one cycle latency of RAM reads
			end
			Write_Outputs: RES_read_en = M_AXIS_TREADY; // only read when slave is ready to accept data
			default: ;
		endcase
	end

	memory_RAM 
	#(
		.width(width), 
		.depth_bits(A_depth_bits)
	) A_RAM 
	(
		.clka(ACLK),
		.clkb(ACLK),
		.ena(A_write_en),
		.wea(A_write_en),
		.addra(A_write_address),
		.dia(A_write_data_in),
		.enb(A_read_en),    
		.addrb(A_read_address),
		.dob(A_read_data_out)
	);
										
										
	memory_RAM 
	#(
		.width(width), 
		.depth_bits(B_depth_bits)
	) B_RAM 
	(
		.clka(ACLK),
		.clkb(ACLK),
		.ena(B_write_en),
		.wea(B_write_en),
		.addra(B_write_address),
		.dia(B_write_data_in),
		.enb(B_read_en),
		.addrb(B_read_address),
		.dob(B_read_data_out)
	);
																			
	memory_RAM 
	#(
		.width(width), 
		.depth_bits(RES_depth_bits)
	) RES_RAM 
	(
		.clka(ACLK),
		.clkb(ACLK),
		.ena(RES_write_en),
		.wea(RES_write_en),
		.addra(RES_write_address),
		.dia(RES_write_data_in),
		.enb(RES_read_en),	
		.addrb(RES_read_address),
		.dob(RES_read_data_out)
	);
										
	matrix_multiply 
	#(
		.width(width), 
		.A_depth_bits(A_depth_bits), 
		.B_depth_bits(B_depth_bits), 
		.RES_depth_bits(RES_depth_bits),
		.m(NUMBER_OF_A_ROWS),
		.n(NUMBER_OF_INNER_DIMENSIONS),
		.p(NUMBER_OF_B_COLS)
	) matrix_multiply_0
	(									
		.clk(ACLK),
		.ARESETN(ARESETN),
		.Start(Start),
		.Done(Done),
		
		.A_read_en(A_read_en),
		.A_read_address(A_read_address),
		.A_read_data_out(A_read_data_out),
		
		.B_read_en(B_read_en),
		.B_read_address(B_read_address),
		.B_read_data_out(B_read_data_out),
		
		.RES_write_en(RES_write_en),
		.RES_write_address(RES_write_address),
		.RES_write_data_in(RES_write_data_in)
	);

endmodule

