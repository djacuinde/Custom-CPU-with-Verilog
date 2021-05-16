
module setHexValue (output reg [6:0] display, input [3:0] value);
always @(*)begin 
	case(value)
		0: display  <= 7'b0000001;
		1: display  <= 7'b1001111;
		2: display  <= 7'b0010010;
		3: display  <= 7'b0000110;
		4: display  <= 7'b1001100;
		5: display  <= 7'b0100100;
		6: display  <= 7'b0100000;
		7: display  <= 7'b0001111;
		8: display  <= 7'b0000000;
		9: display  <= 7'b0001100;
		10: display  <= 7'b0001000;
		11: display  <= 7'b1100000;
		12: display  <= 7'b0110001;
		14: display  <= 7'b0110000;
		15: display  <= 7'b0111000;
		default: display <= 7'b1111111; //OFF mode
		endcase
end
endmodule
