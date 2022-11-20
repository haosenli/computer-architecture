/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the logic for B.cond.
 *
 * Inputs:
 * negative     - 1 bit, True if ALU output is negative, false otherwise.
 * zero         - 1 bit, True if ALU output is zero, false otherwise.
 * cond			 - 1 bit, True if Opcode is B.cond, false otherwise.
 * Rd				 - 5 bits, The 5 bits to determine the condition operation.
 *
 * Outputs:
 * branch       - 1 bit, True if conditions are met and needs to branch.
 */

`timescale 10ps / 1ps
module B_cond_decode(
	input  logic negative, zero, cond,
	input  logic [4:0] Rd,
	output logic branch
	);
	
	// logic
	logic not_a, not_b, not_c, not_d, not_zero, not_neg, eq, ne, ge, lt, gt, le;
	logic eq_val, ne_val, ge_val, lt_val, gt_val, le_val;
	logic ge_logic, lt_logic, gt_logic, le_logic;
	logic branch_temp1, branch_temp2;
	
	// not signals
	not #5 nd(not_d, Rd[0]);
	not #5 nc(not_c, Rd[1]);
	not #5 nb(not_b, Rd[2]);
	not #5 na(not_a, Rd[3]);
	not #5 n0(not_zero, zero);
	not #5 nn(not_neg, negative);
	
	// condition values
	and #5 eqVal(eq_val, not_a, not_b, not_c, not_d);
	and #5 neVal(ne_val, not_a, not_b, not_c, Rd[0]);
	and #5 geVal(ge_val, Rd[3], not_b, Rd[1], not_d);
	and #5 ltVal(lt_val, Rd[3], not_b, Rd[1], Rd[0]);
	and #5 gtVal(gt_val, Rd[3], Rd[2], not_c, not_d);
	and #5 leVal(le_val, Rd[3], Rd[2], not_c, Rd[0]);
	
	// conditional logic with negative and zeros
	or #5 not_neg_or_zero(ge_logic, not_neg, zero);
	and #5 neg_and_not_zero(lt_logic, negative, not_zero);
	and #5 not_neg_and_not_zero(gt_logic, not_neg, not_zero);
	or #5 neg_or_zero(le_logic, negative, zero);
	
	// Conditional logic
	and #5 equal_to(eq, cond, eq_val, zero);
	and #5 not_equal(ne, cond, ne_val, not_zero);
	and #5 greater_equal(ge, cond, ge_val, ge_logic);
	and #5 less_than(lt, cond, lt_val, lt_logic);
	and #5 greater_than(gt, cond, gt_val, gt_logic);
	and #5 less_equal(le, cond, le_val, le_logic);
	
	// branch logic
	or #5 branch_log_temp1(branch_temp1, eq, ne, ge);
	or #5 branch_log_temp2(branch_temp2, lt, gt, le);
	or #5 branch_logic(branch, branch_temp1, branch_temp2);
	
endmodule

module B_cond_decode_testbench();
	logic negative, zero, cond;
	logic [4:0] Rd;
	logic branch;
	
	B_cond_decode dut(.*);
	
	initial begin
	cond = 1'b1;
	Rd = 5'b00000;	//EQ
	zero = 1'b0; negative = 1'b0; # 100;
	zero = 1'b0; negative = 1'b1; # 100;
	zero = 1'b1; negative = 1'b0; # 100;
	zero = 1'b1; negative = 1'b1; # 100;
	
	Rd = 5'b00001;	//NE
	zero = 1'b0; negative = 1'b0; # 100;
	zero = 1'b0; negative = 1'b1; # 100;
	zero = 1'b1; negative = 1'b0; # 100;
	zero = 1'b1; negative = 1'b1; # 100;
	
	Rd = 5'b01010;	//GE
	zero = 1'b0; negative = 1'b0; # 100;
	zero = 1'b0; negative = 1'b1; # 100;
	zero = 1'b1; negative = 1'b0; # 100;
	zero = 1'b1; negative = 1'b1; # 100;
	
	Rd = 5'b01011;	//LT
	zero = 1'b0; negative = 1'b0; # 100;
	zero = 1'b0; negative = 1'b1; # 100;
	zero = 1'b1; negative = 1'b0; # 100;
	zero = 1'b1; negative = 1'b1; # 100;
	
	Rd = 5'b01100;	//GT
	zero = 1'b0; negative = 1'b0; # 100;
	zero = 1'b0; negative = 1'b1; # 100;
	zero = 1'b1; negative = 1'b0; # 100;
	zero = 1'b1; negative = 1'b1; # 100;
	
	Rd = 5'b01101;	//LE
	zero = 1'b0; negative = 1'b0; # 100;
	zero = 1'b0; negative = 1'b1; # 100;
	zero = 1'b1; negative = 1'b0; # 100;
	zero = 1'b1; negative = 1'b1; # 100;
	end
	
endmodule