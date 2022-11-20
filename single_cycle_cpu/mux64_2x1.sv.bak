/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the mux64_2x1 module, a 64-bits 2x1 mux.
 *
 * Inputs:
 * sel      - 1 bit, Mux selector ("1" selects "A", "0" selects "B")
 * A, B     - 64 bits, Inputs to the mux.
 *
 * Outputs:
 * out      - 64 bits, Adder result.
 */
module mux64_2x1(
    input  logic sel,
    input  logic [63:0] A, B,
    output logic [63:0] out
    );
    genvar i;
    generate
        for (i=0; i<64; i++) begin
            mux_2x1 mux(.in({A[i], B[i]}), .sel(sel), .out(out[i]));
        end
    endgenerate
endmodule

`timescale 10ps/1ps
module mux64_2x1_testbench();
    logic sel;
    logic [63:0] A, B, out;

    mux64_2x1 dut(.*);

    initial begin
        A = 64'd10; B = 64'd20; sel = 0; #100;
                                sel = 1; #100;
        A = 64'd40; B = 64'd80; sel = 0; #100;
                                sel = 1; #100;
        $stop;
    end
endmodule