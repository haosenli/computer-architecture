module data_mem(
	input  logic branch, clk,
	input  logic [63:0] ALuout_input, addr_result,
	output logic [63:0] ALUout_output,
	output logic [63:0] rd_data
	);
	
	logic [63:0] addr, wr_data, rd_data;
	logic [3:0] xfer_size;
	logic wr_en, rd_en, clk;
	
	datamem mem(.address(addr), .write_enable(wr_en), .read_enable(rd_en), .write_data(wr_data), .clk(clk),
					.xfer_size(xfer_size), .read_data(rd_data));
	
	
endmodule
