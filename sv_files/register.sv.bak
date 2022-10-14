/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains register, which represents 
 * an array of 64 d flip-flops.
 *
 * Inputs:
 * clk      - (1-bit)   Clock signal.
 * wr_en    - (1-bit)   Enable signal.
 * wr_data  - (64-bits) Data in.
 *
 * Outputs:
 * rd_data  - (64-bits)  Data out.
 */

module register (
        input logic clk, wr_en, 
        input logic [63:0] wr_data,
        output logic [63:0] rd_data,
    );
    // create 64 d flip-flips
    genvar i;
    generate
        for (i=0; i<64; i++) begin: dffs
            d_ff_en dff (.d(wr_data[0]), .q(rd_data[0]), .en(wr_en), .clk(clk));
        end
    endgenerate
endmodule