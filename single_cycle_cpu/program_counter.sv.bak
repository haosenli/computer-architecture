module program_counter(
    input  logic clk, reset,
    input  logic [63:0] in,
    output logic [63:0] out
    );
    generate
        for (genvar i=0; i<64; i++) begin: DFFs
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