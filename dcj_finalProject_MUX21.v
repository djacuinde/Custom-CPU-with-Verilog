module mux21( 
output reg [6:0] disp0, disp1, disp2, disp3, disp4, disp5, disp6, disp7,  
				disp8, disp9, disp10, disp11, disp12, disp13,
input [13:0] inputBinary, 
input DispSelect);

wire [6:0]Out0, Out1, Out2, Out3, Out4, Out5, Out6, 
	Out7, Out8, Out9, Out10, Out11, Out12, Out13, 
	Out14, Out15, Out16, Out17, Out18, Out19, Out20, 
	Out21, Out22, Out23, Out24, Out25, Out26, Out27;
		
displayHex hex(Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7, Out8, 
			Out9, Out10, Out11, Out12, Out13,inputBinary);
displayBinary binary(Out14, Out15, Out16, Out17, Out18, Out19, Out20, 
			Out21, Out22, Out23, Out24, Out25, Out26, Out27, inputBinary);	
always@ (*)begin
	if (DispSelect == 1'b1)begin 
		disp0 <= Out0;
		disp1 <= Out1;
		disp2 <= Out2;
		disp3 <= Out3;
		disp4 <= Out4;
		disp5 <= Out5;
		disp6 <= Out6;
		disp7 <= Out7;
		disp8 <= Out8;
		disp9 <= Out9;
		disp10 <= Out10;
		disp11 <= Out11;
		disp12 <= Out12;
		disp13 <= Out13;
		end
	else begin 
		disp0 <= Out14;
		disp1 <= Out15;
		disp2 <= Out16;
		disp3 <= Out17;
		disp4 <= Out18;
		disp5 <= Out19;
		disp6 <= Out20;
		disp7 <= Out21;
		disp8 <= Out22;
		disp9 <= Out23;
		disp10 <= Out24;
		disp11 <= Out25;
		disp12 <= Out26;
		disp13 <= Out27;
		end
end
endmodule