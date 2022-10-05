// Design
// D flip-flop
module d_ff (input logic clk, reset,
             output logic d, q);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule