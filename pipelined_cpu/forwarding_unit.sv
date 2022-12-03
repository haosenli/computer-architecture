`timescale 10ps/1ps
module forwarding_unit(
			input  logic RegWrite_mem, RegWrite_wb, MemWrite_ex,
			input  logic [4:0] regA, regB, Rd_mem, Rd_wb,
			output logic [1:0] forwardA, forwardB	// 00 - no forward, 01 - forward from EX/MEM, 10- forward from MEM/WB, 11 - Dont care
	);
	
	always_comb begin
		// check if there is a register that is equal to regA being changed in the EX stage.
		if (RegWrite_mem && (Rd_mem == regA) && (Rd_mem != 5'd31)) begin
			forwardA = 2'b01;
		end
		// check if there is a register that is equal to regA being changed in the MEM stage.
		else if (RegWrite_wb && (Rd_wb == regA) && (Rd_wb != 5'd31)) begin
			forwardA = 2'b10;
		end
		// dont forward
		else begin
			forwardA = 2'b00;
		end
		
		// check if there is a register that is equal to regB being changed in the EX stage.
		if (RegWrite_mem && (Rd_mem == regB) && (Rd_mem != 5'd31) && ~MemWrite_ex) begin
			forwardB = 2'b01;
		end
		// check if there is a register that is equal to regB being changed in the MEM stage.
		else if (RegWrite_wb && (Rd_wb == regB) && (Rd_wb != 5'd31)) begin
			forwardB = 2'b10;
		end
		// dont forward
		else begin
			forwardB = 2'b00;
		end
		
	end
	
endmodule

module forwarding_unit_testbench();
	logic RegWrite_mem, RegWrite_wb, MemWrite_ex, MemWrite_wb;
	logic [4:0] regA, regB, Rd_mem, Rd_wb;
	logic [1:0] forwardA, forwardB;
	
	forwarding_unit dut(.*);
	
	initial begin
	/*TEST 1: Initialize RegWrite_mem and RegWrite_wb to be false*/
	RegWrite_mem = 1'b0; RegWrite_wb = 1'b0; Rd_mem = 5'd20; Rd_wb = 5'd25; regA = 5'd20; regB = 5'd20; #100;
	
	/*TEST 2: Initalize Rd_mem and Rd_wb to register X31*/
	RegWrite_mem = 1'b1; RegWrite_wb = 1'b1; Rd_mem = 5'd31; Rd_wb = 5'd31; regA = 5'd31; regB = 5'd31; #100;
	
	/*TEST 3: Set regA and regB to be different values from Rd_mem and Rd_wb*/
	Rd_mem = 5'd15; Rd_wb = 5'd16; regA = 5'd25; regB = 5'd20; #100;
	
	/*TEST 4: Set regA and regB to be equal to Rd_mem*/
	Rd_mem = 5'd15; Rd_wb = 5'd16; regA = 5'd15; regB = 5'd15; #100;
	
	/*TEST 5: Set regA and regB to be equal to Rd_wb*/
	Rd_mem = 5'd15; Rd_wb = 5'd16; regA = 5'd16; regB = 5'd16; #100;
	
	/*TEST 6: Set regA equal to Rd_mem and regB equal to Rd_wb*/
	Rd_mem = 5'd15; Rd_wb = 5'd16; regA = 5'd15; regB = 5'd16; #100;
	
	/*TEST 7: Set regA equal to Rd_wb and regB equal to Rd_mem*/
	Rd_mem = 5'd15; Rd_wb = 5'd16; regA = 5'd16; regB = 5'd15; #100;
	end
endmodule
