/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the single cycle cpu module.
 *
 * Inputs:
 * clk  - 1 bit, clock signal.
 *
 * Outputs:
 */

module single_cycle_cpu(input logic clk);
    // Control signals
    logic BRsignal, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemWrite, BrTaken, BLsignal;
    logic negative, zero, overflow, carry_out, branch, cbz, MemtoReg, update, update_flags;
    logic [2:0] ALUop;
    // Data signals
    logic [5:0] shamt;
    logic [11:0] ALU_imm;
    logic [63:0] Da, Db, BR_to_shift, BLT, WBsignal,
    logic [63:0] alu_result, dm_address, dm_read_data, dm_write_data;
    // Program counter
    logic [63:0] pc, pc_id, new_pc2_ex, new_pc2;
    // Addresses
    logic [8:0] DT_addr;
    logic [18:0] COND_BR_addr;
    logic [25:0] BR_addr;
    // Registers
    logic [4:0] Rn, Rd, Rm, Rt;

    // Sign extension
    sign_extender #(12) alu_imm_se(.input_data(ALU_imm), .output_data(ALU_imm_extend));

    // Datapath stages
    data_if if_module(.*);
    data_id id_module(.pc_if(pc), .pc_id(pc_id), .*);
    data_ex ex_module(.ReadData1(Da), .ReadData2(Db), .PC(pc_id), .ReadData2_out(dm_write_data), .new_PC2(new_pc2_ex), .*);
    data_mem mem_module(.MemtoReg_in(), .MemtoReg_out(MemtoReg), .write_data(dm_write_data), .*);
    data_wb wb_module(.*);
endmodule