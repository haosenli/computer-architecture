module reg_ex_mem(
    input  logic clk, reset,
    // DFF inputs
    input  logic [63:0] alu_result_ex, Db_ex, BLT_ex, //new_pc2_ex,
	 input  logic [4:0] Rd_ex,
	 input  logic [3:0] xfer_size_ex,
    input  logic negative_ex, zero_ex, MemtoReg_ex, RegWrite_ex, cbz_ex, branch_ex, BRsignal_ex, MemWrite_ex, BLsignal_ex,
    // DFF outputs
    output logic [63:0] alu_result_mem, Db_mem, BLT_mem,//new_pc2,
	 output logic [4:0] Rd_mem,
	 output logic [3:0] xfer_size_mem,
    output logic negative_mem, zero_mem, MemtoReg_mem, RegWrite_mem, cbz_mem, branch_mem, BRsignal_mem, MemWrite_mem, BLsignal_mem
);

    nn_dff #(64) dff0 (.in(alu_result_ex), .out(alu_result_mem), .*);
    nn_dff #(64) dff1 (.in(Db_ex), .out(Db_mem), .*);
    nn_dff #(64) dff2 (.in(BLT_ex), .out(BLT_mem), .*);
	 nn_dff #(5)  dff4 (.in(Rd_ex), .out(Rd_mem), .*);
	 nn_dff #(4)  dff5 (.in(xfer_size_ex), .out(xfer_size_mem), .*);
    nn_dff #(1)  dff6 (.in(negative_ex), .out(negative_mem), .*);
    nn_dff #(1)  dff7 (.in(zero_ex), .out(zero_mem), .*);
    nn_dff #(1)  dff8 (.in(MemtoReg_ex), .out(MemtoReg_mem), .*);
    nn_dff #(1)  dff9 (.in(RegWrite_ex), .out(RegWrite_mem), .*);
	 nn_dff #(1) dff10 (.in(cbz_ex), .out(cbz_mem), .*);
	 nn_dff #(1) dff11 (.in(branch_ex), .out(branch_mem), .*);
	 nn_dff #(1) dff12 (.in(BRsignal_ex), .out(BRsignal_mem), .*);
	 nn_dff #(1) dff13 (.in(MemWrite_ex), .out(MemWrite_mem), .*);
	 nn_dff #(1) dff14 (.in(BLsignal_ex), .out(BLsignal_mem), .*);

endmodule