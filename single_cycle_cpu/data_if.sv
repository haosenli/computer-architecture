/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for instruction fetch in a CPU.
 *
 * Inputs:
 * clk      - 1 bit, Clock signal.
 * BRsignal - 1 bit, BR selector signal for PC.
 * Db       - 64 bits, Db signal from RegFile.
 *
 * Outputs:
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
 */

module data_if (
    input  logic clk, BRsignal,
    input  logic [63:0] Db,
    output logic [63:0] BLT,
    output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemWrite, 
    output logic BrTaken, BLsignal, 
    output logic [2:0] ALUop,
    output logic [4:0] Rn, Rd, Rm, Rt,
    output logic [11:0] ALU_imm,
    output logic [8:0] DT_addr,
    output logic [5:0] shamt
    );
    // General signals
    logic [63:0] pc, new_pc, temp_pc, adder_addr;
    logic [31:0] instruction;
    // Internal control signals
    logic UnCondBr;
    // Addresses
    logic [18:0] COND_BR_addr,
    logic [25:0] BR_addr,
    // Sign-extended addresses
    logic [63:0] COND_BR_addr64, BR_addr64, selected_addr64;

    // Sign Extenders
    sign_extender #(19) se_0(.input_data(COND_BR_addr), .output_data(COND_BR_addr64));
    sign_extender #(26) se_0(.input_data(BR_addr), .output_data(BR_addr64));

    // 2x1 64-bits Mux for CondAddr19 and BrAddr26
    mux64_2x1 mux64_0(.sel(UnCondBr), .A(COND_BR_addr64), .B(BR_addr64), .out(selected_addr64));

    // 2x1 64-bit Muxes for selecting PC
    mux64_2x1 mux64_1(.sel(BrTaken), .A(adder_addr), .B(new_pc), .out(temp_pc));
    mux64_2x1 mux64_2(.sel(BRsignal), .A(Db), .B(temp_pc), .out(pc));

    // Logical Left Shift 2 into Adder
    adder64 adder64_0(.A({selected_addr64[61:0], 2'b00}), .B(pc), .result(adder_addr_0));

    // New Program Counter
    adder64 adder64_1(.A(pc), .b(64'd4), .result(new_pc));    

    // Instruction Memory
    instructmem im_module(.address(pc), .instruction(instruction), .clk(clk));

    // Instruction Decoder
    instruction_decoder id_module(.*);

endmodule