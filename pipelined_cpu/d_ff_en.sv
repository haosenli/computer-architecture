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
        input  logic clk, d, en,
        output logic q
    );
    logic mux_d;
    mux_2x1 mux(.in({d, q}), .sel(en), .out(mux_d));
    d_ff dff(.q, .d(mux_d), .reset(1'b0), .clk);
endmodule // d_ff_en


// testbench
module d_ff_en_testbench();
    logic clk, d, en, q;

    // simulated clock
    parameter period = 100;
    initial begin 
        clk <= 0;
        forever #(period/2) clk <= ~clk;
    end

    d_ff_en dut(.*);

    initial begin 
        d <= 0; en <= 0;    @(posedge clk);
                en <= 1;    @(posedge clk);
        d <= 1; en <= 0;    @(posedge clk);
                en <= 1;    @(posedge clk); 
        $stop;
    end
endmodule // d_ff_en_testbench