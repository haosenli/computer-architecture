module instruction_decoder(
    input logic [31:0] instruction,
    output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemWrite, BrTaken, UnCondBr, ALUop,
    output logic [4:0] Rn, Rd, Rm, Rt,
    output logic [11:0] ALU_imm,
    output logic [18:0] COND_BR_addr,
    output logic [8:0] DT_addr,
    output logic [23:0] COND_BR_addr,
    output logic [5:0] shamt,
    );
