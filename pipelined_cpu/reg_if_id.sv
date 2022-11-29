module reg_if_id(
    input  logic clk, reset,
    // DFF inputs
    input  logic [63:0] BLT_if, pc_if,
    input  logic [18:0] COND_BR_addr_if,
    input  logic [25:0] BR_addr_if,
    input  logic Reg2Loc_if, ALUsrc_if, MemtoReg_if, RegWrite_if, MemWrite_if, BLsignal_if,
    input  logic cbz_if, branch_if, cond_if, update_if, UnCondBr_if, DTsignal_if,
    input  logic [2:0] ALUop_if,
    input  logic [3:0] xfer_size_if,
    input  logic [4:0] Rn_if, Rd_if, Rm_if,
    input  logic [11:0] ALU_imm_if,
    input  logic [8:0] DT_addr_if,
    input  logic [5:0] shamt_if,
    // DFF outputs
    output logic [63:0] BLT_id, pc_id,
    output logic [18:0] COND_BR_addr_id,
    output logic [25:0] BR_addr_id,
    output logic Reg2Loc_id, ALUsrc_id, MemtoReg_id, RegWrite_id, MemWrite_id, BLsignal_id,
    output logic cbz_id, branch_id, cond_id, update_id, UnCondBr_id, DTsignal_id,
    output logic [2:0] ALUop_id,
    output logic [3:0] xfer_size_id,
    output logic [4:0] Rn_id, Rd_id, Rm_id,
    output logic [11:0] ALU_imm_id,
    output logic [8:0] DT_addr_id,
    output logic [5:0] shamt_id,
);

    n_dff #(64) dff0 (.in(BLT_if), .out(BLT_id), .*);
    n_dff #(64) dff1 (.in(pc_if), .out(pc_id), .*);
    n_dff #(19) dff2 (.in(COND_BR_addr_if), .out(COND_BR_addr_id), .*);
    n_dff #(26) dff3 (.in(BR_addr_if), .out(BR_addr_id), .*);
    n_dff #(1) dff4 (.in(Reg2Loc_if), .out(Reg2Loc_id), .*);
    n_dff #(1) dff5 (.in(ALUsrc_if), .out(ALUsrc_id), .*);
    n_dff #(1) dff6 (.in(MemtoReg_if), .out(MemtoReg_id), .*);
    n_dff #(1) dff7 (.in(RegWrite_if), .out(RegWrite_id), .*);
    n_dff #(1) dff8 (.in(MemWrite_if), .out(MemWrite_id), .*);
    n_dff #(1) dff9 (.in(BLsignal_if), .out(BLsignal_id), .*);
    n_dff #(1) dff10 (.in(cbz_if), .out(cbz_id), .*);
    n_dff #(1) dff11 (.in(branch_if), .out(branch_id), .*);
    n_dff #(1) dff12 (.in(cond_if), .out(cond_id), .*);
    n_dff #(1) dff13 (.in(update_if), .out(update_id), .*);
    n_dff #(1) dff14 (.in(UnCondBr_if), .out(UnCondBr_id), .*);
    n_dff #(1) dff15 (.in(DTsignal_if), .out(DTsignal_id), .*);
    n_dff #(3) dff16 (.in(ALUop_if), .out(ALUop_id), .*);
    n_dff #(4) dff17 (.in(xfer_size_if), .out(xfer_size_id), .*);
    n_dff #(5) dff18 (.in(Rn_if), .out(Rn_id), .*);
    n_dff #(5) dff19 (.in(Rd_if), .out(Rd_id), .*);
    n_dff #(5) dff20 (.in(Rm_if), .out(Rm_id), .*);
    n_dff #(12) dff21 (.in(ALU_imm_if), .out(ALU_imm_id), .*);
    n_dff #(9) dff22 (.in(DT_addr_if), .out(DT_addr_id), .*);
    n_dff #(6) dff23 (.in(shamt_if), .out(sham_id), .*);

endmodule