/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the alu_signals module, a module to decode ALU OP signals.
 *
 * Inputs:
 * cntrl        - 3 bits, Control signal.
 *
 * Outputs:
 * Cout_sel     - 1 bit, Selector signal for Cout.
 * sum_sel1     - 1 bit, Selector signal for sum_sel1.
 * sum_sel0     - 1 bit, Selector signal for sum_sel.
 * sub          - 1 bit, Subtract signal.
 */

module alu_signals(
    input  logic [2:0] cntrl;
    output logic Cout_sel, sum_sel1, sum_sel0, sub
    );
    // Calculate Cout_sel signal
    not #5 n0(not_cntrl_2, cntrl[2]);
    and #5 a0(Cout_sel, not_cntrl_2, cntrl[1]);

    // Calculate sum_sel signal
    or  #5 o0(sum_sel1, not_cntrl_2, cntrl[1]);
    or  #5 o1(sum_sel0, cntrl[1], cntrl[0]);

    // Calculate sub signal
    and #5 a1(sub, Cout_sel, cntrl[0]);
endmodule