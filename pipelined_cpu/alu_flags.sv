/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the alu_signals module, a module to decode ALU OP signals.
 *
 * Inputs:
 * result       - 64 bits, ALU results.
 * cout_out     - 64 bits, Cout outputs from ALU.
 *
 * Outputs:
 * zero         - 1 bit, Zero flag.
 * negative     - 1 bit, Negative flag.
 * carry_out    - 1 bit, Carry_out signal.
 * overflow     - 1 bit, Overflow flag.
 */

module alu_flags(
    input  logic [63:0] result, cout_out,
    output logic zero, negative, carry_out, overflow
    );
	// Connect neg, c_out, flow output signals
	and #5 neg (negative, result[63], 1'b1);
	and #5 c_out (carry_out, cout_out[63], 1'b1);
	xor #5 flow (overflow, cout_out[63], cout_out[62]);

    // Calculate zero signal
	or #5 z0(temp_zero0[0], result[0], result[1], result[2], result[3]);
    or #5 z1(temp_zero0[1], result[4], result[5], result[6], result[7]);
    or #5 z2(temp_zero0[2], result[8], result[9], result[10], result[11]);
    or #5 z3(temp_zero0[3], result[12], result[13], result[14], result[15]);
    or #5 z4(temp_zero0[4], result[16], result[17], result[18], result[19]);
    or #5 z5(temp_zero0[5], result[20], result[21], result[22], result[23]);
    or #5 z6(temp_zero0[6], result[24], result[25], result[26], result[27]);
    or #5 z7(temp_zero0[7], result[28], result[29], result[30], result[31]);
    or #5 z8(temp_zero0[8], result[32], result[33], result[34], result[35]);
    or #5 z9(temp_zero0[9], result[36], result[37], result[38], result[39]);
    or #5 z10(temp_zero0[10], result[40], result[41], result[42], result[43]);
    or #5 z11(temp_zero0[11], result[44], result[45], result[46], result[47]);
    or #5 z12(temp_zero0[12], result[48], result[49], result[50], result[51]);
    or #5 z13(temp_zero0[13], result[52], result[53], result[54], result[55]);
    or #5 z14(temp_zero0[14], result[56], result[57], result[58], result[59]);
    or #5 z15(temp_zero0[15], result[60], result[61], result[62], result[63]);
	 
    or #5 z16(temp_zero1[0], temp_zero0[0], temp_zero0[1], temp_zero0[2], temp_zero0[3]);
    or #5 z17(temp_zero1[1], temp_zero0[4], temp_zero0[5], temp_zero0[6], temp_zero0[7]);
    or #5 z18(temp_zero1[2], temp_zero0[8], temp_zero0[9], temp_zero0[10], temp_zero0[11]);
    or #5 z19(temp_zero1[3], temp_zero0[12], temp_zero0[13], temp_zero0[14], temp_zero0[15]);
	 
    or #5 z20 (temp_zero, temp_zero1[0], temp_zero1[1], temp_zero1[2], temp_zero1[3]);
    not #5 z21 (zero, temp_zero);
endmodule