`timescale 1ns / 1ps

/* 
----------------------------------------------------------------------------------
--	(c) Rajesh C Panicker, NUS
--  Description : Template for the Matrix Multiply unit for the AXI Stream Coprocessor
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

// those outputs which are assigned in an always block of matrix_multiply shoud be changes to reg (such as output reg Done).

module matrix_multiply
	#(	parameter width = 8, 			// width is the number of bits per location
		parameter A_depth_bits = 3, 	// depth is the number of locations (2^number of address bits)
		parameter B_depth_bits = 2, 
		parameter RES_depth_bits = 1, 

		parameter m = 2, 		// A rows
		parameter n = 4, 		// A cols
		parameter p = 1			// B cols
	) 
	(
		input clk,		
		input ARESETN, 								
		input Start,									// myip_v1_0 -> matrix_multiply_0.
		output reg Done,									// matrix_multiply_0 -> myip_v1_0. Possibly reg.

		output reg A_read_en,  								// matrix_multiply_0 -> A_RAM. Possibly reg.
		output reg [A_depth_bits-1:0] A_read_address, 		// matrix_multiply_0 -> A_RAM. Possibly reg.
		input [width-1:0] A_read_data_out,				// A_RAM -> matrix_multiply_0.
		
		output reg B_read_en, 								// matrix_multiply_0 -> B_RAM. Possibly reg.
		output reg [B_depth_bits-1:0] B_read_address, 		// matrix_multiply_0 -> B_RAM. Possibly reg.
		input [width-1:0] B_read_data_out,				// B_RAM -> matrix_multiply_0.
		
		output reg RES_write_en, 							// matrix_multiply_0 -> RES_RAM. Possibly reg.
		output reg [RES_depth_bits-1:0] RES_write_address, 	// matrix_multiply_0 -> RES_RAM. Possibly reg.
		output reg [width-1:0] RES_write_data_in 			// matrix_multiply_0 -> RES_RAM. Possibly reg.
	);
	
	// implement the logic to read A_RAM, read B_RAM, do the multiplication and write the results to RES_RAM
	// Note: A_RAM and B_RAM are to be read synchronously. Read the wiki for more details.

	// States of FSM with OHE
	localparam Idle = 2'b01;
	localparam MAC = 2'b10;

	reg[1:0] state;
	reg first_mac_cycle;
	reg last_mac_cycle;

	// Counters
	localparam M_BITS = (m > 1) ? $clog2(m) : 1;
	localparam N_BITS = (n > 1) ? $clog2(n) : 1;
	localparam P_BITS = (p > 1) ? $clog2(p) : 1;
	reg [M_BITS-1:0] m_counter;
	reg [N_BITS-1:0] n_counter;
	reg [P_BITS-1:0] p_counter;

	// Store product of element wise multiplication 
	reg[31:0] mul;

	// Accumulator 
	reg[31:0] acc; 

	// FSM State Sync Block 
	always @(posedge clk)
	begin
		if (!ARESETN) state <= Idle; 
		else
		case (state)

		Idle: 
		begin
			first_mac_cycle <= 0;
			last_mac_cycle 	<= 0;
			Done 	<= 0;

			if (Start == 1)		
			begin
				state		<= MAC;
				first_mac_cycle <= 1;
			end
		end

		MAC:
		begin
			if (first_mac_cycle) first_mac_cycle <= 0;
			if ((m_counter == m-1) && (n_counter == n-1) && (p_counter == p-1)) 	last_mac_cycle <= 1;
			// last element has been written to RES
			if (last_mac_cycle)
			begin
				last_mac_cycle <= 0;
				Done <= 1;
				state <= Idle;
			end
		end
		endcase
	end
	
	// Sync block for counter incrementing 
	// all counters wrap after reaching max_val - 1
	always @(posedge clk) 
	begin
		case (state)
		Idle:
			begin
				m_counter 	<= 0;
				n_counter 	<= (Start) ? n_counter + 1 : 0;
				p_counter 	<= 0;
			end
		MAC:
			if (state == MAC)
			begin
				// n_counter increments and wraps every clk cycle
				if (n_counter == n-1)	n_counter	<= 0; else 	n_counter	<= n_counter + 1;

				// p_counter increments every wrapping of n_counter 
				if (n_counter == n-1)
				begin
					if (p_counter == p-1)	p_counter	<= 0; else p_counter	<= p_counter + 1;	
				end

				// m_counter increments every wrapping of n_counter && p_counter
				if ((n_counter == n-1) && (p_counter == p-1))
				begin
					if (m_counter == m-1)	m_counter	<= 0; else	m_counter	<= m_counter + 1;
				end
			end 
		endcase
	end

	// synchronous block to handle accumulates
	always @(posedge clk) 
	begin
		case(state)
		Idle:
		begin 
			acc		<= 0;
		end
		MAC:
			begin
				if (Start) acc <= 0;
				// reset acc for next element in RES
				if (RES_write_en)	acc	<= mul; else 	acc <= acc + mul;
			end
		endcase
	end 

	// synchronous block to handle RES writing during MAC
	always @(posedge clk)
	begin
		// set default values for write enable
		RES_write_en <= 0;
		if (state == Idle) RES_write_address <= 0;

		if ((state == MAC) && (n_counter == 0) && (!first_mac_cycle))			RES_write_en <= 1;
		
		// prev clk cycle has written to prev address
		if ((state == MAC) && (RES_write_en))		RES_write_address <= RES_write_address + 1;
	end

	// FSM State Comb block
	always @(*)
	begin
		A_read_address = (m_counter * n) + n_counter;
		B_read_address = (n_counter * p)+ p_counter;
		mul = A_read_data_out * B_read_data_out;
        A_read_en = 1'b0;
        B_read_en = 1'b0;
		// divide by 256 equivalent to LSR by 8 bits 
		RES_write_data_in = acc >> 8; 

		case(state)

		Idle:
		begin
			A_read_en = Start;
			B_read_en = Start; 
		end

		MAC:
		begin
			// keep read enables high for entire MAC state 
			A_read_en = 1;
			B_read_en = 1; 
            if (Start) mul = 0;			
		end
		endcase
	end
endmodule


