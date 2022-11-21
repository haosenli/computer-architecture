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