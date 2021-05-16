module registerArray(
    output [13:0] rout1, rout2, ramOut,
    input [13:0] rin, ALUin,
    input [7:0] ldR, ldALU,
    input [2:0] selrd1, selrd2, selram,
    input clk, rst);

    wire [13:0] rd0, rd1, rd2, rd3, rd4, rd5, rd6, rd7;

    register R0 (rd0, rin, ALUin, clk, ldR[0], ldALU[0], rst); //General
    register R1 (rd1, rin, ALUin, clk, ldR[1], ldALU[1], rst); //General
    register R2 (rd2, rin, ALUin, clk, ldR[2], ldALU[2], rst); //General
    register R3 (rd3, rin, ALUin, clk, ldR[3], ldALU[3], rst); //General
    register R4 (rd4, rin, ALUin, clk, ldR[4], ldALU[4], rst); //General
    register R5 (rd5, rin, ALUin, clk, ldR[5], ldALU[5], rst); //General
    register R6 (rd6, rin, ALUin, clk, ldR[6], ldALU[6], rst); //General
    register R7 (rd7, rin, ALUin, clk, ldR[7], ldALU[7], rst); //General

    MUX81 M1 (rout1, selrd1, rd0, rd1, rd2, rd3, rd4, rd5, rd6, rd7, clk);
    MUX81 M2 (rout2, selrd2, rd0, rd1, rd2, rd3, rd4, rd5, rd6, rd7, clk);
    MUX81 M3 (ramOut, selram, rd0, rd1, rd2, rd3, rd4, rd5, rd6, rd7, clk);

endmodule