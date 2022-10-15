module mux_32x1(
        input  logic [31:0] in,
        input  logic [4:0] sel,
        output logic out
    );
    // temp outputs from 16x1 muxes
    logic [1:0] temp;
    // combining muxes
    mux_16x1 m1(in[31:16], sel[3:0], temp[1]);
    mux_16x1 m2(in[15:0], sel[3:0], temp[0]);
    mux_2x1 m3(temp, sel[4], out);
endmodule


// testbench
`timescale 10 ps/ 1 ps
module mux_32x1_testbench();
    logic [31:0] in;
    logic [4:0] sel;
    logic out;

    mux_32x1 dut(.*);

    initial begin 
        // in = 32'b01010101010101010101010101010101;
        in = 32'b00000000000000011111111111111111;
        sel = 5'd0; #10;
		sel = 5'd1; #10;
		sel = 5'd2; #10;
		sel = 5'd3; #10;
		sel = 5'd4; #10;
		sel = 5'd5; #10;
		sel = 5'd6; #10;
		sel = 5'd7; #10;
		sel = 5'd8; #10;
		sel = 5'd9; #10;
		sel = 5'd10; #10;
		sel = 5'd11; #10;
		sel = 5'd12; #10;
		sel = 5'd13; #10;
		sel = 5'd14; #10;
		sel = 5'd15; #10;
		sel = 5'd16; #10;
		sel = 5'd17; #10;
		sel = 5'd18; #10;
		sel = 5'd19; #10;
		sel = 5'd20; #10;
		sel = 5'd21; #10;
		sel = 5'd22; #10;
		sel = 5'd23; #10;
		sel = 5'd24; #10;
		sel = 5'd25; #10;
		sel = 5'd26; #10;
		sel = 5'd27; #10;
		sel = 5'd28; #10;
		sel = 5'd29; #10;
		sel = 5'd30; #10;
		sel = 5'd31; #10;
        $stop;
    end
endmodule // mux_2x1_testbench