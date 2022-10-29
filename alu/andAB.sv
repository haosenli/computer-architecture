/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file computes anding bits together.
 *
 * Inputs:
 * A - 1 bit, A bit.
 * B - 1 bit, B bit.
 * sel - 1 bit, selects the out value.
 *
 * Outputs:
 * Cout - 1 bit, Output of A and B.
 */
module andAB (
	input logic A, B, sel,
	output logic out
	);
	
	logic and1;
	
	// A and B
	and #5 and_AB (and1, A, B);
	
	// Mux to decide whether to output A and B or 0
	mux_2x1 mux2x1 (.in({and1, 1'b0}), .sel(sel), .out(out)); 
	
endmodule
