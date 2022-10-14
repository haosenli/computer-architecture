module mux_4x1(
        input  logic [3:0] in,
        input  logic [1:0] sel,
        output logic out
    )
    // temp outputs from 2x1 muxes
    logic [1:0] temp;
    // combining muxes
    mux_2x1 m1(in[3:2], sel[0], temp[1]);
    mux_2x1 m2(in[1:0], sel[0], temp[0]);
    mux_2x1 m3(temp[1:0], sel[1], out);
endmodule