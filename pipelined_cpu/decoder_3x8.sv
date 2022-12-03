`timescale 10 ps / 1 ps
module decoder_3x8 (decode, A, B, C, enable);
	input logic A, B, C, enable;
	output logic [7:0] decode;
	
	logic notA, notB, notC;
	
	not #5 not_A (notA, A);
	not #5 not_B (notB, B);
	not #5 not_C (notC, C);
	
	and #5 three_eight_000 (decode[0], notA, notB, notC, enable);
	and #5 three_eight_001 (decode[1], notA, notB, C, enable);
	and #5 three_eight_010 (decode[2], notA, B, notC, enable);
	and #5 three_eight_011 (decode[3], notA, B, C, enable);
	and #5 three_eight_100 (decode[4], A, notB, notC, enable);
	and #5 three_eight_101 (decode[5], A, notB, C, enable);
	and #5 three_eight_110 (decode[6], A, B, notC, enable);
	and #5 three_eight_111 (decode[7], A, B, C, enable);
	
endmodule

`timescale 10 ps / 1 ps
module decoder_3x8_testbench ();
	logic A, B, C, enable;
	logic [7:0] decode;
	
	decoder_3x8 dut (.*);
	
	integer i;
	initial begin
	
		enable = 0;
		for (int i = 0; i < 8; i++) begin
			{A, B, C} = i; #200;
		end
		enable = 1; A = 0; B = 0; C = 0; #200;
		for (int i = 0; i < 8; i++) begin
			{A, B, C} = i; #200;
		end
	end
	
endmodule