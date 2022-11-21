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

 `timescale 10ps/1ps
module single_cycle_cpu(input logic clk, reset);
    // Control signals
    logic BRsignal, Reg2Loc, ALUsrc, MemtoReg, RegWrite, MemWrite, BrTaken, BLsignal, UnCondBr;
    logic negative, zero, overflow, carry_out, branch, cbz, update, update_flags, cond, MemtoReg_out;
    logic [2:0] ALUop;
	 logic [3:0] xfer_size;
    // Data signals
    logic [5:0] shamt;
    logic [11:0] ALU_imm;
    logic [63:0] Da, Db, BR_to_shift, BLT, WBsignal, ALU_imm_extend;
    logic [63:0] alu_result, dm_address, dm_read_data, dm_write_data;
    // Program counter
    logic [63:0] pc, pc_id, new_pc2_ex, new_pc2;
    // Addresses
    logic [8:0] DT_addr;
    logic [18:0] COND_BR_addr;
    logic [25:0] BR_addr;
    // Registers
    logic [4:0] Rn, Rd, Rm, Rt;
	 
	 logic [1:0] counter;
	 logic slow_clk;
	 always_ff @(posedge clk) begin
		if (reset) begin
			counter <= 0;
			slow_clk <= 1'd0;
		end
		else begin
			counter <= counter + 1;
			if (counter == 0) 
				slow_clk <= ~slow_clk;
		end
	end
	 
    // Datapath stages
    data_if if_module(.clk(clk), .*);
    data_id id_module(.clk(clk), .pc_if(pc), .pc_id(pc_id), .*);
    data_ex ex_module(.clk(clk), .ReadData1(Da), .ReadData2(Db), .PC(pc_id), .ALU_imm_extend, .BR_to_shift, .ReadData2_out(dm_write_data), .new_PC2(new_pc2_ex), .*);
    data_mem mem_module(.clk(clk), .MemtoReg_in(MemtoReg), .MemtoReg_out(MemtoReg_out), .write_data(dm_write_data), .*);
    data_wb wb_module(.*);
endmodule


`timescale 10ps/1ps
module single_cycle_cpu_testbench();
    logic clk, reset, reset_slowclk;
    single_cycle_cpu dut (.*);

    parameter ClockDelay = 2000;
    initial begin // Set up the clock
        clk <= 0;
        forever #(ClockDelay/2) clk <= ~clk;
    end

    initial begin
		  reset = 1; #1500;
		  reset = 0;
		  #60000;
		  $stop;
    end
endmodule