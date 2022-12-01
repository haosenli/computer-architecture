`timescale 10ps/1ps
module forwarding_unit(
		input  logic ExRegWrite, MemRegWrite,
		input  logic [4:0] regA, regB, ExRd, MemRd,
		output logic [1:0] forwardA, forwardB	// 00 - no forward, 01 - forward from EX/MEM, 10- forward from MEM/WB, 11 - Dont care
	);
	
	always_comb begin
		// check if there is a register that is equal to regA being changed in the EX stage.
		if (ExRegWrite && (ExRd == regA) && (ExRd != 5'd31)) begin
			forwardA = 2'b01;
		end
		// check if there is a register that is equal to regA being changed in the MEM stage.
		else if (MemRegWrite && (MemRd == regA) && (MemRd != 5'd31)) begin
			forwardA = 2'b10;
		end
		// dont forward
		else begin
			forwardA = 2'b00;
		end
		
		// check if there is a register that is equal to regB being changed in the EX stage.
		if (ExRegWrite && (ExRd == regB) && (ExRd != 5'd31)) begin
			forwardB = 2'b01;
		end
		// check if there is a register that is equal to regB being changed in the MEM stage.
		else if (MemRegWrite && (MemRd == regB) && (MemRd != 5'd31)) begin
			forwardB = 2'b10;
		end
		// dont forward
		else begin
			forwardB = 2'b00;
		end
		
	end
	
endmodule

module forwarding_unit_testbench();
	logic ExRegWrite, MemRegWrite;
	logic [4:0] regA, regB, ExRd, MemRd;
	logic [1:0] forwardA, forwardB;
	
	forwarding_unit dut(.*);
	
	initial begin
	/*TEST 1: Initialize ExRegWrite and MemRegWrite to be false*/
	ExRegWrite = 1'b0; MemRegWrite = 1'b0; ExRd = 5'd20; MemRd = 5'd25; regA = 5'd20; regB = 5'd20; #100;
	
	/*TEST 2: Initalize ExRd and MemRd to register X31*/
	ExRegWrite = 1'b1; MemRegWrite = 1'b1; ExRd = 5'd31; MemRd = 5'd31; regA = 5'd31; regB = 5'd31; #100;
	
	/*TEST 3: Set regA and regB to be different values from ExRd and MemRd*/
	ExRd = 5'd15; MemRd = 5'd16; regA = 5'd25; regB = 5'd20; #100;
	
	/*TEST 4: Set regA and regB to be equal to ExRd*/
	ExRd = 5'd15; MemRd = 5'd16; regA = 5'd15; regB = 5'd15; #100;
	
	/*TEST 5: Set regA and regB to be equal to MemRd*/
	ExRd = 5'd15; MemRd = 5'd16; regA = 5'd16; regB = 5'd16; #100;
	
	/*TEST 6: Set regA equal to ExRd and regB equal to MemRd*/
	ExRd = 5'd15; MemRd = 5'd16; regA = 5'd15; regB = 5'd16; #100;
	
	/*TEST 7: Set regA equal to MemRd and regB equal to ExRd*/
	ExRd = 5'd15; MemRd = 5'd16; regA = 5'd16; regB = 5'd15; #100;
	end
endmodule
