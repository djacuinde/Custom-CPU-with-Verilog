
module mux21_tb;

wire [6:0] disp0, disp1, disp2, disp3, disp4, disp5, disp6, disp7, disp8,  
			disp9,disp10, disp11, disp12, disp13;
reg [13:0] inputBinary;
reg DispSelect;

mux21 test(disp0, disp1, disp2, disp3, disp4, disp5, disp6, disp7, disp8,  
			disp9, disp10, disp11, disp12, disp13, inputBinary, DispSelect);
	initial begin
		inputBinary = 14'b01010101010101;
		DispSelect = 1'b0;
		
		#20 DispSelect = 1'b1;
	end

endmodule