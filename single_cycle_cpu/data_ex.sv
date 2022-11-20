module data_ex(
	input  logic [63:0] ReadData1, ReadData2, PC, ALU_imm_extend, BR_to_shift,
	input  logic [2:0] ALUop,
	input  logic ALUsrc, UnCondBr,
	output logic [63:0] ALU_result, ReadData2_out, new_PC2,
	output logic branch
	);
	
	logic [63:0] add2, BR_PC;
	logic negative, zero, overflow, carry_out;
	 
	mux64_2x1 add_2 (.sel(ALUsrc), .A(ALU_imm_extend), .B(ReadData2), .out(add2));
	
	alu compute (.A(ReadData1), .B(add2), .cntrl(ALUop), .result(ALU_result), .negative, 
				.zero, .overflow, .carry_out);
	
	shifter shift_2 (.value(BR_to_shift), .direction(1'b0), .distance(6'd2), .result(BR_PC));
	
	adder64 addPC (.A(BR_PC), .B(PC), .result(new_PC2));
	
	assign ReadData2_out = ReadData2;
	
endmodule
