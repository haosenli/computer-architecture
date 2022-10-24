`timescale 10ps / 1ps
module adder(
		input  logic A, B, Cin,
		output logic sum, Cout
	);
	
	logic and1, and2, and3;
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
	logic A, B, Cin;
	logic sum, Cout;
	
	adder dut (.*);
	
	integer i;
	initial begin
	
		for (int i = 0; i < 8; i++) begin
			{A, B, Cin} = i; #200;
		end
	end
	
endmodule