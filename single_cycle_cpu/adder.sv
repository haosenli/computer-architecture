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
 *
 * Outputs:
 * sum - 1 bit, Sum of the specified operation.
 * Cout - 1 bit, Carry out.
 */

`timescale 10ps / 1ps
module adder(
		input  logic A, B, Cin,
		output logic sum, Cout
	);
	
	logic and1, and2, and3, out, add_sum, or_AB;
	
	// Finds value of sum
	xor #5 summ (sum, A, B, Cin);
	
	// Checks if Cout exists
	and #5 c_cout1 (and1, A, B);
	and #5 c_cout2 (and2, A, Cin);
	and #5 c_cout3 (and3, B, Cin);
	or #5 c_out (Cout, and1, and2, and3);
	
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
		for (int i = 0; i < 8; i++) begin
			{A, B, Cin} = i; #200;
		end
	end
	
endmodule