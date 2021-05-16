//These are the opcodes for the 14-bit CPU

`define START	5'b00000
`define END 	5'b00001
`define WAIT	5'b00010
`define ADD 	5'b00011
`define SUB		5'b00100

`define MUL		5'b00101
`define DIV		5'b00110
`define CMPLT	5'b00111
`define CMPGT 	5'b01000
`define CMPLE 	5'b01001

`define CMPGE 	5'b01010
`define CMPEQ 	5'b01011
`define CMPNE 	5'b01100
`define ANDB 	5'b01101
`define ORB 	5'b01110

`define NOTB 	5'b01111
`define XORB 	5'b10000
`define TWOCOMP 5'b10001
`define LSLN	5'b10010
`define LSRN 	5'b10011

`define LSL 	5'b10100
`define LSR 	5'b10101
`define ASL 	5'b10110
`define ASR 	5'b10111
`define RSL 	5'b11000

`define RSR 	5'b11001
`define DISPB 	5'b11010
`define DISPH 	5'b11011
`define MOD 	5'b11100
`define CPY 	5'b11101

`define LDR 	5'b11110
`define STR 	5'b11111