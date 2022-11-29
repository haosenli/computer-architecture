/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the ALU file.
 *
 * Inputs:
 * A, B         - 64 bits, Two's complements signals to be operated on.
 * cntrl        - 3 bits, Control signal.
 *
 * Outputs:
 * result       - 64 bits, Adder result.
 * negative     - 1 bit, True if output is negative, false otherwise.
 * zero         - 1 bit, True if output is zero, false otherwise.
 * overflow     - 1 bit, True if output overflowed, false otherwise.
 * carry_out    - 1 bit, Carry out signal.
 */

`timescale 10ps / 1ps
module alu(
		input  logic [63:0] A, B,
		input  logic [2:0] cntrl,
		output logic [63:0] result,
		output logic negative, zero, overflow, carry_out
	);
	 // Create intermediate signals
    logic sum_sel1, sum_sel0, Cout_sel, sub, temp_zero;
    logic not_cntrl_2, and_cntrl_21;
    logic [63:0] cout, B_sub, B_in, a_result, am_result, cout_out;
    logic [15:0] temp_zero0;
    logic [3:0] temp_zero1;

    // docode signals
    alu_signals signals_module(.*);

    genvar i;
    // Add muxes to B input for add/subtract selection
    generate
        for (i=0; i<64; i++) begin: bsubs
            not #5 n(B_sub[i], B[i]);
            mux_2x1 m(.in({B_sub[i], B[i]}), .sel(sub), .out(B_in[i]));
        end
    endgenerate
	 
    // Connect adders and adder_mores together
    adder a2(.A(A[0]), .B(B_in[0]), .Cin(sub), .sum(a_result[0]), .Cout(cout[0]));
    adder_more am0(.A(A[0]), .B(B_in[0]), .sum_sel({sum_sel1, sum_sel0}), .sum(am_result[0]));
    generate
        for (i=1; i<64; i++) begin: adders
            adder a(.A(A[i]), .B(B_in[i]), .Cin(cout[i-1]), .sum(a_result[i]), .Cout(cout[i]));
            adder_more am(.A(A[i]), .B(B_in[i]), .sum_sel({sum_sel1, sum_sel0}), .sum(am_result[i]));
        end
    endgenerate
	 
    // build muxes for result
    generate
        for (i=0; i<64; i++) begin: muxes
            mux_2x1 m0(.in({a_result[i], am_result[i]}), .sel(Cout_sel), .out(result[i]));
            mux_2x1 m1(.in({cout[i], 1'b0}), .sel(Cout_sel), .out(cout_out[i]));
        end
    endgenerate

    // calculate flags
	alu_flags flags_module(.*);
endmodule



`timescale 10 ps/ 1 ps
module alu_testbench();
	logic [63:0] A, B;
	logic [2:0] cntrl;
	logic [63:0] result;
	logic negative, zero, overflow, carry_out;
	
	alu dut (.*);
	
	initial begin
		/* TEST 1: ADDITION*/
		cntrl = 3'b010;	// Addition
		/* TWO POSITIVE NUMBERS */
		A =  64'd10000; B =  64'd10000; #200; // Expected Output: 20000
		/* TWO NEGATIVE NUMBERS */
		A = -64'd53024; B = -64'd42502; #200; // Expected Output: -95526
		/* POSITIVE AND NEGATIVE */
		A = 64'd2; B = -64'd1; #2000; // Expected Output: 1
		/* OVERFLOW WITH TWO POSITIVE NUMBERS */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #200;
		// Expected Output: -2
		/* OVERFLOW WITH TWO NEGATIVE NUMBERS */
		A = -64'b111111111111111111111111111111111111111111111111111111111111111;
		B = -64'b111111111111111111111111111111111111111111111111111111111111111; #200;
		// Expected Output: 2
		
		/* TEST 2: SUBTRACTION */
		cntrl = 3'b011;	// Subtraction
		/* TWO POSITIVE NUMBERS */
		A =  64'd37912; B =  64'd84021; #200; // Expected Output: -46109
		/* TWO NEGATIVE NUMBERS */
		A = -64'd53024; B = -64'd42502; #2000; // Expected Output: -10522
		/* POSITIVE AND NEGATIVE */
		A = 64'd5; B = -64'd5; #200; // Expected Output: 0
		/* OVERFLOW WITH TWO POSITIVE NUMBERS */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = -64'b111111111111111111111111111111111111111111111111111111111111111; #200;
		// Expected Output: -2
		/* OVERFLOW WITH TWO NEGATIVE NUMBERS */
		A = -64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #1000;
		// Expected Output: 2
		
		/* TEST 3: AND */
		cntrl = 3'b100;
		/* TWO POSITIVE NUMBERS */
		A = 64'd759231314; B = 64'd371914018; #200;
		/* TWO NEGATIVE NUMBERS */
		A = -64'd31988; B = -64'd4924013; #200;
		/* POSITIVE AND NEGATIVE */
		A = 64'd4792834; B = -64'd7391931; #200;
		/* ALL ONES AND ZEROS */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'd0; #200;
		/* ALL ONES */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #200;
		
		/* TEST 3: OR */
		cntrl = 3'b101;
		/* TWO POSITIVE NUMBERS */
		A = 64'd759231314; B = 64'd371914018; #200;
		/* TWO NEGATIVE NUMBERS */
		A = -64'd31988; B = -64'd4924013; #200;
		/* POSITIVE AND NEGATIVE */
		A = 64'd4792834; B = -64'd7391931; #200;
		/* ALL ONES AND ZEROS */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'd0; #200;
		/* ALL ONES */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #200;
		
		/* TEST 3: XOR */
		cntrl = 3'b110;
		/* TWO POSITIVE NUMBERS */
		A = 64'd759231314; B = 64'd371914018; #200;
		/* TWO NEGATIVE NUMBERS */
		A = -64'd31988; B = -64'd4924013; #200;
		/* POSITIVE AND NEGATIVE */
		A = 64'd4792834; B = -64'd7391931; #200;
		/* ALL ONES AND ZEROS */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'd0; #200;
		/* ALL ONES */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #200;
	end
	
endmodule

//module alustim();
//
//	parameter delay = 100000;
//
//	logic [63:0] A, B;
//	logic [2:0]  cntrl;
//	logic [63:0] result;
//	logic        negative, zero, overflow, carry_out;
//
//	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
//	
//
//	alu dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);
//
//	// Force %t's to print in a nice format.
//	initial $timeformat(-9, 2, " ns", 10);
//
//	integer i;
//	logic [63:0] test_val;
//	initial begin
//	
//		$display("%t testing PASS_A operations", $time);
//		cntrl = ALU_PASS_B;
//		for (i=0; i<100; i++) begin
//			A = $random(); B = $random();
//			#(delay);
//			assert(result == B && negative == B[63] && zero == (B == '0));
//		end
//		
//		$display("%t testing addition", $time);
//		cntrl = ALU_ADD;
//		A = 64'h0000000000000001; B = 64'h0000000000000001;
//		#(delay);
//		assert(result == 64'h0000000000000002 && carry_out == 0 && overflow == 0 && negative == 0 && zero == 0);
//		
//	end
//endmodule
