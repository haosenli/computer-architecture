/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the adder64 file. This module can only do simple addition.
 *
 * Inputs:
 * A, B         - 64 bits, Two's complements signals to be operated on.
 *
 * Outputs:
 * result       - 64 bits, Adder result.
 */

`timescale 10ps / 1ps
module adder64(
    input  logic [63:0] A, B,
    output logic [63:0] result,
    );
    logic [63:0] cout;
    genvar i;
    // Connect adders together
    adder add0(.A(A[0]), .B(B[0]), .Cin(sub), .sum(result[0]), .Cout(cout[0]));
    generate
        for (i=1; i<64; i++) begin
            adder add(.A(A[i]), .B(B[i]), .Cin(cout[i-1]), .sum(result[i]), .Cout(cout[i]));
        end
    endgenerate
endmodule