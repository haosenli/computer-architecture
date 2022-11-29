module multiplexor(
        input  logic [31:0][63:0] in,
        input  logic [4:0] addr,
        output logic [63:0] out
    );
    // create 64 32x1 muxes
	 
    genvar i;
    generate
        for (i=0; i<64; i++) begin: muxes
            mux_32x1 m(
					.in({
                        in[31][i], in[30][i], in[29][i], 
                        in[28][i], in[27][i], in[26][i], 
                        in[25][i], in[24][i], in[23][i], 
                        in[22][i], in[21][i], in[20][i], 
                        in[19][i], in[18][i], in[17][i], 
                        in[16][i], in[15][i], in[14][i], 
                        in[13][i], in[12][i], in[11][i], 
                        in[10][i], in[9][i],  in[8][i], 
                        in[7][i],  in[6][i],  in[5][i], 
                        in[4][i],  in[3][i],  in[2][i], 
                        in[1][i], in[0][i]
                        }), .sel(addr), .out(out[i]));
        end
    endgenerate
endmodule


// testbench
`timescale 10 ps/ 1 ps
module multiplexor_testbench();

	logic [31:0][63:0] in;
	logic [4:0] addr;
	logic [63:0] out;
	
	multiplexor dut(.*);

    initial begin
        
        $stop;
    end
endmodule // multiplexor_testbench