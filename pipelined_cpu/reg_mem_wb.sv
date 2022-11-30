module reg_mem_wb(
    input  logic clk, reset,
    // DFF inputs
    input  logic BrTaken_mem, MemtoReg_out_mem,
    input  logic [63:0] dm_address_mem, dm_read_data_mem, new_pc2_mem,
    // DFF outputs
    output logic BrTaken_wb, MemtoReg_out_wb,
    output logic [63:0] dm_address_wb, dm_read_data_wb, new_pc2_wb
);

    nn_dff #(1)  dff0 (.in(BrTaken_mem), .out(BrTaken_wb), .*);
    nn_dff #(1)  dff1 (.in(MemtoReg_out_mem), .out(MemtoReg_out_wb), .*);
    nn_dff #(64) dff2 (.in(dm_address_mem), .out(dm_address_wb), .*);
    nn_dff #(64) dff3 (.in(dm_read_data_mem), .out(dm_read_data_wb), .*);
    nn_dff #(64) dff4 (.in(new_pc2_mem), .out(new_pc2_wb), .*);

endmodule