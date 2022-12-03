module forward_cbz(
	input  logic RegWrite_ex, RegWrite_mem, RegWrite_wb,
	input  logic [4:0] reg_cbz, Rd_ex, Rd_mem, Rd_wb,
	output logic [1:0] forward_cbz
	);
	
	always_comb begin
		// check if there is a register that is equal to regA being changed in the EX stage.
		if (RegWrite_ex && (Rd_ex == reg_cbz) && (Rd_ex != 5'd31)) begin
			forward_cbz = 2'b01;
		end
		// check if there is a register that is equal to regA being changed in the MEM stage.
		else if (RegWrite_mem && (Rd_mem == reg_cbz) && (Rd_mem != 5'd31)) begin
			forward_cbz = 2'b10;
		end
		else if (RegWrite_wb && (Rd_wb == reg_cbz) && (Rd_wb != 5'd31)) begin
			forward_cbz = 2'b11;
		end
		// dont forward
		else begin
			forward_cbz = 2'b00;
		end
	end
	
endmodule
