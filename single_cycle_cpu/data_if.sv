/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for instruction fetch in a CPU.
 *
 * Inputs:
 * clk      - 1 bit, Clock signal.
 * negative - 1 bit, ALU negative flag.
 * zero     - 1 bit, ALU zero flag.
 * BrTaken  - 1 bit, BrTaken control signal.
 * reset    - 1 bit, CPU reset signal.
 * Db       - 64 bits, Db signal from RegFile.
 * new_pc2  - 64 bits, New program counter value.
 *
 * Outputs:
 * BLT      - 64 bits, Branch link transfer signal.
 * pc       - 64 bits, Program counter signal.
 * COND_BR_addr - 19 bits, Conditional branch address.
 * BR_addr  - 26 bits, Branch address.
 * Reg2Loc  - 1 bit, Reg2Loc control signal.
 * ALUSrc   - 1 bit, ALUsrc control signal.
 * MemtoReg - 1 bit, MemtoReg control signal.
 * RegWrite - 1 bit, RegWrite control signal.
 * MemWrite - 1 bit, MemWrite control signal.
 * BLsignal - 1 bit, BLsignal control signal.
 * cbz      - 1 bit, CBZ control signal.
 * branch   - 1 bit, Branch control signal.
 * cond     - 1 bit, Cond control signal.
 * update   - 1 bit, Flags update control signal.
 * UnCondBr - 1 bit, UnCondBr control signal.
 * DTSignal - 1 bit, DTsignal control signal.
 * ALUop    - 3 bits, ALUop control signal.
 * Rn       - 4 bits, Rn register address.
 * Rd       - 4 bits, Rd register address.
 * Rm       - 4 bits, Rm register address.
 * Rt       - 4 bits, Rt register address.
 * ALU_imm  - 12 bits, ALU_imm control signal.
 * DT_addr  - 9 bits, DT_addr control signal.
 * shamt    - 6 bits, Shift amount.
 */
`timescale 10ps/1ps
module data_if (
    input  logic clk, negative, zero, BrTaken, reset,
    input  logic [63:0] Da, new_pc2,
    output logic [63:0] BLT, pc,
    output logic [18:0] COND_BR_addr,
    output logic [25:0] BR_addr,
    output logic Reg2Loc, ALUsrc, MemtoReg, RegWrite, MemWrite, BLsignal, 
	output logic cbz, branch, cond, update, UnCondBr, DTsignal,
    output logic [2:0] ALUop,
	output logic [3:0] xfer_size,
    output logic [4:0] Rn, Rd, Rm,
    output logic [11:0] ALU_imm,
    output logic [8:0] DT_addr,
    output logic [5:0] shamt
    );
    // General signals
    logic [63:0] new_pc, new_pc1, new_pc3;
    logic [31:0] instruction;
    // Internal control signals
    logic BRsignal;
	 assign BLT = new_pc1;

    // Program Counter
    program_counter pc_module(.in(new_pc3), .out(pc), .*);

    // 2x1 64-bit Muxes for selecting PC
    mux64_2x1 mux64_1(.sel(BrTaken), .A(new_pc2), .B(new_pc1), .out(new_pc));
    mux64_2x1 mux64_2(.sel(BRsignal), .A(Da), .B(new_pc), .out(new_pc3));

    // New Program Counter
    adder64 adder64_1(.A(pc), .B(64'd4), .result(new_pc1));

    // Instruction Memory
    instructmem im_module(.address(pc), .instruction(instruction), .clk(clk));

    // Instruction Decoder
    instruction_decoder id_module(.*);

endmodule

`timescale 10ps/1ps
module data_if_testbench();
    logic clk, negative, zero, BrTaken, reset;
    logic [63:0] Da, new_pc2;
    logic [63:0] BLT, pc;
    logic [18:0] COND_BR_addr;
    logic [25:0] BR_addr;
    logic Reg2Loc, ALUsrc, MemtoReg, RegWrite, MemWrite, DTsignal, UnCondBr, BLsignal, update;
    logic cbz, branch, cond;
    logic [2:0] ALUop;
    logic [3:0] xfer_size;
    logic [4:0] Rn, Rd, Rm, Rt;
    logic [11:0] ALU_imm;
    logic [8:0] DT_addr;
    logic [5:0] shamt;
    logic [31:0] instruction;
	 
    data_if dut (.*);
	 
    parameter ClockDelay = 125;
    initial begin // Set up the clock
        clk <= 0;
        forever #(ClockDelay/2) clk <= ~clk;
    end
    
    initial begin
        reset <= 1; @(posedge clk);
        reset <= 0; 
        //Test 1: Adding
        negative <= 1'b0; zero <= 1'b0; Da <= 64'd1; new_pc2 <= 64'd64;
        BrTaken <= 1'b0; @(posedge clk);
        instruction <= 32'b10010001000000011111100101101111; repeat(100) @(posedge clk);
        $stop;
    end
endmodule
