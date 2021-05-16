module register(
    output reg [13:0] q,
    input [13:0] R, ALUout,
    input clk, ldR, ldALU, rst);

    always @ (posedge clk) begin
        if (rst == 1'b1) q <= 14'b0;
        else if (ldR == 1'b1) q <= R;
        else if (ldALU == 1'b1) q <= ALUout;
    end

endmodule