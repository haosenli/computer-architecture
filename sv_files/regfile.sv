module regfile(
		output logic [63:0] ReadData1, ReadData2, 
		input  logic [63:0] WriteData, 
		input  logic [4:0] ReadRegister1, ReadRegister2, WriteRegister,
		input  logic RegWrite, clk
	);
		logic [31:0] decode;
		enabled_decoder_5x32 decoder (.wr_en(RegWrite), .addr(WriteRegister), .decode(decode));
		
					
endmodule