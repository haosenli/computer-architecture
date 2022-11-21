/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This module changes the current bit length of the input data to be 64 bits by extending the left-most bit.
 *
 * Inputs:
 * input_data		- The current data to be sign extended
 *
 * Outputs:
 * output_data		-The 64 bit data after it is sign extended
 *
 */
`timescale 10ps / 1ps
module sign_extender #(parameter N=8) (
    input  logic [N-1:0] input_data,
	output logic [63:0] output_data
    );
	assign output_data[N-1:0] = input_data[N-1:0];
	genvar i;
	
	// Sign extends
	generate
		for (i = N; i < 64; i++) begin : signExtend
			assign output_data[i] = input_data[N-1]; 
		end
	endgenerate						  
endmodule

module sign_extender_testbench();
	parameter N = 2;
	logic [N-1:0] input_data;
	logic [63:0] output_data; 
	
	sign_extender #(N) dut (.*);
	
	initial begin
	    input_data = 2'b10; #1000;
	end
endmodule
