module instruction_decoder(
	 input logic clk,
    input  logic [31:0] instruction,
    output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemWrite, BrTaken, UnCondBr,
	 output logic [2:0] ALUop,
    output logic [4:0] Rn, Rd, Rm, Rt,
    output logic [11:0] ALU_imm,
    output logic [18:0] COND_BR_addr,
    output logic [8:0] DT_addr,
    output logic [25:0] BR_addr,
    output logic [5:0] shamt
    );
	 
	 always_ff @(posedge clk) begin
		/*casez(instruction[31:21])*/
			// ADDI
			if (instruction[31:22] == 10'b1001000100)/*11'b1001000100?:*/ begin
				ALUSrc <= 1'b1;
				MemtoReg <= 1'b0;
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				BrTaken <= 1'b0;
				ALUop <= 3'b010;
				Rd <= instruction[4:0];
				Rn <= instruction[9:5];
				ALU_imm <= instruction[21:10];
			end
			
			// ADDS
			if (instruction[31:21] == 11'b10101011000)/*11'b10101011000:*/ begin
				Reg2Loc <= 1'b1;
				ALUSrc <= 1'b0;
				MemtoReg <= 1'b0;
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				BrTaken <= 1'b0;
				ALUop <= 3'b010;
				Rd <= instruction[4:0];
				Rn <= instruction[9:5];
				shamt <= instruction[15:10];
				Rm <= instruction[20:16];
			end
			
			// B
			if (instruction[31:26] == 6'b000101)/*11'b000101?????:*/ begin
				RegWrite <= 1'b0;
				MemWrite <= 1'b0;
				BrTaken <= 1'b1;
				UnCondBr <= 1'b1;
				BR_addr <= instruction[25:0];
			end
			
			// B.cond
			/*11'b01010100???:*/ begin
			end
			
			// BL
			/*11'b100101?????:*/ begin
			end
			
			// BR
			/*11'b11010110000:*/ begin
			end
			
			// CBZ
			if (instruction[31:24] == 8'b10110100)/*11'b10110100???:*/ begin
				Reg2Loc <= 1'b0;
				ALUSrc <= 1'b0;
				RegWrite <= 1'b0;
				MemWrite <= 1'b0;
				BrTaken <= /*ZeroFlag*/1'b0;	// change
				UnCondBr <= 1'b0;
				ALUop <= 3'b000;
				Rt <= instruction[4:0];
				COND_BR_addr <= instruction[23:5];
			end
			
			// LDUR
			if (instruction[31:21] == 11'b11111000010)/*11'b11111000010:*/ begin
				ALUSrc <= 1'b1;
				MemtoReg <= 1'b1;
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				BrTaken <= 1'b0;
				ALUop <= 3'b010;
				Rt <= instruction[4:0];
				Rn <= instruction[9:5];
				DT_addr <= instruction[20:12];
			end
			
			// STUR
			if (instruction[31:21] == 11'b11111000000)/*11'b11111000000:*/ begin
				Reg2Loc <= 1'b0;
				ALUSrc <= 1'b1;
				RegWrite <= 1'b0;
				MemWrite <= 1'b1;
				BrTaken <= 1'b0;
				ALUop <= 3'b010;
				Rt <= instruction[4:0];
				Rn <= instruction[9:5];
				DT_addr <= instruction[20:12];
			end
			
			// SUBS
			if (instruction[31:21] == 11'b11101011000)/*11'b11101011000:*/ begin
				Reg2Loc <= 1'b1;
				ALUSrc <= 1'b0;
				MemtoReg <= 1'b0;
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				BrTaken <= 1'b0;
				ALUop <= 3'b011;
				Rd <= instruction[4:0];
				Rn <= instruction[9:5];
				shamt <= instruction[15:10];
				Rm <= instruction[20:16];
			end
		/*endcase*/
	 
	 end
	 
endmodule


// testbench
module instruction_decoder_testbench();
	logic clk;
   logic [31:0] instruction;
   logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemWrite, BrTaken, UnCondBr;
	logic [2:0] ALUop;
   logic [4:0] Rn, Rd, Rm, Rt;
   logic [11:0] ALU_imm;
   logic [18:0] COND_BR_addr;
   logic [8:0] DT_addr;
   logic [25:0] BR_addr;
   logic [5:0] shamt;
	
	instruction_decoder dut(.*);
	
	// simulated clock
    parameter period = 100;
    initial begin
        clk <= 0;
        forever begin
            #(period/2)
            clk <= ~clk;
        end
    end
	
	initial begin
		// ADDI          //01234567890123456789012345678901
		instruction <= 32'b10010001000000011111100101101111; repeat(100) @(posedge clk);
		// ADDS
		instruction <= 32'b10101011000100100000000001100111; repeat(100) @(posedge clk);
		// B
		instruction <= 32'b00010100000000000000000000000001; repeat(100) @(posedge clk);
		// B.cond
		// BL
		// BR
		// CBZ
		instruction <= 32'b10110100000000000000011100101100; repeat(100) @(posedge clk);
		// LDUR
		instruction <= 32'b11111000010000000001001111100000; repeat(100) @(posedge clk);
		// STUR
		instruction <= 32'b11111000000010010011001010101010; repeat(100) @(posedge clk);
		// SUBS
		instruction <= 32'b11101011000111100000001001100010; repeat(100) @(posedge clk);
		$stop;
	end
endmodule
