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
    input  logic MemtoReg,
    input  logic [63:0] dm_read_data, dm_address,
    output logic [63:0] WBsignal
    );
    mux64_2x1 mux64_0(.sel(MemtoReg), .A(dm_read_data), .B(dm_address), .out(WBsignal));
endmodule
