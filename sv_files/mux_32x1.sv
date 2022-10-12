module mux_32x1(
        input  logic [31:0] in,
        input  logic [4:0] sel,
        output logic out,
    );
    // temp outputs from 16x1 muxes
    logic [1:0] temp;
    // combining muxes
    mux_16x1 m1(in[31:16], sel[3:0], temp[1]);
    mux_16x1 m2(in[15:0], sel[3:0], temp[0]);
    mux_2x1 m3(temp, sel[4], out);
endmodule