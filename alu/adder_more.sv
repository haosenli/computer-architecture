/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file performs other operations of the alu.
 *
 * Inputs:
 * A - 1 bit, A bit.
 * B - 1 bit, B bit.
 * sum_sel - 2 bits, selects the sum value.
 *
 * Outputs:
 * sum - 1 bit, Sum of the specified operation.
 */

`timescale 10ps / 1ps
module adder_more(
		input  logic A, B,
		input  logic [1:0] sum_sel,
		output logic sum
	);
	
	logic and_AB, xor_AB, or_AB;
	
	// Finds value of sum
	xor #5 xorAB (xor_AB, A, B);
	
	// output of A or B
	or #5 orAB (or_AB, A, B);
	
	and #5 andAB (and_AB, A, B);
	
	// Muxes to determine the output of sum and Cout
	mux_4x1 mux4x1 (.in({xor_AB, B, or_AB, and_AB}), .sel(sum_sel), .out(sum));

	
endmodule
