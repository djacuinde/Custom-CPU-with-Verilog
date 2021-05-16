//ALU_FLAGS = 0 -> No Flags
//ALU_FLAGS = 1 -> True
//ALU_FLAGS = 2 -> False 
//ALU_FLAGS = 3 -> OverFlow
//ALU_FLAGS = 4 -> Negative
//ALU_FLAGS = 5 -> Invalid
//ALU_FLAGS = 6 -> EVEN Value
//ALU_FLAGS = 7 -> ODD Value

`include "dcj_finalProject_instructionSet.v"
module ALU (ALU_OUTPUT, ALU_FLAGS, A, B, ALU_OpCode, rstFlags, clk);
	output reg [13:0] ALU_OUTPUT;
	output reg [2:0] ALU_FLAGS;
	input [13:0] A, B;
	input [4:0] ALU_OpCode;
	input rstFlags, clk;

	reg [27:0] tempMult;
	reg [14:0] tempOver;

	always @(posedge clk or posedge rstFlags) begin
		if (rstFlags == 1'b1) begin // Controller will reset Flags
			ALU_OUTPUT <= 14'd0;
			ALU_FLAGS <= 2'd0;
			tempMult <= 15'd0;
			tempOver <= 15'd0;
		end
		else case (ALU_OpCode)
			`START: ALU_OUTPUT <= 14'b0; // START
			`END: ALU_OUTPUT <= 14'b0; // END
			`WAIT: ALU_OUTPUT <= 14'b0; // WAIT
			`ADD: begin // Addition
					tempOver = A + B;
					if (tempOver[14] == 1'b1) ALU_FLAGS = 3'd3; // OverFlow
					ALU_OUTPUT = tempOver[13:0];
			end
			`SUB: begin // Substraction
					if (A < B) begin
						ALU_FLAGS = 3'd4; // Negative
						ALU_OUTPUT = 14'b0;
					end
					else ALU_OUTPUT = A - B; 
			end
			`MUL: begin // Multiply
					tempMult = A * B;
					if (tempMult > 14'd255) ALU_FLAGS = 3'd3; // OverFlow
					ALU_OUTPUT = tempMult[13:0];
			end
			`DIV: begin // Division
					if (B == 1'd0) begin
						ALU_FLAGS = 3'd5; // Invalid
						ALU_OUTPUT = A;
					end
					else ALU_OUTPUT = A / B; 
			end
			`CMPLT: ALU_FLAGS <= (A < B) ? 3'd1:3'd2; // A less than B ?
			`CMPGT: ALU_FLAGS <= (A > B) ? 3'd1:3'd2; // A greater than B ?
			`CMPLE: ALU_FLAGS <= (A <= B) ? 3'd1:3'd2; // A less than or eqaul to B?
			`CMPGE: ALU_FLAGS <= (A >= B) ? 3'd1:3'd2; // A greater than or equal to B?
			`CMPEQ: ALU_FLAGS <= (A == B) ? 3'd1:3'd2; // A equal to B ?
			`CMPNE: ALU_FLAGS <= (A != B) ? 3'd1:3'd2; // A not equal to B?
			`ANDB: ALU_OUTPUT <= A & B; // Bitwise AND
			`ORB: ALU_OUTPUT <= A | B; // Bitwise OR
			`NOTB: ALU_OUTPUT <= ~A; // Bitwsie NOT
			`XORB: ALU_OUTPUT <= A ^ B; //Bitwsie XOR
			`TWOCOMP: begin // Two's Complement
					tempOver = (~A) + 1; 
					if (tempOver[14] == 1'b1) ALU_FLAGS = 3'd3; //OverFlow
					ALU_OUTPUT = tempOver[13:0];
			end
			`LSLN: ALU_OUTPUT <= A << B; // Logical shift left by B
			`LSRN: ALU_OUTPUT <= A >> B; // Logical shift right by B
			`LSL: ALU_OUTPUT <= A << 1; //Logical shift left
			`LSR: ALU_OUTPUT <= A >> 1; //Logical shift right
			`ASL: ALU_OUTPUT <= A <<< 1; // Arithmetic shift left
			`ASR: ALU_OUTPUT <= A >>> 1; // Arithmetic shift right
			`RSL: ALU_OUTPUT <= {A[12:0], A[13]}; // Rotate left
			`RSR: ALU_OUTPUT <= {A[0], A[13:1]}; // Rotate right
			`DISPB: ALU_OUTPUT <= 14'b0; // Display binary to LEDS; 
			`DISPH: ALU_OUTPUT <= 14'b0; // Display hex;
			`MOD: begin//Modulus of 2
					if((A % 2'd2)== 0) ALU_FLAGS = 3'd6;
					else ALU_FLAGS = 3'd7;
			end	
			`CPY: ALU_OUTPUT <= A; // COPY A to B
			`LDR: ALU_OUTPUT <= 14'b0; // Load
			`STR: ALU_OUTPUT <= 14'b0; // Store
			default: ALU_FLAGS <= 3'd0;
		endcase
	end
endmodule