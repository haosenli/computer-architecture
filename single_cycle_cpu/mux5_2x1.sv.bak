/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the mux5_2x1 module, a 5-bits 2x1 mux.
 *
 * Inputs:
 * sel      - 1 bit, Mux selector ("1" selects "A", "0" selects "B")
 * A, B     - 5 bits, Inputs to the mux.
 *
 * Outputs:
 * out      - 5 bits, Adder result.
 */
module mux5_2x1(
    input  logic sel,
    input  logic [4:0] A, B,
    output logic [4:0] out
    );
    genvar i;
    generate
        for (i=0; i<5; i++) begin
            mux_2x1 mux(.in({A[i], B[i]}), .sel(sel), .out(out[i]));
        end
    endgenerate
endmodule