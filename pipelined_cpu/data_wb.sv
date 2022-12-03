/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for instruction fetch in a CPU.
 *
 * Inputs:
 * MemtoReg     - 1 bit, MemtoReg control signal.
 * dm_read_data - 64 bits, Data memory read data.
 * dm_address   - 64 bits, Data memory address. 
 *
 * Outputs:
 * WBsignal     - 64 bits, WBsignal control signal
 *
 */

`timescale 10ps / 1ps
module data_wb (
    input  logic MemtoReg_neg, MemtoReg_pos,
    input  logic [63:0] dm_read_data_neg, dm_address_neg, dm_read_data_pos, dm_address_pos,
    output logic [63:0] WBsignal_neg, WBsignal_pos
    );
    mux64_2x1 mux64_0(.sel(MemtoReg_neg), .A(dm_read_data_neg), .B(dm_address_neg), .out(WBsignal_neg));
	 mux64_2x1 mux64_1(.sel(MemtoReg_pos), .A(dm_read_data_pos), .B(dm_address_pos), .out(WBsignal_pos));
endmodule
