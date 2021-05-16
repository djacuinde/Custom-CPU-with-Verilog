module counter (
    output reg [5:0] count,
    input enable, rst, clk);

    always @ (posedge clk) begin
        if (rst == 1'b1) count <= 6'b0;
        else if (enable == 1'b1) begin
            if (count != 6'd63) count <= count + 1;
        end
    end

endmodule