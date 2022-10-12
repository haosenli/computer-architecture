module mux_8x1(
        input  logic [7:0] in,
        input  logic [2:0] sel,
        output logic out,
    );
    // temp outputs from 4x1 muxes
    logic [1:0] temp;
    // combining muxes
    mux_4x1 m1(in[7:4], sel[1:0], temp[1]);
    mux_4x1 m2(in[3:0], sel[1:0], temp[0]);
    mux_2x1 m3(temp, sel[2], out);
endmodule