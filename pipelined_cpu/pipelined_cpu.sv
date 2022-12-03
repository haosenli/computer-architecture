/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the single cycle cpu module.
 *
 * Inputs:
 * clk  	- 1 bit, clock signal.
 * reset	- 1 bit, reset signal.
 *
 * Outputs:
 */

 `timescale 10ps/1ps
module pipelined_cpu(input logic clk, reset);
    /*
    // Control signals
    logic BRsignal, Reg2Loc, ALUsrc, MemtoReg, RegWrite;
    logic MemWrite, BrTaken, BLsignal, UnCondBr, DTsignal;
    logic negative, zero, overflow, carry_out, branch, cbz, cbz_id;
    logic update, update_flags, cond, MemtoReg_out;
    logic [2:0] ALUop;
    logic [3:0] xfer_size;
    // Data signals
    logic [5:0] shamt;
    logic [11:0] ALU_imm;
    logic [63:0] Da, Db, BR_to_shift, BLT, WBsignal, ALU_imm_extend, DT_addr_extend, ALU_or_DT;
    logic [63:0] alu_result, dm_address, dm_read_data, dm_write_data, new_pc1;
    // Program counter
    logic [63:0] pc, pc_id, new_pc2_ex, new_pc2;
    // Addresses
    logic [8:0] DT_addr;
    logic [18:0] COND_BR_addr;
    logic [25:0] BR_addr;
    // Registers
    logic [4:0] Rn, Rd, Rm;
    */
	 
	 logic [63:0] new_pc2, pc;
	 logic [4:0] Rd_for;
	 logic [1:0] forwardA, forwardB, forward_cbz;
	 logic BRsignal;
	 
    // IF REGISTERS
    logic BRsignal_if, Reg2Loc_if, ALUsrc_if, MemtoReg_if, RegWrite_if;
    logic MemWrite_if, BrTaken_if, BLsignal_if, UnCondBr_if, DTsignal_if;
    logic negative_if, zero_if, overflow_if, carry_out_if, branch_if, cbz_if, cbz_id_if;
    logic update_if, update_flags_if, cond_if, MemtoReg_out_if;
    logic [2:0] ALUop_if;
    logic [3:0] xfer_size_if;
    // Data signals
    logic [5:0] shamt_if;
    logic [11:0] ALU_imm_if;
    logic [63:0] Da_if, Db_if, BR_to_shift_if, BLT_if, WBsignal_if, ALU_imm_extend_if, DT_addr_extend_if, ALU_or_DT_if;
    logic [63:0] alu_result_if, dm_address_if, dm_read_data_if, dm_write_data_if, new_pc1_if;
    // Program counter
    logic [63:0] pc_if, pc_id_if, new_pc2_ex_if, new_pc2_if;
    // Addresses
    logic [8:0] DT_addr_if;
    logic [18:0] COND_BR_addr_if;
    logic [25:0] BR_addr_if;
    // Registers
    logic [4:0] Rn_if, Rd_if, Rm_if;

    // ID REGISTERS
    logic BRsignal_id, Reg2Loc_id, ALUsrc_id, MemtoReg_id, RegWrite_id;
    logic MemWrite_id, BrTaken_id, BLsignal_id, UnCondBr_id, DTsignal_id;
    logic negative_id, zero_id, overflow_id, carry_out_id, branch_id, cbz_id, cbz_id_id;
    logic update_id, update_flags_id, cond_id, MemtoReg_out_id;
    logic [2:0] ALUop_id;
    logic [3:0] xfer_size_id;
    // Data signals
    logic [5:0] shamt_id;
    logic [11:0] ALU_imm_id;
    logic [63:0] Da_id, Db_id, BR_to_shift_id, BLT_id, WBsignal_id, ALU_imm_extend_id, DT_addr_extend_id, ALU_or_DT_id;
    logic [63:0] alu_result_id, dm_address_id, dm_read_data_id, dm_write_data_id, new_pc1_id;
    // Program counter
    logic [63:0] pc_id, pc_id_id, new_pc2_ex_id, new_pc2_id;
    // Addresses
    logic [8:0] DT_addr_id;
    logic [18:0] COND_BR_addr_id;
    logic [25:0] BR_addr_id;
    // Registers
    logic [4:0] Rn_id, Rd_id, Rm_id, Ab_id;
    
    // EX REGISTERS
    logic BRsignal_ex, Reg2Loc_ex, ALUsrc_ex, MemtoReg_ex, RegWrite_ex;
    logic MemWrite_ex, BrTaken_ex, BLsignal_ex, UnCondBr_ex, DTsignal_ex;
    logic negative_ex, zero_ex, overflow_ex, carry_out_ex, branch_ex, cbz_ex, cbz_id_ex;
    logic update_ex, cond_ex, MemtoReg_out_ex;
    logic [2:0] ALUop_ex;
    logic [3:0] xfer_size_ex;
    // Data signals
    logic [5:0] shamt_ex;
    logic [11:0] ALU_imm_ex;
    logic [63:0] Da_ex, Db_ex, BR_to_shift_ex, BLT_ex, WBsignal_ex, ALU_imm_extend_ex, DT_addr_extend_ex, ALU_or_DT_ex;
    logic [63:0] alu_result_ex, dm_address_ex, dm_read_data_ex, dm_write_data_ex, new_pc1_ex;
    // Program counter
    logic [63:0] pc_ex, pc_id_ex, new_pc2_ex_ex, new_pc2_ex;
    // Addresses
    logic [8:0] DT_addr_ex;
    logic [18:0] COND_BR_addr_ex;
    logic [25:0] BR_addr_ex;
    // Registers
    logic [4:0] Rn_ex, Rd_ex, Rm_ex, Ab_ex;

    // MEM REGISTERS
    logic BRsignal_mem, Reg2Loc_mem, ALUsrc_mem, MemtoReg_mem, RegWrite_mem;
    logic MemWrite_mem, BrTaken_mem, BLsignal_mem, UnCondBr_mem, DTsignal_mem;
    logic negative_mem, zero_mem, overflow_mem, carry_out_mem, branch_mem, cbz_mem, cbz_id_mem;
    logic update_mem, update_flags_mem, cond_mem, MemtoReg_out_mem;
    logic [2:0] ALUop_mem;
    logic [3:0] xfer_size_mem;
    // Data signals
    logic [5:0] shamt_mem;
    logic [11:0] ALU_imm_mem;
    logic [63:0] Da_mem, Db_mem, BR_to_shift_mem, BLT_mem, WBsignal_mem, ALU_imm_extend_mem, DT_addr_extend_mem, ALU_or_DT_mem;
    logic [63:0] alu_result_mem, dm_address_mem, dm_read_data_mem, dm_write_data_mem, new_pc1_mem;
    // Program counter
    logic [63:0] pc_mem, pc_id_mem, new_pc2_ex_mem, new_pc2_mem;
    // Addresses
    logic [8:0] DT_addr_mem;
    logic [18:0] COND_BR_addr_mem;
    logic [25:0] BR_addr_mem;
    // Registers
    logic [4:0] Rn_mem, Rd_mem, Rm_mem;

    // WB REGISTERS
    logic BRsignal_wb, Reg2Loc_wb, ALUsrc_wb, MemtoReg_wb, RegWrite_wb1, RegWrite_wb2;
    logic MemWrite_wb, BrTaken, BLsignal_wb, UnCondBr_wb, DTsignal_wb, zero_wb;
    logic [2:0] ALUop_wb;
    logic [3:0] xfer_size_wb;
    // Data signals
    logic [5:0] shamt_wb;
    logic [11:0] ALU_imm_wb;
    logic [63:0] Da_wb, Db_wb, BR_to_shift_wb, BLT_wb, WBsignal, ALU_imm_extend_wb, DT_addr_extend_wb, ALU_or_DT_wb;
		 logic [63:0] alu_result_wb1, alu_result_wb2, dm_address_wb, dm_read_data_wb, dm_write_data_wb;
	 // Addresses
    logic [8:0] DT_addr_wb;
    logic [18:0] COND_BR_addr_wb;
    logic [25:0] BR_addr_wb;
    // Registers
    logic [4:0] Rn_wb, Rd_wb, Rm_wb;

    // INTER-STAGE REGISTERS
    reg_if_id reg0(.*);
    reg_id_ex reg1(.*);
    reg_ex_mem reg2(.*);
    reg_mem_wb reg3(.*);
	 
	 // Forwarding Unit
	 forwarding_unit forward(
			.RegWrite_mem(RegWrite_mem), .RegWrite_wb(RegWrite_wb1),
			.regA(Rn_ex), .regB(Ab_ex), .Rd_mem(Rd_mem), .Rd_wb(Rd_for),
			.forwardA(forwardA), .forwardB(forwardB)
	 );
	 forward_cbz fowardcbz(
			.RegWrite_ex(RegWrite_ex), .RegWrite_mem(RegWrite_mem), .RegWrite_wb(RegWrite_wb1),
			.reg_cbz(Rm_id), .Rd_ex(Rd_ex), .Rd_mem(Rd_mem), .Rd_wb(Rd_wb),
			.forward_cbz(forward_cbz)
	 );

    // Stage: Instruction Fetch
    data_if if_module(
        // inputs
        .clk(clk), .negative(negative_if), .zero(zero_if), .BrTaken(BrTaken), .reset(reset), .BRsignal(BRsignal),
        .Da(Da_ex), .new_pc2(new_pc2),
        // outputs
        .BLT(BLT_if), .pc(pc),
        .COND_BR_addr(COND_BR_addr_if),
        .BR_addr(BR_addr_if),
        .Reg2Loc(Reg2Loc_if), .ALUsrc(ALUsrc_if), .MemtoReg(MemtoReg_if), .RegWrite(RegWrite_if), .MemWrite(MemWrite_if), .BLsignal(BLsignal_if), 
        .cbz(cbz_if), .branch(branch_if), .cond(cond_if), .update(update_if), .UnCondBr(UnCondBr_if), .DTsignal(DTsignal_if), .BRsignal_if(BRsignal_if),
        .ALUop(ALUop_if),
        .xfer_size(xfer_size_if),
        .Rn(Rn_if), .Rd(Rd_if), .Rm(Rm_if),
        .ALU_imm(ALU_imm_if),
        .DT_addr(DT_addr_if),
        .shamt(shamt_if)
    );

    // Stage: Instruction Decode
    data_id id_module(
        // inputs
        .clk(clk), .Reg2Loc(Reg2Loc_id), .ALUsrc(ALUsrc_id), .MemtoReg(MemtoReg_id), .cbz(cbz_id), .branch(branch_id), .cond(cond_id), .zero_ex(zero_ex), .negative_ex(negative_ex),
        .RegWrite(RegWrite_wb2), .MemWrite(MemWrite_id), .BLsignal(BLsignal_wb), .UnCondBr(UnCondBr_id), .DTsignal(DTsignal_id),
        .WBsignal(WBsignal), .BLT(BLT_wb), .PC(pc_id), .alu_result_ex(alu_result_ex), .alu_result_mem(alu_result_mem), .alu_result_wb(alu_result_wb1),
        .COND_BR_addr(COND_BR_addr_id),
        .BR_addr(BR_addr_id),
        .ALUop(ALUop_id),
        .Rn(Rn_id), .Rd_id(Rd_id), .Rd_wb(Rd_wb), .Rm(Rm_id),
        .ALU_imm(ALU_imm_id),
        .DT_addr(DT_addr_id),
        .shamt(shamt_id),
		  .forward_cbz(forward_cbz),
        // outputs
        .Da(Da_id), .Db(Db_id), /*.BR_to_shift(BR_to_shift_id),*/ .ALU_or_DT(ALU_or_DT_id), .Ab(Ab_id), .new_PC2(new_pc2_id),
		  .BrTaken(BrTaken_id)
    );

    // Stage: Execute
    data_ex ex_module(
       // inputs
       .clk(clk), .reset(reset),
	    .ReadData1(Da_ex), .ReadData2(Db_ex), .PC(pc_ex), .ALU_or_DT(ALU_or_DT_ex), /*.BR_to_shift(BR_to_shift_ex),*/ .alu_result_mem(alu_result_mem), .alu_result_wb(alu_result_wb1),
	    .ALUop(ALUop_ex),
       .ALUsrc(ALUsrc_ex), .update(update_ex), .cbz_id(cbz_ex), .BLsignal(BLsignal_ex),
		 .forwardB(forwardB), .forwardA(forwardA), .BLT(BLT_ex),
       // outputs
       .alu_result(alu_result_ex), //.new_PC2(new_pc2_ex),
       .negative(negative_ex), .zero(zero_ex), .overflow(overflow_ex), .carry_out(carry_out_ex)
    );

    // Stage: Memory
    data_mem mem_module(
        // inputs
        .zero(zero_mem), .branch(branch_mem), .cbz(cbz_mem), .clk(clk), .MemWrite(MemWrite_mem), .MemtoReg(MemtoReg_mem),
        .xfer_size(xfer_size_mem),
        .alu_result(alu_result_mem), .write_data(Db_mem),
        // outputs
        //.BrTaken(BrTaken),
        .dm_read_data(dm_read_data_mem)
    );

    data_wb wb_module(
        // inputs
        .MemtoReg(MemtoReg_wb),
        .dm_read_data(dm_read_data_wb), .dm_address(alu_result_wb2),
        // outputs
        .WBsignal(WBsignal)
    );

    // data_id id_module(.clk(clk), .pc_if(pc), .pc_id(pc_id), .*);
    // data_ex ex_module(.clk(clk), .ReadData1(Da), .ReadData2(Db), .PC(pc_id), .ALU_or_DT, .BR_to_shift, .ReadData2_out(dm_write_data), .new_PC2(new_pc2_ex), .*);
    // data_mem mem_module(.clk(clk), .MemtoReg_in(MemtoReg), .MemtoReg_out(MemtoReg_out), .write_data(dm_write_data), .*);
    // data_wb wb_module(.*);
endmodule


`timescale 10ps/1ps
module pipelined_cpu_testbench();
    logic clk, reset;
    pipelined_cpu dut (.*);

    parameter ClockDelay = 2000;
    initial begin // Set up the clock
        clk <= 0;
        forever #(ClockDelay/2) clk <= ~clk;
    end

    initial begin
		  reset = 1; #1500;
		  reset = 0;
		  // Rest of the tests
		  #120000;
		  
		  // Test11
		  //#1500000;
		  
		  // Test12
		  //#500000;
		  $stop;
    end
endmodule