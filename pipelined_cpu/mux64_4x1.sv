/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the mux64_4x1 module, a 64-bits 4x1 mux.
 *
 * Inputs:
 * sel          - 2 bits, Mux selector ("00" selects "A", "01" selects "B", "10" selects "C", "11" selects "D")
 * A, B, C, D   - 64 bits, Inputs to the mux.
 *
 * Outputs:
 * out      - 64 bits, Adder result.
 */
module mux64_4x1(
    input  logic [1:0] sel,
    input  logic [63:0] A, B, C, D,
    output logic [63:0] out
    );
    genvar i;
    generate
        for (i=0; i<64; i++) begin : mux64
            mux_4x1 mux(.in({D[i], C[i], B[i], A[i]}), .sel(sel), .out(out[i]));
        end
    endgenerate
endmodule

`timescale 10ps/1ps
module mux64_4x1_testbench();
    logic [1:0] sel;
    logic [63:0] A, B, C, D, out;

    mux64_4x1 dut(.*);

    initial begin
        A = 64'd10; B = 64'd20; C = 64'd30; D = 64'd40;
                                sel = 2'b00; #100;
                                sel = 2'b01; #100;
                                sel = 2'b10; #100;
                                sel = 2'b11; #100;
        $stop;
    end
endmodule