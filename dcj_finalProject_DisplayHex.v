
module displayHex(output [6:0] Out0, Out1, Out2, Out3, 
					output reg [6:0]Out4, Out5, 
					 Out6, Out7, Out8, Out9, Out10, Out11, Out12, Out13,
					 input [13:0] inputBinary);
reg [3:0] temp0, temp1, temp2, temp3;
wire [6:0] tempOut0, tempOut1, tempOut2, tempOut3;

always @(*)begin
	temp0 <= (inputBinary[0]*1) + (inputBinary[1]*2) +
			(inputBinary[2]*4)+ (inputBinary[3]*8);		
	temp1 <= (inputBinary[4]*1) + (inputBinary[5]*2) +
			(inputBinary[6]*4)+ (inputBinary[7]*8);			
	temp2 <= (inputBinary[8]*1) + (inputBinary[9]*2) +
			(inputBinary[10]*4)+ (inputBinary[11]*8);		
	temp3 <= (inputBinary[12]*1) + (inputBinary[13]*2);	

	Out4 <= 7'b1111111;
	Out5 <= 7'b1111111;
	Out6 <= 7'b1111111;
	Out7 <= 7'b1111111;
	Out8 <= 7'b1111111;
	Out9 <= 7'b1111111;
	Out10 <= 7'b1111111;
	Out11 <= 7'b1111111;
	Out12 <= 7'b1111111;
	Out13 <= 7'b1111111;	
end
setHexValue u1(tempOut0, temp0);
setHexValue u2(tempOut1, temp1);
setHexValue u3(tempOut2, temp2);
setHexValue u4(tempOut3, temp3);

assign Out0 = tempOut0;
assign Out1 = tempOut1;
assign Out2 = tempOut2;
assign Out3 = tempOut3;
	
endmodule
