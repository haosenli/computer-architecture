module regfile(
		output logic [63:0] ReadData1, ReadData2, 
		input  logic [63:0] WriteData, 
		input  logic [4:0] ReadRegister1, ReadRegister2, WriteRegister,
		input  logic RegWrite, clk
	);
		logic [31:0] decode;
		logic [31:0][63:0] data;
		
		enabled_decoder_5x32 decoder (.wr_en(RegWrite), .addr(WriteRegister), .decode(decode));
		
		genvar i;
		generate
        for (i=0; i<31; i++) begin: registers
            register regi (.clk(clk), .wr_en(decode[i]), .wr_data(WriteData), .rd_data(data[i][63:0]));
        end
		endgenerate
		register regi31 (.clk(clk), .wr_en(1'b1), .wr_data(64'd0), .rd_data(data[31][63:0]));
					
		multiplexor mux_32v1 (.in(data), .addr(ReadRegister1), .out(ReadData1));
		multiplexor mux_32v2 (.in(data), .addr(ReadRegister2), .out(ReadData2));
		
endmodule 