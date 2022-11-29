/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the program counter in a CPU.
 *
 * Inputs:
 * clk			- 1 bit, Clock signal.
 * reset			- 1 bit, Sets the out to be 0 if true.
 * in   			- 64 bits, Value to be inputted into the D_FF.
 *
 * Outputs:
 * out 			- 64 bits, Output value of the D_FF.
 *
 */
module program_counter(
    input  logic clk, reset,
    input  logic [63:0] in,
    output logic [63:0] out
    );
	 genvar i;
    generate
        for (i=0; i<64; i++) begin: DFFs
            d_ff pc_dff(.q(out[i]), .d(in[i]), .*);
        end
    endgenerate
endmodule

`timescale 10ps/1ps
module program_counter_testbench();
    logic [63:0] in, out;
    logic clk, reset;
    program_counter dut (.*);

    parameter ClockDelay = 125;
    initial begin // Set up the clock
        clk <= 0;
        forever #(ClockDelay/2) clk <= ~clk;
    end

    initial begin
		  reset <= 1;                   @(posedge clk);
		  reset <= 0;                   @(posedge clk);
		  in <= 64'd69;     repeat(3)   @(posedge clk);
          in <= 64'd469;    repeat(3)   @(posedge clk);
          reset <= 1;                   @(posedge clk);
          reset <= 0;                   @(posedge clk);
		  $stop;
    end
endmodule