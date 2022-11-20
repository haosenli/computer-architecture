/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for instruction fetch in a CPU.
 *
 * Inputs:
 * clk      - 1 bit, Clock signal.
 * WBsignal - 64 bits, Write Back signal from the WB stage.
 * pc_in    - 64 bits, Program counter signal.
 * BLT      - 64 bits, Branch link transfer signal.
 * COND_BR_addr - 19 bits, Conditional branch address.
 * BR_addr  - 26 bits, Branch address.
 * Reg2Loc  - 1 bit, Reg2Loc control signal.
 * ALUSrc   - 1 bit, ALUsrc control signal.
 * MemtoReg - 1 bit, MemtoReg control signal.
 * RegWrite - 1 bit, RegWrite control signal.
 * MemWrite - 1 bit, MemWrite control signal.
 * BrTaken  - 1 bit, BrTaken control signal.
 * BLsignal - 1 bit, BLsignal control signal.
 * ALUop    - 3 bits, ALUop control signal.
 * Rn       - 4 bits, Rn register address.
 * Rd       - 4 bits, Rd register address.
 * Rm       - 4 bits, Rm register address.
 * Rt       - 4 bits, Rt register address.
 * ALU_imm  - 12 bits, ALU_imm control signal.
 * DT_addr  - 9 bits, DT_addr control signal.
 * shamt    - 6 bits, Shift amount.
 *
 * Outputs:
 * BRsignal - 1 bit, BR selector signal for PC.
 * Da       - 64 bits, Da signal from RegFile.
 * Db       - 64 bits, Db signal from RegFile.
 * BR_to_shift - 64 bits, The sign-extended branch address.
 * pc_out   - 64 bits, Program counter signal.
 *
 */

module data_id (
    input  logic clk,
    input  logic [63:0] WBsignal, BLT, pc_in,
    input  logic [18:0] COND_BR_addr,
    input  logic [25:0] BR_addr,
    input  logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemWrite, 
    input  logic BrTaken, BLsignal, 
    input  logic [2:0] ALUop,
    input  logic [4:0] Rn, Rd, Rm, Rt,
    input  logic [11:0] ALU_imm,
    input  logic [8:0] DT_addr,
    input  logic [5:0] shamt,
	output logic BRsignal,
    output logic [63:0] Da, Db, BR_to_shift, pc_out,
	);

    // RegFile signals
    logic [63:0] Dw;
    logic [4:0] Ab;
    // Sign-extended addresses
    logic [63:0] COND_BR_addr64, BR_addr64;

    // PC pass through
    assign pc_out = pc_in;

    // Sign Extenders
    sign_extender #(19) se_0(.input_data(COND_BR_addr), .output_data(COND_BR_addr64));
    sign_extender #(26) se_0(.input_data(BR_addr), .output_data(BR_addr64));

    // 2x1 64-bits Mux for CondAddr19 and BrAddr26
    mux64_2x1 mux64_0(.sel(UnCondBr), .A(COND_BR_addr64), .B(BR_addr64), .out(BR_to_shift));

    // Muxes for RegFile
    mux5_2x1 mux5_0(.sel(Reg2Loc), .A(Rm), .B(Rd), .out(Ab));
    mux64_2x1 mux64_0(.sel(BLsignal), .A(BLT), .B(WBsignal), .out(Dw));

    // RegFile module
    regfile regfile_module(
        .ReadData1(Da), .ReadData2(Db), .WriteData(Dw),
        .ReadRegister1(Rn), .ReadRegister2(Ab), .WriteRegister(Rd),
        .RegWrite(RegWrite), .clk(clk));
endmodule
