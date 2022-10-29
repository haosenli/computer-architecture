/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file computes xor-ing bits together.
 *
 * Inputs:
 * A - 1 bit, A bit.
 * B - 1 bit, B bit.
 * sel - 1 bit, selects the out value.
 *
 * Outputs:
 * Cout - 1 bit, Output of A xor B.
 */
module xorAB (
	input logic A, B, sel,
	output logic out
	);
	
	logic xor1;
	
	// A xor B
	xor #5 xor_AB (xor1, A, B);
	
	// Mux to decide whether to output A xor B or 0
	mux_2x1 mux2x1 (.in({and1, 1'b0}), .sel(sel), .out(out)); 
	
endmodule