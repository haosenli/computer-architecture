module data_if (
    input  logic [63:0] Db,
    input  logic clk,
    output logic [63:0] BLT,
    output logic [31:0] instruction
    );
    logic [63:0] pc,
    
    instructmem im_module(.address(), .instruction(), .clk(clk));
endmodule