module data_if (
    input  logic clk,
    input  logic [63:0] Db,
    output logic [63:0] BLT,
    output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemWrite, 
    output logic BrTaken, BLsignal, BRsignal,
    output logic [2:0] ALUop,
    output logic [4:0]  Rn, Rd, Rm, Rt,
    output logic [11:0] ALU_imm,x
    output logic [8:0]  DT_addr,
    output logic [5:0]  shamt
    );
    // General signals
    logic [63:0] pc;
    logic [31:0] instruction;
    // Internal control signals
    logic UnCondBr;
    // Addresses
    logic [18:0] COND_BR_addr,
    logic [25:0] BR_addr,
    // Sign-extended addresses
    logic [63:0] COND_BR_addr64, BR_addr64, selected_addr64;

    // Sign Extenders


    // 2x1 64-bits Mux for CondAddr19 and BrAddr26 
    mux64_2x1 mux64_0(.sel(UnCondBr), .A(COND_BR_addr64), .B(BR_addr64), .out());

    // Logical Left Shift 2 into Adder
    adder64 adder_0();
    

    // Instruction Memory
    instructmem im_module(.address(pc), .instruction(instruction), .clk(clk));

    // Instruction Decoder
    instruction_decoder id_module(.*);



endmodule