/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This module takes the input and runs it through a dff.
 *
 * Parameters:
 *	N					- Default: 64, specify the length of the input data.
 *
 * Inputs:
 * input		        - N-1 bits, The current data.
 *
 * Outputs:
 * out          		- N-1 bits, data after being put through a dff.
 *
 */
module nn_dff #(parameter N=64) (
        input  logic clk, reset,
        input  logic [N-1:0] in,
        output logic [N-1:0] out
    );

    genvar i;
    generate
        for(i=0; i<N;i++) begin : dff
            d_ff_neg dff_neg (.q(out[i]), .d(in[i]), .reset, .clk);
        end
    endgenerate

endmodule