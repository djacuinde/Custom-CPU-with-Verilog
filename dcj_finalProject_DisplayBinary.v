
// Values are configure for Common Anode 7-Segment
`define ZERO 7'b0000001 //Decimal = 1
`define ONE 7'b1001111 //Decimal = 79

//msb to lsb 
//Out13 to Out0
module displayBinary(output reg [6:0] Out0, Out1, Out2, Out3, Out4, Out5, 
					 Out6, Out7, Out8, Out9, Out10, Out11, Out12, Out13,
					input [13:0] inputBinary);

always @(*)begin
	Out0 <= (inputBinary[0] == 1'b0)?(`ZERO):(`ONE);
	Out1 <= (inputBinary[1] == 1'b0)?(`ZERO):(`ONE);
	Out2 <= (inputBinary[2] == 1'b0)?(`ZERO):(`ONE);
	Out3 <= (inputBinary[3] == 1'b0)?(`ZERO):(`ONE);
	Out4 <= (inputBinary[4] == 1'b0)?(`ZERO):(`ONE);
	Out5 <= (inputBinary[5] == 1'b0)?(`ZERO):(`ONE);
	Out6 <= (inputBinary[6] == 1'b0)?(`ZERO):(`ONE);
	Out7 <= (inputBinary[7] == 1'b0)?(`ZERO):(`ONE);
	Out8 <= (inputBinary[8] == 1'b0)?(`ZERO):(`ONE);
	Out9 <= (inputBinary[9] == 1'b0)?(`ZERO):(`ONE);
	Out10 <= (inputBinary[10] == 1'b0)?(`ZERO):(`ONE);
	Out11 <= (inputBinary[11] == 1'b0)?(`ZERO):(`ONE);
	Out12 <= (inputBinary[12] == 1'b0)?(`ZERO):(`ONE);
	Out13 <= (inputBinary[13] == 1'b0)?(`ZERO):(`ONE);

end 
endmodule

