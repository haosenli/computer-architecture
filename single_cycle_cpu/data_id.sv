/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for instruction fetch in a CPU.
 *
 * Inputs:
 * clk      - 1 bit, Clock signal.
 * BLT      - 64 bits, Branch link transfer signal.
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
 * Db       - 64 bits, Db signal from RegFile.
 *
 */

module data_id (
    input  logic clk,
    input  logic [63:0] BLT,
    input  logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemWrite, 
    input  logic BrTaken, BLsignal, 
    input  logic [2:0] ALUop,
    input  logic [4:0] Rn, Rd, Rm, Rt,
    input  logic [11:0] ALU_imm,
    input  logic [8:0] DT_addr,
    input  logic [5:0] shamt,
	output logic BRsignal,
    output logic [63:0] Db
	);

    // RegFile inputs
    

    // RegFile module
    regfile regfile_module(
        .ReadData1(), .ReadData2(), .WriteData(),
        .ReadRegister1(), .ReadRegister2(), .WriteRegister1(),
        .RegWrite(), .clk(clk)
        );
    
	
endmodule
