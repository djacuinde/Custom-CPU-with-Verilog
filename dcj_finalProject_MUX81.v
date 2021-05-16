module MUX81 (
    output reg [13:0] dout,
    input [2:0] sel,
    input [13:0] d1, d2, d3, d4, d5, d6, d7, d8,
    input clk);

    always @ (posedge clk) begin
        casez(sel)
            3'b000: dout <= d1;
            3'b001: dout <= d2;
            3'b010: dout <= d3;
            3'b011: dout <= d4;
            3'b100: dout <= d5;
            3'b101: dout <= d6;
            3'b110: dout <= d7;
            3'b111: dout <= d8;
            default: dout <= 14'bz;
        endcase
    end

endmodule