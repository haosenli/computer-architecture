module reg_id_ex(
    input  logic clk, reset,
    // DFF inputs
    input  logic [63:0] Da_id, Db_id, BR_to_shift_id, pc_id_id, ALU_imm_extend_id, DT_addr_extend_id, ALU_or_DT_id,
    input  logic BRsignal_id, update_flags_id, cbz_id,
    // DFF outputs
    output logic [63:0] Da_ex, Db_ex, BR_to_shift_ex, pc_id_ex, ALU_imm_extend_ex, DT_addr_extend_ex, ALU_or_DT_ex,
    output logic BRsignal_ex, update_flags_ex, cbz_ex
);

    n_dff #(64) dff0 (.in(Da_id), .out(Da_ex), .*);
    n_dff #(64) dff1 (.in(Db_id), .out(Db_ex), .*);
    n_dff #(64) dff2 (.in(BR_to_shift_id), .out(BR_to_shift_ex), .*);
    n_dff #(64) dff3 (.in(pc_id_id), .out(pc_id_ex), .*);
    n_dff #(64) dff4 (.in(ALU_imm_extend_id), .out(ALU_imm_extend_ex), .*);
    n_dff #(64) dff5 (.in(DT_addr_extend_id), .out(DT_addr_extend_ex), .*);
    n_dff #(64) dff6 (.in(ALU_or_DT_id), .out(ALU_or_DT_ex), .*);
    n_dff #(1)  dff7 (.in(BRsignal_id), .out(BRsignal_ex), .*);
    n_dff #(1)  dff8 (.in(update_flags_id), .out(update_flags_ex), .*);
    n_dff #(1)  dff9 (.in(cbz_i_id), .out(cbz_i_ex), .*);

endmodule