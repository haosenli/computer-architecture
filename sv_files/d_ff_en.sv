/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains d_ff, a d flip-flop module.
 *
 * Inputs:
 * clk - Clock signal.
 * d - Input signal.
 * en - Enable signal.
 *
 * Outputs:
 * q - Output signal.
 */

module d_ff_en (
        input logic clk, d, en,
        output logic q
    );
    always @(posedge clk or posedge reset) begin
        if (en) q <= d;
    end
endmodule