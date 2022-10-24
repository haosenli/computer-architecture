`timescale 10 ps/ 1 ps
module mux_2x1(
        input  logic [1:0] in,
        input  logic sel,
        output logic out
    );
    logic temp0, temp1, not_sel;
    and #5 a0(temp0, in[1], sel);
    not #5 n0(not_sel, sel);
    and #5 a1(temp1, in[0], not_sel);
    or  #5 o0(out, temp0, temp1);
endmodule // mux_2x1


// testbench
`timescale 10 ps/ 1 ps
module mux_2x1_testbench();
    logic [1:0] in;
    logic sel, out;

    mux_2x1 dut(.*);

    initial begin 
        in = 2'b00; sel = 0; #10;
        in = 2'b00; sel = 1; #10;
        in = 2'b01; sel = 0; #10;
        in = 2'b01; sel = 1; #10;
        in = 2'b10; sel = 0; #10;
        in = 2'b10; sel = 1; #10;
        in = 2'b11; sel = 0; #10;
        in = 2'b11; sel = 1; #10;
        $stop;
    end
endmodule // mux_2x1_testbench

