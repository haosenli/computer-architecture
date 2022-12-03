module reg_mem_wb(
    input  logic clk, reset,
    // DFF inputs
    input  logic MemtoReg_mem, RegWrite_mem, BLsignal_mem, zero_mem,
    input  logic [4:0] Rd_mem,
    input  logic [63:0] dm_read_data_mem, alu_result_mem, BLT_mem,
    // DFF outputs
    output logic MemtoReg_wb1, MemtoReg_wb2, RegWrite_wb1, RegWrite_wb2, BLsignal_wb, zero_wb,
    output logic [4:0] Rd_wb, Rd_for,
    output logic [63:0] dm_read_data_wb1, dm_read_data_wb2, alu_result_wb1, alu_result_wb2, BLT_wb
    );

    //n_dff #(1)   dff0 (.in(BrTaken_mem), .out(BrTaken_if), .*);
    n_dff #(1)   dff1 (.in(MemtoReg_mem), .out(MemtoReg_wb2), .*);
    n_dff #(1)   dff2 (.in(RegWrite_mem), .out(RegWrite_wb2), .*);
    n_dff #(5)  dff3 (.in(Rd_mem), .out(Rd_wb), .*);
    nn_dff #(5)   dff4 (.in(Rd_mem), .out(Rd_for), .*);
    n_dff #(64) dff5 (.in(dm_read_data_mem), .out(dm_read_data_wb2), .*);
    nn_dff #(64) dff6 (.in(alu_result_mem), .out(alu_result_wb1), .*);
    n_dff #(64)  dff7 (.in(alu_result_mem), .out(alu_result_wb2), .*);
    nn_dff #(1)   dff8 (.in(RegWrite_mem), .out(RegWrite_wb1), .*);
    n_dff #(1)   dff9 (.in(BLsignal_mem), .out(BLsignal_wb), .*);
    n_dff #(64)  dff10 (.in(BLT_mem), .out(BLT_wb), .*);
    nn_dff #(1)  dff11 (.in(zero_mem), .out(zero_wb), .*);
	 nn_dff #(64) dff12 (.in(dm_read_data_mem), .out(dm_read_data_wb1), .*);
	 nn_dff #(1)   dff13 (.in(MemtoReg_mem), .out(MemtoReg_wb1), .*);
    //n_dff #(64)  dff7 (.in(pc_mem), .out(pc_if), .*);

endmodule