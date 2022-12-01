module reg_mem_wb(
    input  logic clk, reset,
    // DFF inputs
    input  logic BrTaken_mem, MemtoReg_mem, BRsignal_mem,
	 input  logic [4:0] Rd_mem,
    input  logic [63:0] dm_read_data_mem, alu_result_mem, new_pc2_mem, pc_mem,
    // DFF outputs
    output logic BrTaken_if, MemtoReg_wb, BRsignal_if,
	 output logic [4:0] Rd_wb,
    output logic [63:0] dm_read_data_wb, alu_result_wb, new_pc2_if, pc_if
);

    n_dff #(1)   dff0 (.in(BrTaken_mem), .out(BrTaken_if), .*);
    n_dff #(1)   dff1 (.in(MemtoReg_mem), .out(MemtoReg_wb), .*);
	 n_dff #(1)   dff2 (.in(BRsignal_mem), .out(BRsignal_if), .*);
	 n_dff #(5)   dff3 (.in(Rd_mem), .out(Rd_wb), .*);
    nn_dff #(64) dff4 (.in(dm_read_data_mem), .out(dm_read_data_wb), .*);
    nn_dff #(64) dff5 (.in(alu_result_mem), .out(alu_result_wb), .*);
	 n_dff #(64)  dff6 (.in(new_pc2_mem), .out(new_pc2_if), .*);
	 n_dff #(64)  dff7 (.in(pc_mem), .out(pc_if), .*);

endmodule