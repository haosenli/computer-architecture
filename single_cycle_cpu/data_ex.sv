/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for execute in a CPU.
 *
 * Inputs:
 * ReadData1   	    - 64 bits, ReadData1 result from register signal.
 * ReadData2   	    - 64 bits, ReadData2 result from register signal.
 * PC			   	- 64 bits, Data memory write data.
 * ALU_imm_extend   - 64 bits, ALU_imm but 64 bit signal.
 * BR_to_shift		- 64 bits, BR_addr but 64 bit signal.
 * ALUop			- 3 bits, Operation for ALU.
 * ALUsrc			- 1 bit, ALUsrc control signal.
 * UnCondBr			- 1 bit, UnCondBr control signal.
 * update			- 1 bit, Update output signals
 *
 * Outputs:
 * alu_result 		- 64 bits, ALU result.
 * ReadData2_out    - 64 bits, ReadData2 signal. 
 * new_PC2      	- 64 bits, new PC value.
 * negative     	- 1 bit, True if output is negative, false otherwise.
 * zero         	- 1 bit, True if output is zero, false otherwise.
 * overflow     	- 1 bit, True if output overflowed, false otherwise.
 * carry_out    	- 1 bit, Carry out signal.
 *
 */
module data_ex(
	input  logic [63:0] ReadData1, ReadData2, PC, ALU_imm_extend, BR_to_shift,
	input  logic [2:0] ALUop,
	input  logic ALUsrc, UnCondBr, update,
	output logic [63:0] alu_result, ReadData2_out, new_PC2,
	output logic negative, zero, overflow, carry_out
	);
	
	// logic
	logic [63:0] add2, BR_PC;
	logic temp_zero, temp_neg, temp_overflow, temp_carry_out;
	 
	// mux to find what gets used for ALU
	mux64_2x1 add_2 (.sel(ALUsrc), .A(ALU_imm_extend), .B(ReadData2), .out(add2));
	
	// ALU to compute value
	alu compute (.A(ReadData1), .B(add2), .cntrl(ALUop), .result(alu_result), .negative(temp_neg), 
				.zero(temp_zero), .overflow(temp_overflow), .carry_out(temp_carry_out));
	
	// shifts BR_addr by 2
	shifter shift_2 (.value(BR_to_shift), .direction(1'b0), .distance(6'd2), .result(BR_PC));
	
	// adds new BR_addr to PC
	adder64 addPC (.A(BR_PC), .B(PC), .result(new_PC2));
	
	// Updates value if flag is set
	mux_2x1 z(.in({temp_zero, zero}), .sel(update), .out(zero));
	mux_2x1 n(.in({temp_neg, negative}), .sel(update), .out(negative));
	mux_2x1 o(.in({temp_overflow, overflow}), .sel(update), .out(overflow));
	mux_2x1 c(.in({temp_carry_out, carry_out}), .sel(update), .out(carry_out));
	
	// assign ReadData2 to output
	assign ReadData2_out = ReadData2;
	
endmodule
