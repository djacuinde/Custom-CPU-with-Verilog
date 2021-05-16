module CPU (
    output [6:0] disp0, disp1, disp2, disp3, disp4, disp5, disp6, disp7, disp8, disp9, disp10, disp11, disp12, disp13,
    output [2:0] flags,
    input clk, rst);

    wire [13:0] data_o, A, B, ALUout, ramOut, inputBinary;
    wire [7:0] ldR, ldALU;
    wire [5:0] address;
    wire [4:0] opcode;
    wire [2:0] result, rega, regb, selram;
    wire readRAM, writeRAM, displaySelect, ldA, ldB;

    RAM RM1 (data_o, ramOut, readRAM, writeRAM, address);
    registerArray RA1 (A, B, ramOut, data_o, ALUout, ldR, ldALU, rega, regb, selram, clk, rst);
    ALU A1 (ALUout, flags, A, B, opcode, rst, clk);
    controlUnit CU1 (readRAM, writeRAM, ldA, ldB, address, opcode, ldALU, ldR, result, rega, regb, selram, displaySelect, data_o, clk, rst);

    register disreg (inputBinary, A, B, clk, ldA, ldB, rst);
    mux21 display (disp0, disp1, disp2, disp3, disp4, disp5, disp6, disp7, disp8, disp9, disp10, disp11, disp12, disp13, inputBinary, displaySelect); 
endmodule