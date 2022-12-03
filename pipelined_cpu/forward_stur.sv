module forward_stur(
	input  logic MemWrite_wb,
	input  logic [4:0] Rd_mem, Rd_wb,
	output logic forward_stur
	);
	
	always_comb begin
		if (MemWrite_wb && (Rd_mem == Rd_wb)) begin
			forward_stur = 1'b1;
		end
		else begin
			forward_stur = 1'b0;
		end
	end
	
endmodule
