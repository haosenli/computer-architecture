`timescale 10 ps / 1 ps
module enabled_decoder_5x32(
		input logic wr_en,
		input logic [4:0] addr,
		output logic [31:0] decode);
		
		logic y0, y1, y2, y3;
		logic not_addr3, not_addr4;
		
		not #5 not_addr_3 (not_addr3, addr[3]);
		not #5 not_addr_4 (not_addr4, addr[4]);
		
		// add not
		and #5 two_four_00 (y0, not_addr4, not_addr3, wr_en);
		and #5 two_four_01 (y1, not_addr4, addr[3], wr_en);
		and #5 two_four_10 (y2, addr[4], not_addr3, wr_en);
		and #5 two_four_11 (y3, addr[4], addr[3], wr_en);

		decoder_3x8 decode0 (.decode(decode[7:0]), .A(addr[2]), .B(addr[1]), .C(addr[0]), .enable(y0));
		decoder_3x8 decode1 (.decode(decode[15:8]), .A(addr[2]), .B(addr[1]), .C(addr[0]), .enable(y1));
		decoder_3x8 decode2 (.decode(decode[23:16]), .A(addr[2]), .B(addr[1]), .C(addr[0]), .enable(y2));
		decoder_3x8 decode3 (.decode(decode[31:24]), .A(addr[2]), .B(addr[1]), .C(addr[0]), .enable(y3));

//		& ^ *
//	always_ff @(posedge clk) begin
//		if (wr_en) begin
//			if (addr == 5'd31)
//				enable[addr] <= 32'd0;
//			else
//				enable[addr] <= regWrite;
//		end			
//	end
	
endmodule

module enabled_decoder_5x32_testbench();
	logic wr_en;
	logic [4:0] addr;
	logic [31:0] decode;
	
	enabled_decoder_5x32 dut (.*);
	
	integer i;
	initial begin
		wr_en = 0;
		for (int i = 0; i < 32; i++) begin
			addr = i; #1000;
		end
		wr_en = 1; #10;
		for (int i = 0; i < 32; i++) begin
			addr = i; #1000;
		end
	end
endmodule