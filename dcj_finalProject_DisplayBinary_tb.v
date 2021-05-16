`timescale 1ns/100ps

module DisplayBianry_tb;
wire [6:0] Out0, Out1, Out2, Out3, Out4, Out5, 
			Out6, Out7, Out8, Out9, Out10, Out11, Out12, Out13;
reg [13:0] inputBinary;


displayBinary test(Out0, Out1, Out2, Out3, Out4, Out5, 
					Out6, Out7, Out8, Out9, Out10, Out11, Out12, Out13,
					inputBinary);
	initial begin
		inputBinary = 14'b11010101010101;
		#10
		inputBinary = 14'b11111111111111;
		#10
		inputBinary = 14'b00000000000000;
	end
endmodule

