/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file computes adding bits together.
 *
 * Inputs:
 * A - 1 bit, A bit.
 * B - 1 bit, B bit.
 * Cin - Carry in.
 * Cout_sel - 1 bit, selects the Cout value.
 * sum_sel - 2 bits, selects the sum value.
 *
 * Outputs:
 * sum - 1 bit, Sum of the specified operation.
 * Cout - 1 bit, Carry out.
 */

`timescale 10ps / 1ps
module adder(
		input  logic A, B, Cin, Cout_sel,
		input  logic [1:0] sum_sel,
		output logic sum, Cout
	);
	
	logic and1, and2, and3, out, add_sum, or_AB;
	
	// Finds value of sum
	//xor #5 summ (sum, A, B, Cin);
	
	// output of A or B
	//or #5 orAB (or_AB, A, B);
	
	// Checks if Cout exists
	and #5 c_cout1 (and1, A, B);
	and #5 c_cout2 (and2, A, Cin);
	and #5 c_cout3 (and3, B, Cin);
	or #5 c_out (Cout, and1, and2, and3);
	//or  #5 c_out (out, A, B);
	
	// Muxes to determine the output of sum and Cout
	//mux_2x1 mux2x1 (.in({out, 1'b0}), .sel(Cout_sel), .out(Cout)); 
	//mux_4x1 mux4x1 (.in({add_sum, B, or_AB, and1}), .sel(sum_sel), .out(sum));
	//mux_4x1 mux4x1 (.in({add_sum, B, or_AB, 1'b0}), .sel(sum_sel), .out(sum));

	
endmodule

`timescale 10 ps / 1 ps
module adder_testbench ();
	logic A, B, Cin, Cout_sel;
	logic [1:0] sum_sel;
	logic sum, Cout;
	
	adder dut (.*);
	
	integer i;
	initial begin
		
		/* TEST 1: ADDITION AND SUBTRACTION */
		Cout_sel <= 1'b1; sum_sel <= 2'b11;
		for (int i = 0; i < 8; i++) begin
			{A, B, Cin} = i; #200;
		end
		
		/* TEST 2: B AS OUTPUT */
		Cout_sel <= 1'b0; sum_sel <= 2'b10;
		for (int i = 0; i < 8; i++) begin
			{A, B, Cin} = i; #200;
		end
		
		/* TEST 3: A OR B */
		Cout_sel <= 1'b0; sum_sel <= 2'b01;
		for (int i = 0; i < 8; i++) begin
			{A, B, Cin} = i; #200;
		end
		
		/* TEST 4: A*/
		Cout_sel <= 1'b0; sum_sel <= 2'b00;
		for (int i = 0; i < 8; i++) begin
			{A, B, Cin} = i; #200;
		end
	end
	
endmodule