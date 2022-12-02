/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for instruction fetch in a CPU.
 *
 * Inputs:
 * clk      		- 1 bit, Clock signal.
 * instruction    - 32 bits, Instruction to decode.
 *
 * Outputs:
 * Reg2Loc  		- 1 bit, Reg2Loc control signal.
 * ALUsrc   		- 1 bit, ALUsrc control signal.
 * MemtoReg 		- 1 bit, MemtoReg control signal.
 * RegWrite 		- 1 bit, RegWrite control signal.
 * MemWrite 		- 1 bit, MemWrite control signal.
 * UnCondBr			- 1 bit, UnCondBr control signal.
 * BLsignal 		- 1 bit, BLsignal control signal.
 * BRsignal 		- 1 bit, BRsignal control signal.
 * update			- 1 bit, signal to update flags in ALU.
 * cond 				- 1 bit, B.cond signal.
 * CBZ				- 1 bit, CBZ signal.
 * branch			- 1 bit, branch signal.
 * ALUop    		- 3 bits, ALUop control signal.
 * xfer_size 		- 4 bits, xfer size control signal.
 * Rn       		- 5 bits, Rn register address.
 * Rd       		- 5 bits, Rd register address.
 * Rm       		- 5 bits, Rm register address.
 * ALU_imm  		- 12 bits, ALU_imm control signal.
 * COND_BR_addr 	- 19 bits, Conditional branch address.
 * DT_addr  		- 9 bits, DT_addr control signal.
 * BR_addr  		- 26 bits, Branch address.
 * shamt    		- 6 bits, Shift amount.
 */
`timescale 10ps / 1ps
module instruction_decoder(
	input  logic clk, negative, zero,
    input  logic [31:0] instruction,
    output logic Reg2Loc, ALUsrc, MemtoReg, RegWrite, MemWrite, DTsignal,
    output logic UnCondBr, BLsignal, BRsignal, update, cond, cbz, branch, 
	 output logic [2:0] ALUop, 
	 output logic [3:0] xfer_size,
    output logic [4:0] Rn, Rd, Rm,
    output logic [11:0] ALU_imm,
    output logic [18:0] COND_BR_addr,
    output logic [8:0] DT_addr,
    output logic [25:0] BR_addr,
    output logic [5:0] shamt
    );
	 
    logic Bcond_branch, temp_branch;
	 
//	 // Decide if branching is needed.
//    B_cond_decode Bcond(.negative, .zero, .cond, .Rd, .branch(Bcond_branch));
//	 or #5 branching(branch, Bcond_branch, temp_branch);
	 
	 always_comb begin
		casez(instruction[31:21])
			11'b1001000100z: begin	// ADDI
				Reg2Loc = 1'bz;
				ALUsrc = 1'b1;
            MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
				DTsignal = 1'b0;
				UnCondBr = 1'bz;
				BLsignal = 1'b0;
            BRsignal = 1'b0;
				update = 1'b0;
				cond = 1'b0;
				cbz = 1'b0;
				branch = 1'b0;
            ALUop = 3'b010;
				xfer_size = 4'b1000;
				Rn = instruction[9:5];
            Rd = instruction[4:0];
            Rm = 5'bzzzzz;
            ALU_imm = instruction[21:10];
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
				shamt = 6'bzzzzzz;
			end
			11'b10101011000: begin	// ADDS
				Reg2Loc = 1'b1;
            ALUsrc = 1'b0;
            MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
				DTsignal = 1'bz;
				UnCondBr = 1'bz;
				BLsignal = 1'b0;
            BRsignal = 1'b0;
            update = 1'b1;
				cond = 1'b0;
				cbz = 1'b0;
				branch = 1'b0;
            ALUop = 3'b010;
				xfer_size = 4'b1000;
				Rn = instruction[9:5];
            Rd = instruction[4:0];
				Rm = instruction[20:16];
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
            shamt = instruction[15:10];
			end
			11'b000101zzzzz: begin	// B
				Reg2Loc = 1'bz;
            ALUsrc = 1'bz;
            MemtoReg = 1'bz;
				RegWrite = 1'b0;
            MemWrite = 1'b0;
				DTsignal = 1'bz;
            UnCondBr = 1'b1;
				BLsignal = 1'b0;
				BRsignal = 1'b0;
				update = 1'b0;
				cond = 1'b0;
				cbz = 1'b0;
				branch = 1'b1;
				ALUop = 3'bzzz;
				xfer_size = 4'b1000;
				Rn = 5'bzzzzz;
            Rd = 5'bzzzzz;
				Rm = 5'bzzzzz;
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = instruction[25:0];
            shamt = 6'bzzzzzz;
			end
			11'b01010100zzz: begin	// B.cond
            Reg2Loc = 1'b0;
            ALUsrc = 1'b0;
				MemtoReg = 1'bz;
				RegWrite = 1'b0;
            MemWrite = 1'b0;
				DTsignal = 1'bz;
            UnCondBr = 1'b0;
            BLsignal = 1'b0;
            BRsignal = 1'b0;
				update = 1'b0;
				cond = 1'b1;
				cbz = 1'b0;
				branch = 1'b0;
				ALUop = 3'b011;
				xfer_size = 4'b1000;
				Rn = 5'bzzzzz;
            Rd = instruction[4:0];
				Rm = 5'bzzzzz;
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = instruction[23:5];
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
            shamt = 6'bzzzzzz;
			end
			11'b100101zzzzz: begin	// BL
				Reg2Loc = 1'bz;
				ALUsrc = 1'b0;
				MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
				DTsignal = 1'bz;
            UnCondBr = 1'b1;
				BLsignal = 1'b1;
            BRsignal = 1'b0;
				update = 1'b0;
				cond = 1'b0;
				cbz = 1'b0;
				branch = 1'b1;
            ALUop = 3'bzzz;
				xfer_size = 4'b1000;
				Rn = 5'bzzzzz;
            Rd = 5'd30;
				Rm = 5'bzzzzz;
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = instruction[25:0];
            shamt = 6'bzzzzzz;
			end
			11'b11010110000: begin	// BR
				Reg2Loc = 1'bz;
				ALUsrc = 1'bz;
				MemtoReg = 1'bz;
				MemWrite = 1'b0;
            RegWrite = 1'b0;
				DTsignal = 1'bz;
				UnCondBr = 1'bz;
            BLsignal = 1'b0;
            BRsignal = 1'b1;
            update = 1'b0;
				branch = 1'b1;
				cond = 1'b0;
				cbz = 1'b0;
				temp_branch = 1'b1;
				ALUop = 3'bzzz;
				xfer_size = 4'b1000;
				Rn = instruction[4:0];
            Rd = 5'bzzzzz;
				Rm = 5'bzzzzz;
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
            shamt = 6'bzzzzzz;
			end
			11'b10110100zzz: begin	// CBZ
            Reg2Loc = 1'b1;
            ALUsrc = 1'b0;
				MemtoReg = 1'bz;
            RegWrite = 1'b0;
            MemWrite = 1'b0;
				DTsignal = 1'bz;
            UnCondBr = 1'b0;
				BLsignal = 1'b0;
            BRsignal = 1'b0;
            update = 1'b1;
				cond = 1'b0;
            cbz = 1'b1;
				branch = 1'b0;
            ALUop = 3'b000;
				xfer_size = 4'b1000;
				Rn = 5'bzzzzz;
            Rd = 5'bzzzzz;
				Rm = instruction[4:0];
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = instruction[23:5];
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
            shamt = 6'bzzzzzz;
        end
			11'b11111000010: begin	// LDUR
				Reg2Loc = 1'bz;
				ALUsrc = 1'b1;
            MemtoReg = 1'b1;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
				DTsignal = 1'b1;
				UnCondBr = 1'bz;
				BLsignal = 1'b0;
            BRsignal = 1'b0;
            update = 1'b0;
				cond = 1'b0;
				cbz = 1'b0;
				branch = 1'b0;
            ALUop = 3'b010;
				xfer_size = 4'b1000;
				Rn = instruction[9:5];
            Rd = instruction[4:0];
				Rm = 5'bzzzzz;
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
				DT_addr = instruction[20:12];
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
            shamt = 6'bzzzzzz;
			end
        11'b11111000000: begin	// STUR
            Reg2Loc = 1'b0;
            ALUsrc = 1'b1;
				MemtoReg = 1'bz;
            RegWrite = 1'b0;
            MemWrite = 1'b1;
				DTsignal = 1'b1;
				UnCondBr = 1'bz;
				BLsignal = 1'b0;
            BRsignal = 1'b0;
            update = 1'b0;
				cond = 1'b0;
				cbz = 1'b0;
				branch = 1'b0;
            ALUop = 3'b010;
				xfer_size = 4'b1000;
            Rn = instruction[9:5];
				Rd = instruction[4:0];
				Rm = 5'bzzzzz;
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
            DT_addr = instruction[20:12];
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
            shamt = 6'bzzzzzz;
        end
        11'b11101011000: begin	// SUBS
            Reg2Loc = 1'b1;
            ALUsrc = 1'b0;
            MemtoReg = 1'b0;
            RegWrite = 1'b1;
            MemWrite = 1'b0;
				DTsignal = 1'bz;
				UnCondBr = 1'bz;
				BLsignal = 1'b0;
            BRsignal = 1'b0;
            update = 1'b1;
				cond = 1'b0;
				cbz = 1'b0;
				branch = 1'b0;
            ALUop = 3'b011;
				xfer_size = 4'b1000;
            Rn = instruction[9:5];
            Rd = instruction[4:0];
				Rm = instruction[20:16];
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
            shamt = instruction[15:10];
        end
		  default: begin 				// No instruction
				Reg2Loc = 1'b0;
				ALUsrc = 1'bz;
				MemtoReg = 1'bz;
				RegWrite = 1'bz;
				MemWrite = 1'bz;
				DTsignal = 1'bz;
				UnCondBr = 1'bz;
				BLsignal = 1'b0;
				BRsignal = 1'b0;
				update = 1'bz;
				cond = 1'bz;
				cbz = 1'b0;
				branch = 1'bz;
				ALUop = 3'bzzz;
				xfer_size = 4'bzzzz;
            Rn = 5'bzzzzz;
            Rd = 5'bzzzzz;
				Rm = 5'bzzzzz;
				ALU_imm = 12'bzzzzzzzzzzzz;
				COND_BR_addr = 19'bzzzzzzzzzzzzzzzzzzz;
				DT_addr = 9'bzzzzzzzzz;
				BR_addr = 26'bzzzzzzzzzzzzzzzzzzzzzzzzzz;
            shamt = 6'bzzzzzz;
			end
		endcase
	end
endmodule

`timescale 10ps / 1ps
module instruction_decoder_testbench();
	logic clk, cond, negative, zero, update, cbz, branch;
   logic [31:0] instruction;
   logic Reg2Loc, ALUsrc, MemtoReg, RegWrite, MemWrite, DTsignal, UnCondBr, BLsignal, BRsignal;
	logic [2:0] ALUop;
	logic [3:0] xfer_size;
   logic [4:0] Rn, Rd, Rm;
   logic [11:0] ALU_imm;
   logic [18:0] COND_BR_addr;
   logic [8:0] DT_addr;
   logic [25:0] BR_addr;
   logic [5:0] shamt;
	
	instruction_decoder dut(.*);
	
	// simulated clock
    parameter period = 100;
    initial begin
        clk <= 0;
        forever begin
            #(period/2)
            clk <= ~clk;
        end
    end
	
	initial begin
		// ADDI          //01234567890123456789012345678901
		instruction <= 32'b10010001000000011111100101101111; repeat(50) @(posedge clk);
		// ADDS
		instruction <= 32'b10101011000100100000000001100111; repeat(50) @(posedge clk);
		// B
		instruction <= 32'b00010100000000000000000000000001; repeat(50) @(posedge clk);
		// B.cond
		instruction <= 32'b01010100000000000000010000000011; repeat(50) @(posedge clk);
		// BL
		instruction <= 32'b00010100000000000000000000001111; repeat(50) @(posedge clk);
		// BR
		instruction <= 32'b11010110000000011101100101100111; repeat(50) @(posedge clk);
		// CBZ
		instruction <= 32'b10110100000000000000011100101100; repeat(50) @(posedge clk);
		// LDUR
		instruction <= 32'b11111000010000000001001111100000; repeat(50) @(posedge clk);
		// STUR
		instruction <= 32'b11111000000010010011001010101010; repeat(50) @(posedge clk);
		// SUBS
		instruction <= 32'b11101011000111100000001001100010; repeat(50) @(posedge clk);
		$stop;
	end
endmodule
