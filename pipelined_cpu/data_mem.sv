/*
 * EE469 Autumn 2022
 * Haosen Li, Peter Tran
 * 
 * This file contains the datapath for instruction fetch in a CPU.
 *
 * Inputs:
 * zero         - 1 bit, Zero flag from ALU.
 * branch       - 1 bit, Branch control signal.
 * cbz			- 1 bit, CBZ control signal.
 * clk          - 1 bit, Clock signal.
 * MemWrite     - 1 bit, MemWrite control signal.
 * MemtoReg_in  - 1 bit, MemtoReg control signal.
 * xfer_size 	- 4 bits, xfer size control signal.
 * alu_result   - 64 bits, ALU result signal.
 * write_data   - 64 bits, Data memory write data.
 * new_pc2_ex   - 64 bits, PC signal calculated from EX stage.
 *
 * Outputs:
 * BrTaken      - 1 bit, BrTaken control signal.
 * MemtoReg_out - 1 bit, MemtoReg control signal.
 * dm_read_data - 64 bits, Data memory read data.
 * dm_address   - 64 bits, Data memory address. 
 * new_pc2      - 64 bits, New program counter signal.
 *
 */

`timescale 10ps/1ps
module data_mem(
	input  logic zero, branch, cbz, clk, MemWrite, MemtoReg, forward_stur,
	input  logic [3:0] xfer_size,
	input  logic [63:0] alu_result, Db_mem, alu_result_wb,
    // output logic BrTaken,
	output logic [63:0] dm_read_data
	);
	
    //	logic temp_BrTaken;
    //	 
    //    // BrTaken signal
    //    and #5 a0(temp_BrTaken, zero, cbz);
    //	or #5 or0(BrTaken, temp_BrTaken, branch);
	 logic [63:0] write_data;
	 
	 mux64_2x1 forwardSTUR (.sel(forward_stur), .A(alu_result_wb), .B(Db_mem), .out(write_data));
	 
    // Data memory module
	datamem datamem_module(
        .address(alu_result), .write_enable(MemWrite), .read_enable(MemtoReg), .clk(clk), 
        .write_data(write_data), .xfer_size(xfer_size), .read_data(dm_read_data));
endmodule

module data_mem_testbench();
    logic zero, branch, cbz, clk, MemWrite, MemtoReg, forward_stur;
	logic [63:0] alu_result, write_data, new_pc2_ex, Db_mem, alu_result_wb;
	logic [3:0] xfer_size;
    logic BrTaken;
	logic [63:0] dm_read_data;

    data_mem dut (.*);

    parameter ClockDelay = 125;
    initial begin // Set up the clock
        clk <= 0;
        forever #(ClockDelay/2) clk <= ~clk;
    end

    initial begin
        new_pc2_ex <= 64'd64; alu_result <= 64'd128; write_data <= 64'd69;
        MemtoReg <= 1'b1; MemWrite <= 1'b1; zero <= 1'b0; branch <= 1'b0; cbz <= 1'b0;
        repeat(10) @(posedge clk);
        $stop;
    end

endmodule
