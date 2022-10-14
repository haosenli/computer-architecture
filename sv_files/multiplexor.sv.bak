module multiplexor(
        input  logic [31:0][63:0] in,
        input  logic [4:0] addr,
        output logic [63:0] out
    );
    // create 64 32x1 muxes
    genvar i;
    generate
        for (i=0; i<64; i++) begin: muxes
            mux_32x1 mux (.in(in[31:0][i]), .sel(addr), .out(out[i]));
        end
    endgenerate
endmodule