
`timescale 1ns/100ps
module displayHex_tb;
wire [6:0] Out0, Out1, Out2, Out3, Out4, Out5, 
					 Out6, Out7, Out8, Out9, Out10, Out11, Out12, Out13;
reg [13:0] inputBinary;

displayHex test(Out0, Out1, Out2, Out3, Out4, Out5, 
					Out6, Out7, Out8, Out9, Out10, Out11, Out12, Out13,
					inputBinary);
	initial begin
		#5 inputBinary = 14'b01010101101011;
		#5 inputBinary = 14'b11111111111111;
		#5 inputBinary = 14'b00000000000000;
	end
endmodule