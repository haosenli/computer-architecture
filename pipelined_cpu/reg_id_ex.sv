module reg_id_ex(
    input  logic clk, reset,
    // DFF inputs
    input  logic [63:0] Da_id, Db_id, BR_to_shift_id, pc_id, ALU_or_DT_id,
	 input  logic [4:0] Rd_id,
	 input  logic [3:0] xfer_size_id,
	 input  logic [2:0] ALUop_id,
    input  logic ALUsrc_id, MemtoReg_id, RegWrite_id, MemWrite_id, cbz_id, branch_id, BRsignal_id, update_id,
    // DFF outputs
    output logic [63:0] Da_ex, Db_ex, BR_to_shift_ex, pc_ex, ALU_or_DT_ex,
	 output logic [4:0] Rd_ex,
	 output logic [3:0] xfer_size_ex,
	 output logic [2:0] ALUop_ex,
    output logic ALUsrc_ex, MemtoReg_ex, RegWrite_ex, MemWrite_ex, cbz_ex, branch_ex, BRsignal_ex, update_ex
);

    n_dff #(64) dff0 (.in(Da_id), .out(Da_ex), .*);
    n_dff #(64) dff1 (.in(Db_id), .out(Db_ex), .*);
    n_dff #(64) dff2 (.in(BR_to_shift_id), .out(BR_to_shift_ex), .*);
    n_dff #(64) dff3 (.in(pc_id), .out(pc_ex), .*);
    n_dff #(64) dff6 (.in(ALU_or_DT_id), .out(ALU_or_DT_ex), .*);
	 n_dff #(5)  dff7 (.in(Rd_id), .out(Rd_ex), .*);
    n_dff #(1)  dff8 (.in(ALUsrc_id), .out(ALUsrc_ex), .*);
    n_dff #(1)  dff9 (.in(MemtoReg_id), .out(MemtoReg_ex), .*);
	 n_dff #(1) dff10 (.in(RegWrite_id), .out(RegWrite_ex), .*);
	 n_dff #(1) dff11 (.in(MemWrite_id), .out(MemWrite_ex), .*);
	 n_dff #(1) dff12 (.in(cbz_id), .out(cbz_ex), .*);
	 n_dff #(1) dff13 (.in(branch_id), .out(branch_ex), .*);
	 n_dff #(1) dff14 (.in(BRsignal_id), .out(BRsignal_ex), .*);
	 n_dff #(1) dff15 (.in(update_id), .out(update_ex), .*);
	 n_dff #(4) dff16 (.in(xfer_size_id), .out(xfer_size_ex), .*);
	 n_dff #(3) dff17 (.in(ALUop_id), .out(ALUop_ex), .*);

endmodule