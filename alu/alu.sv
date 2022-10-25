/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the ALU file.
 *
 * Inputs:
 * A, B         - 64 bits, Signals to be operated on.
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
	
    logic sum_sel_1, sum_sel_0, Cout_sel, sub;
    logic not_cntrl_2, and_cntrl_21;
    logic [63:0] cout, B_sub, B_in;

    // Calculate Cout_sel signal
    not #5 n0(not_cntrl_2, cntrl[2]);
    and #5 a0(and_cntrl_21, not_cntrl_2, cntrl[1]);
    not #5 n1(Cout_sel, and_cntrl_21);

    // Calculate sum_sel signal
    or  #5 o0(sum_sel1, not_cntrl_2, cntrl[1]);
    or  #5 o1(sum_sel0, cntrl[1], cntrl[0]);

    // Calculate sub signal
    and #5 a1(sub, Cout_sel, cntrl[0]);

	genvar i;
    // Add muxes to B input for add/subtract selection
    generate
        for (i=0; i<64; i++) begin: bsubs
            not n(B_sub[i], B[i]);
            mux_2x1 m(.in({B_sub[i], B[i]}), .sel(sub), .out(B_in[i]);
        end
    endgenerate

    // Connect adders together
    adder a0(.A(A[0]), .B(B_in[0]), .Cin(sub), .Cout_sel(Cout_sel), 
                    .sum_sel({sum_sel1, sum_sel0}), .sum(result[0]), .Cout(cout[0]));
    generate
        for (i=1; i<64; i++) begin: adders
            adder a(.A(A[i]), .B(B_in[i]), .Cin(cout[i-1]), .Cout_sel(Cout_sel), 
                    .sum_sel({sum_sel1, sum_sel0}), .sum(result[i]), .Cout(cout[i]));
        end
    endgenerate    
	
endmodule