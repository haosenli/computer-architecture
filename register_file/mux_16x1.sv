module mux_16x1(
        input  logic [15:0] in,
        input  logic [3:0] sel,
        output logic out
    );
    // temp outputs from 8x1 muxes
    logic [1:0] temp;
    // combining muxes
    mux_8x1 m1(in[15:8], sel[2:0], temp[1]);
    mux_8x1 m2(in[7:0], sel[2:0], temp[0]);
    mux_2x1 m3(temp, sel[3], out);
endmodule