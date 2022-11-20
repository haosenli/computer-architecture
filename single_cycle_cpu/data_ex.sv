module data_ex(
	input  logic [63:0] ReadData1, ReadData2, PC, ALU_imm_extend, BR_to_shift,
	input  logic [2:0] ALUop,
	input  logic ALUsrc, UnCondBr, update,
	output logic [63:0] ALU_result, ReadData2_out, new_PC2,
	output logic negative, zero, overflow, carry_out
	);
	
	logic [63:0] add2, BR_PC;
	logic temp_zero, temp_neg, temp_overflow, temp_carry_out;
	 
	mux64_2x1 add_2 (.sel(ALUsrc), .A(ALU_imm_extend), .B(ReadData2), .out(add2));
	
	alu compute (.A(ReadData1), .B(add2), .cntrl(ALUop), .result(ALU_result), .negative(temp_neg), 
				.zero(temp_zero), .overflow(temp_overflow), .carry_out(temp_carry_out));
	
	shifter shift_2 (.value(BR_to_shift), .direction(1'b0), .distance(6'd2), .result(BR_PC));
	
	adder64 addPC (.A(BR_PC), .B(PC), .result(new_PC2));
	
	mux_2x1 z(.in({temp_zero, zero}), .sel(update), .out(zero));
	mux_2x1 n(.in({temp_neg, negative}), .sel(update), .out(negative));
	mux_2x1 o(.in({temp_overflow, overflow}), .sel(update), .out(overflow));
	mux_2x1 c(.in({temp_carry_out, carry_out}), .sel(update), .out(carry_out));
	
	assign ReadData2_out = ReadData2;
	
endmodule
