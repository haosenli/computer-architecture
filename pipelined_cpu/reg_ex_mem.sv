module reg_ex_mem(
    input  logic clk, reset,
    // DFF inputs
    input  logic [63:0] alu_result_ex, ReadData2_out_ex, new_PC2_ex,
    input  logic negative_ex, zero_ex, overflow_ex, carry_out_ex,
    // DFF outputs
    output logic [63:0] alu_result_mem, ReadData2_out_mem, new_PC2_mem,
    output logic negative_mem, zero_mem, overflow_mem, carry_out_mem
);

    n_dff #(64) dff0 (.in(alu_result_ex), .out(alu_result_mem), .*);
    n_dff #(64) dff1 (.in(ReadData2_out_ex), .out(ReadData2_out_mem), .*);
    n_dff #(64) dff2 (.in(new_PC2_ex), .out(new_PC2_mem), .*);
    n_dff #(1)  dff3 (.in(negative_ex), .out(negative_mem), .*);
    n_dff #(1)  dff4 (.in(zero_ex), .out(zero_mem), .*);
    n_dff #(1)  dff5 (.in(overflow_ex), .out(overflow_mem), .*);
    n_dff #(1)  dff6 (.in(carry_ou_ex), .out(carry_ou_mem), .*);

endmodule