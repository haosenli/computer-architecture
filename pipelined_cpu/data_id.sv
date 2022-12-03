/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for instruction fetch in a CPU.
 *
 * Inputs:
 * clk      		- 1 bit, Clock signal.
 * update   		- 1 bit, Update flags signal.
 * Reg2Loc  		- 1 bit, Reg2Loc control signal.
 * ALUSrc   		- 1 bit, ALUsrc control signal.
 * MemtoReg 		- 1 bit, MemtoReg control signal.
 * RegWrite 		- 1 bit, RegWrite control signal.
 * MemWrite 		- 1 bit, MemWrite control signal.
 * BrTaken  		- 1 bit, BrTaken control signal.
 * BLsignal 		- 1 bit, BLsignal control signal.
 * UnCondBr `		- 1 bit, UnCondBr control signal.
 * DTsignal 		- 1 bit, DTsignal control signal.
 * WBsignal 		- 64 bits, Write Back signal from the WB stage.
 * pc_if    		- 64 bits, Program counter signal.
 * BLT      		- 64 bits, Branch link transfer signal.
 * COND_BR_addr 	- 19 bits, Conditional branch address.
 * BR_addr  		- 26 bits, Branch address.
 * ALUop    		- 3 bits, ALUop control signal.
 * Rn       		- 4 bits, Rn register address.
 * Rd       		- 4 bits, Rd register address.
 * Rm       		- 4 bits, Rm register address.
 * ALU_imm  		- 12 bits, ALU_imm control signal.
 * DT_addr  		- 9 bits, DT_addr control signal.
 * shamt    		- 6 bits, Shift amount.
 *
 * Outputs:
 * Da       		- 64 bits, Da signal from RegFile.
 * Db       		- 64 bits, Db signal from RegFile.
 * pc_id   			- 64 bits, Program counter signal.
 * BR_to_shift 	    - 64 bits, The sign-extended branch address.
 * ALU_imm_extend   - 64 bits, The sign-extended ALU_imm address.
 * DT_addr_extend   - 64 bits, The sign-extended DT_addr address.
 * ALU_or_DT		- 64 bits, Either ALU or DT signal.
 * BRsignal 		- 1 bit, BR selector signal for PC.
 * update_flags 	- 1 bit, Update flags signal.
 */

`timescale 10ps / 1ps
module data_id (
    input  logic clk, Reg2Loc, ALUsrc, MemtoReg,
    input  logic RegWrite, MemWrite, BLsignal, UnCondBr, DTsignal, cbz, branch, cond, zero_ex, negative_ex,
    input  logic [63:0] WBsignal, BLT, PC,
    input  logic [18:0] COND_BR_addr,
    input  logic [25:0] BR_addr,
    input  logic [2:0] ALUop,
    input  logic [4:0] Rn, Rd_id, Rd_wb, Rm,
    input  logic [11:0] ALU_imm,
    input  logic [8:0] DT_addr,
    input  logic [5:0] shamt,
    output logic [63:0] Da, Db, /*BR_to_shift,*/ ALU_or_DT, new_PC2,
	 output logic [4:0] Ab,
	 output logic BrTaken
	);

    // RegFile signals
    logic [63:0] Dw;
    // Sign-extended addresses
    logic [63:0] COND_BR_addr64, BR_addr64, ALU_imm_extend, DT_addr_extend, BR_to_shift, BR_PC;
	 logic [4:0] Rd;
	 
	 logic temp_BrTaken, zero, negative, carry_out, overflow, Bcond_branch;
	 alu_flags flag(.result(Db), .cout_out(64'd0), .zero(zero), .negative(negative), .carry_out(carry_out), .overflow(overflow));
	 
    // BrTaken signal
    and #5 a0(temp_BrTaken, zero, cbz);
	 B_cond_decode Bcond(.negative(negative_ex), .zero(zero_ex), .cond, .Rd(Rd_id), .branch(Bcond_branch));
	 or #5 or0(BrTaken, temp_BrTaken, branch, Bcond_branch);

    // Sign Extenders
    sign_extender #(19) se_0(.input_data(COND_BR_addr), .output_data(COND_BR_addr64));
    sign_extender #(26) se_1(.input_data(BR_addr), .output_data(BR_addr64));
	 sign_extender #(12) se_2(.input_data(ALU_imm), .output_data(ALU_imm_extend));
	 sign_extender #(9)  se_3(.input_data(DT_addr), .output_data(DT_addr_extend));

    // 2x1 64-bits Mux for CondAddr19 and BrAddr26
    mux64_2x1 mux64_0(.sel(UnCondBr), .A(BR_addr64), .B(COND_BR_addr64), .out(BR_to_shift));
	 mux64_2x1 mux64_1(.sel(DTsignal), .A(DT_addr_extend), .B(ALU_imm_extend), .out(ALU_or_DT));
	 
	 // shifts BR_addr by 2
	shifter shift_2 (.value(BR_to_shift), .direction(1'b0), .distance(6'd2), .result(BR_PC));
	
	// adds new BR_addr to PC
	adder64 addPC (.A(BR_PC), .B(PC), .result(new_PC2));

    // Muxes for RegFile
    mux5_2x1 mux5_0(.sel(Reg2Loc), .A(Rm), .B(Rd_id), .out(Ab));
    mux64_2x1 mux64_2(.sel(BLsignal), .A(BLT), .B(WBsignal), .out(Dw));
	 //mux5_2x1 mux5_1(.sel(BLsignal), .A(Rd_id), .B(Rd_wb), .out(Rd));

    // RegFile module
    regfile regfile_module(
        .ReadData1(Da), .ReadData2(Db), .WriteData(Dw),
        .ReadRegister1(Rn), .ReadRegister2(Ab), .WriteRegister(Rd_id),
        .RegWrite(RegWrite), .clk(clk));
endmodule

`timescale 10ps/1ps
module data_id_testbench();
    logic clk, update, Reg2Loc, ALUsrc, MemtoReg, cbz, branch, cond, zero_ex, negative_ex, BRsignal_id;
    logic RegWrite, MemWrite, BrTaken, BLsignal, BRsignal, UnCondBr, DTsignal;
    logic [63:0] WBsignal, BLT, PC;
    logic [18:0] COND_BR_addr;
    logic [25:0] BR_addr;
    logic [2:0] ALUop;
    logic [4:0] Rn, Rd_id, Rd_wb, Rm, Rt, Ab;
    logic [11:0] ALU_imm;
    logic [8:0] DT_addr;
    logic [5:0] shamt;
    logic [63:0] Da, Db, BR_to_shift, pc_id, ALU_imm_extend, DT_addr_extend, ALU_or_DT, new_PC2;
    
    data_id dut (.*);

    parameter ClockDelay = 125;
    initial begin // Set up the clock
        clk <= 0;
        forever #(ClockDelay/2) clk <= ~clk;
    end

    initial begin
        RegWrite <= 1; Rn <= 5'd8; Rm <= 5'd8; Rd_id <= 5'd8; BLsignal <= 1'b1; BLT <= 64'd69; Reg2Loc <= 1; repeat(5) @(posedge clk);
        $stop;
    end
endmodule