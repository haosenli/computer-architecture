`timescale 10ps / 1ps
module sign_extender #(parameter N=8) (
    input  logic [N-1:0] input_data,
	output logic [63:0] output_data
    );
	genvar i;
	// Adds the current input data to the output data
	generate
		for (i = 0; i < N; i++) begin : adder
			or #5 add_data(output_data[i], input_data[i], 1'b0);
		end
	endgenerate
	
	// Sign extends
	generate
		for (i = N; i < 64; i++) begin : signExtend
			or #5 sign_extend(output_data[i], output_data[i - 1], 1'b0);
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
