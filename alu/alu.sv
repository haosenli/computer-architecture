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
    logic [63:0] cout, B_sub, B_in;
	 logic [15:0] temp_zero0;
	 logic [3:0] temp_zero1;

    // Calculate Cout_sel signal
    not #5 n0(not_cntrl_2, cntrl[2]);
    and #5 a0(Cout_sel, not_cntrl_2, cntrl[1]);
    //not #5 n1(Cout_sel, and_cntrl_21);

    // Calculate sum_sel signal
    or  #5 o0(sum_sel1, not_cntrl_2, cntrl[1]);
    or  #5 o1(sum_sel0, cntrl[1], cntrl[0]);

    // Calculate sub signal
    and #5 a1(sub, Cout_sel, cntrl[0]);

	 genvar i;
    // Add muxes to B input for add/subtract selection
    generate
        for (i=0; i<64; i++) begin: bsubs
            not #5 n(B_sub[i], B[i]);
            mux_2x1 m(.in({B_sub[i], B[i]}), .sel(sub), .out(B_in[i]));
        end
    endgenerate
	 
    // Connect adders together
    adder a2(.A(A[0]), .B(B_in[0]), .Cin(sub), .Cout_sel(Cout_sel), 
                    .sum_sel({sum_sel1, sum_sel0}), .sum(result[0]), .Cout(cout[0]));
    generate
        for (i=1; i<64; i++) begin: adders
            adder a(.A(A[i]), .B(B_in[i]), .Cin(cout[i-1]), .Cout_sel(Cout_sel), 
                    .sum_sel({sum_sel1, sum_sel0}), .sum(result[i]), .Cout(cout[i]));
        end
    endgenerate  

	 // Connect neg, c_out, flow output signals
	 and #5 neg (negative, result[63], 1'b1);
	 and #5 c_out (carry_out, cout[63], 1'b1);
	 xor #5 flow (overflow, cout[63], cout[62]);
	 
	 // Calculate zero signal
	 or #5 z0(temp_zero0[0], result[0], result[1], result[2], result[3]);
    or #5 z1(temp_zero0[1], result[4], result[5], result[6], result[7]);
    or #5 z2(temp_zero0[2], result[8], result[9], result[10], result[11]);
    or #5 z3(temp_zero0[3], result[12], result[13], result[14], result[15]);
    or #5 z4(temp_zero0[4], result[16], result[17], result[18], result[19]);
    or #5 z5(temp_zero0[5], result[20], result[21], result[22], result[23]);
    or #5 z6(temp_zero0[6], result[24], result[25], result[26], result[27]);
    or #5 z7(temp_zero0[7], result[28], result[29], result[30], result[31]);
    or #5 z8(temp_zero0[8], result[32], result[33], result[34], result[35]);
    or #5 z9(temp_zero0[9], result[36], result[37], result[38], result[39]);
    or #5 z10(temp_zero0[10], result[40], result[41], result[42], result[43]);
    or #5 z11(temp_zero0[11], result[44], result[45], result[46], result[47]);
    or #5 z12(temp_zero0[12], result[48], result[49], result[50], result[51]);
    or #5 z13(temp_zero0[13], result[52], result[53], result[54], result[55]);
    or #5 z14(temp_zero0[14], result[56], result[57], result[58], result[59]);
    or #5 z15(temp_zero0[15], result[60], result[61], result[62], result[63]);
	 
	 or #5 z16(temp_zero1[0], temp_zero0[0], temp_zero0[1], temp_zero0[2], temp_zero0[3]);
    or #5 z17(temp_zero1[1], temp_zero0[4], temp_zero0[5], temp_zero0[6], temp_zero0[7]);
    or #5 z18(temp_zero1[2], temp_zero0[8], temp_zero0[9], temp_zero0[10], temp_zero0[11]);
    or #5 z19(temp_zero1[3], temp_zero0[12], temp_zero0[13], temp_zero0[14], temp_zero0[15]);
	 
	 or #5 z20 (temp_zero, temp_zero1[0], temp_zero1[1], temp_zero1[2], temp_zero1[3]);
	 not #5 z21 (zero, temp_zero);
	
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
		A =  64'd10000; B =  64'd10000; #200; // Expected Output: 121933
		/* TWO NEGATIVE NUMBERS */
		A = -64'd53024; B = -64'd42502; #200; // Expected Output: -95526
		/* ZERO */
		A = 64'd2; B = -64'd1; #2000; // Expected Output: 0
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
		/* ZERO */
		A = 64'd5; B = -64'd5; #200; // Expected Output: 0
		/* OVERFLOW WITH TWO POSITIVE NUMBERS */
		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
		B = -64'b111111111111111111111111111111111111111111111111111111111111111; #200;
		// Expected Output: -2
		/* OVERFLOW WITH TWO NEGATIVE NUMBERS */
		A = -64'b111111111111111111111111111111111111111111111111111111111111111;
		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #1000;
		// Expected Output: 2
		
//		/* TEST 3: AND */
//		cntrl = 3'b100;
//		/* TWO POSITIVE NUMBERS */
//		A = 64'd759231314; B = 64'd371914018; #200;
//		/* TWO NEGATIVE NUMBERS */
//		A = -64'd31988; B = -64'd4924013; #200;
//		/* POSITIVE AND NEGATIVE */
//		A = 64'd4792834; B = -64'd7391931; #200;
//		/* ALL ONES AND ZEROS */
//		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
//		B = 64'd0; #200;
//		/* ALL ONES */
//		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
//		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #200;
		
//		/* TEST 3: OR */
//		cntrl = 3'b101;
//		/* TWO POSITIVE NUMBERS */
//		A = 64'd759231314; B = 64'd371914018; #200;
//		/* TWO NEGATIVE NUMBERS */
//		A = -64'd31988; B = -64'd4924013; #200;
//		/* POSITIVE AND NEGATIVE */
//		A = 64'd4792834; B = -64'd7391931; #200;
//		/* ALL ONES AND ZEROS */
//		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
//		B = 64'd0; #200;
//		/* ALL ONES */
//		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
//		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #200;
		
//		/* TEST 3: XOR */
//		cntrl = 3'b110;
//		/* TWO POSITIVE NUMBERS */
//		A = 64'd759231314; B = 64'd371914018; #200;
//		/* TWO NEGATIVE NUMBERS */
//		A = -64'd31988; B = -64'd4924013; #200;
//		/* POSITIVE AND NEGATIVE */
//		A = 64'd4792834; B = -64'd7391931; #200;
//		/* ALL ONES AND ZEROS */
//		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
//		B = 64'd0; #200;
//		/* ALL ONES */
//		A = 64'b111111111111111111111111111111111111111111111111111111111111111;
//		B = 64'b111111111111111111111111111111111111111111111111111111111111111; #200;
	end
	
endmodule
