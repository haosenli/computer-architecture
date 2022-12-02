/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for execute in a CPU.
 *
 * Inputs:
 * ReadData1   	- 64 bits, ReadData1 result from register signal.
 * ReadData2   	- 64 bits, ReadData2 result from register signal.
 * PC			   	- 64 bits, Data memory write data.
 * ALU_or_DT 		- 64 bits, ALU_or_DT bit 64 bit signal.
 * BR_to_shift		- 64 bits, BR_addr bit 64 bit signal.
 * ALUop				- 3 bits, Operation for ALU.
 * ALUsrc			- 1 bit, ALUsrc control signal.
 * update			- 1 bit, Update control signal.
 * cbz_id			- 1 bit, cbz_id control signal.
 *
 * Outputs:
 * alu_result 		- 64 bits, alu result.
 * ReadData2_out  - 64 bits, ReadData2 signal. 
 * new_PC2      	- 64 bits, new PC value.
 * negative     	- 1 bit, True if output is negative, false otherwise.
 * zero         	- 1 bit, True if output is zero, false otherwise.
 * overflow     	- 1 bit, True if output overflowed, false otherwise.
 * carry_out    	- 1 bit, Carry out signal.
 *
 */
module data_ex(
	input  logic clk, reset,
	input  logic [63:0] ReadData1, ReadData2, PC, ALU_or_DT, //BR_to_shift,
	input  logic [63:0] alu_result_mem, alu_result_wb,
	input  logic [2:0] ALUop,
	input  logic [1:0] forwardB, forwardA,
	input  logic ALUsrc, update, cbz_id,
	output logic [63:0] alu_result, //new_PC2,
	output logic negative, zero, overflow, carry_out
	);
	
	// logic
	logic [63:0] add2, BR_PC, Da, Db;
	logic temp_zero, temp_neg, temp_overflow, temp_carry_out;
	logic zero_dff, neg_dff, carry_out_dff, overflow_dff;
	logic zero_q, neg_q, carry_out_q, overflow_q;
	 
	// mux to find what gets used for ALU
	mux64_2x1 add_2 (.sel(ALUsrc), .A(ALU_or_DT), .B(ReadData2), .out(add2));
	
	// muxes for forwarding
	mux64_4x1 forwardA_mux64 (.sel(forwardA), .A(ReadData1), .B(alu_result_mem), .C(alu_result_wb), .D(ReadData1), .out(Da));
	mux64_4x1 forwardB_mux64 (.sel(forwardB), .A(add2), .B(alu_result_mem), .C(alu_result_wb), .D(add2), .out(Db));

	// ALU to compute value
	alu compute (.A(Da), .B(Db), .cntrl(ALUop), .result(alu_result), .negative(temp_neg), 
				.zero(temp_zero), .overflow(temp_overflow), .carry_out(temp_carry_out));
	
	// shifts BR_addr by 2
	//shifter shift_2 (.value(BR_to_shift), .direction(1'b0), .distance(6'd2), .result(BR_PC));
	
	// adds new BR_addr to PC
	//adder64 addPC (.A(BR_PC), .B(PC), .result(new_PC2));
	
	// DFFs to set the flags
	nn_dff #(1) d_ff_0(.out(zero_q), .in(zero_dff), .*);
	nn_dff #(1) d_ff_1(.out(negative), .in(neg_dff), .*);
	nn_dff #(1) d_ff_2(.out(carry_out), .in(carry_out_dff), .*);
	nn_dff #(1) d_ff_3(.out(overflow), .in(overflow_dff), .*);
	
	// ignore prev DFFs if cbz
	mux_2x1 mux_2x1_0(.in({zero_dff, zero_q}), .sel(cbz_id), .out(zero));
	
	// Updates value if flag is set
	mux_2x1 z(.in({temp_zero, zero}), .sel(update), .out(zero_dff));
	mux_2x1 n(.in({temp_neg, negative}), .sel(update), .out(neg_dff));
	mux_2x1 o(.in({temp_overflow, overflow}), .sel(update), .out(overflow_dff));
	mux_2x1 c(.in({temp_carry_out, carry_out}), .sel(update), .out(carry_out_dff));

endmodule

`timescale 10ps/1ps
module data_ex_testbench();
	logic clk, reset;
	logic [63:0] ReadData1, ReadData2, PC, ALU_or_DT, BR_to_shift, alu_result_mem, alu_result_wb;
	logic [2:0] ALUop;
	logic [1:0] forwardB, forwardA;
	logic ALUsrc, update, cbz_id;
	logic [63:0] alu_result, ReadData2_out, new_PC2;
	logic negative, zero, overflow, carry_out;
	
	data_ex dut (.*);
	
	initial begin
	// TEST 1: See if update off changes flags and check PC value
	ReadData1 <= 64'b0000000000000000000000000000000000000000000000000000001010101010;
	ReadData2 <= 64'b0000000000000000000000000000000000000000000000000000000101010101;
	PC <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	ALU_or_DT <= 64'b0000000000000000000000000000000000000000000000000000000000000001;
	BR_to_shift <= 64'b0000000000000000000000000000000000000000000000000000000000000010;
	ALUop <= 3'b010;
	ALUsrc <= 1'b0;
	update <= 1'b0;	#1000;
	
	// TEST 2: See if update on changes flags and change ALU input to be ALU_imm
	ReadData1 <= 64'b0000000000000000000000000000000000000000000000000000001010101010;
	ReadData2 <= 64'b0000000000000000000000000000000000000000000000000000000101010101;
	PC <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	ALU_or_DT <= 64'b0000000000000000000000000000000000000000000000000000000000000001;
	BR_to_shift <= 64'b0000000000000000000000000000000000000000000000000000000010000000;
	ALUop <= 3'b010;
	ALUsrc <= 1'b1;
	update <= 1'b1;	#1000;
	
	// TEST 3: Update off and see if flags change
	ReadData1 <= 64'b1111111111111111111111111111111111111111111111111111101010101010;
	ReadData2 <= 64'b0000000000000000000000000000000000000000000000000000000000010101;
	PC <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
	ALU_or_DT <= 64'b0000000000000000000000000000000000000000000000000000000000000001;
	BR_to_shift <= 64'b0000000000000000000000000000000000000000000000000000000010000000;
	ALUop <= 3'b010;
	ALUsrc <= 1'b1;
	update <= 1'b0;	#1000;
	end
endmodule
