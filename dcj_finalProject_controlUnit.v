`include "dcj_finalProject_instructionSet.v"
module controlUnit (
    output reg readRAM, writeRAM, ldA, ldB,
    output reg [5:0] address,
    output reg [4:0] opcode,
    output reg [7:0] ldALU, ldR,
    output reg [2:0] result, rega, regb, selram,
    output reg displaySelect,
    input [13:0] RAMdata,
    input clk, rst);
    
    reg [3:0] state;
    reg [5:0] pc;
    reg [13:0] currentInstruction;

    always @ (posedge clk, posedge rst) begin
        if (rst == 1'b1) begin
            state <= 4'b0000;
            readRAM <= 1'b0;
            writeRAM <= 1'b0;
            ldA <= 1'b0;
            ldB <= 1'b0;
            displaySelect <= 1'b0;
            selram <= 3'b000;
            opcode <= 5'b00000;
            address <= 6'b000000;
            result <= 3'b000;
            rega <= 3'b000;
            regb <= 3'b000;
            ldALU <= 8'b00000000;
            ldR <= 8'b00000000;
            pc <= 6'b000000;
            currentInstruction <= 14'b0;
        end
        else begin
            case(state)
                4'b0000: begin // fetch
                    readRAM <= 1'b1;
                    state <= 4'b0001;
                    address <= pc;
                end
                4'b0001: begin // decode
                    readRAM <= 1'b0;
                    opcode <= RAMdata[13:9];
                    result <= RAMdata[8:6];
                    rega <= RAMdata[5:3];
                    regb <= RAMdata[2:0];
                    currentInstruction <= RAMdata[13:0];
                    state <= 4'b0010;
                end
                4'b0010: begin // branch
                    case (opcode)
                        `START:     state <= 4'b0110;
                        `END:       state <= 4'b0110;
                        `WAIT:      state <= 4'b0110;
                        `ADD:       state <= 4'b0011;
                        `SUB:       state <= 4'b0011;
                        `MUL:       state <= 4'b0011;
                        `DIV:       state <= 4'b0011;
                        `CMPLT:     state <= 4'b0011;
                        `CMPGT:     state <= 4'b0011;
                        `CMPLE:     state <= 4'b0011;
                        `CMPGE:     state <= 4'b0011;
                        `CMPEQ:     state <= 4'b0011;
                        `CMPNE:     state <= 4'b0011;
                        `ANDB:      state <= 4'b0011;
                        `ORB:       state <= 4'b0011;
                        `NOTB:      state <= 4'b0011;
                        `XORB:      state <= 4'b0011;
                        `TWOCOMP:   state <= 4'b0011;
                        `LSLN:      state <= 4'b0011;
                        `LSRN:      state <= 4'b0011;
                        `LSL:       state <= 4'b0011;
                        `LSR:       state <= 4'b0011;
                        `ASL:       state <= 4'b0011;
                        `ASR:       state <= 4'b0011;
                        `RSL:       state <= 4'b0011;
                        `RSR:       state <= 4'b0011;
                        `DISPB:     state <= 4'b1100;
                        `DISPH:     state <= 4'b1101;
                        `MOD:       state <= 4'b0110;
                        `CPY:       state <= 4'b0011;
                        `LDR:       state <= 4'b0100;
                        `STR:       state <= 4'b0101;
                        default:    state <= 4'b0000;
                    endcase
                end
                4'b0011: begin // read ALU
                    case(result)
                        3'b000: ldALU <= 8'b00000001;
                        3'b001: ldALU <= 8'b00000010;
                        3'b010: ldALU <= 8'b00000100;
                        3'b011: ldALU <= 8'b00001000;
                        3'b100: ldALU <= 8'b00010000;
                        3'b101: ldALU <= 8'b00100000;
                        3'b110: ldALU <= 8'b01000000;
                        3'b111: ldALU <= 8'b10000000;
                        default: ldALU <= 8'b00000000;
                    endcase
                    state <= 4'b0111;
                end
                4'b0100: begin // load from mem to reg (LDR)
                    readRAM <= 1'b1;
                    address <= RAMdata[5:0];
                    case(result)
                        3'b000: ldR <= 8'b00000001;
                        3'b001: ldR <= 8'b00000010;
                        3'b010: ldR <= 8'b00000100;
                        3'b011: ldR <= 8'b00001000;
                        3'b100: ldR <= 8'b00010000;
                        3'b101: ldR <= 8'b00100000;
                        3'b110: ldR <= 8'b01000000;
                        3'b111: ldR <= 8'b10000000;
                        default: ldR <= 8'b00000000;
                    endcase
                    state <= 4'b0111;
                end
                4'b0101: begin // store from reg to mem (STR)
                    address <= RAMdata[5:0];
                    selram <= result;
                    state <= 4'b0111;
                end
                4'b0110: begin // do nothing
                    if (opcode == `END) state <= 4'b1111;
                    else state <= 4'b0111;
                end
                4'b0111: begin // wait 0
                    if (opcode == `STR) writeRAM <= 1'b1;
                    state <= 4'b1000;
                end 
                4'b1000: begin // wait 1
                    state <= 4'b1011;
                end
                4'b1001: begin
                end
                4'b1010: begin
                end
                4'b1011: begin // reset
                    ldALU <= 8'b00000000;
                    readRAM <= 1'b0;
                    ldR <= 8'b00000000;
                    writeRAM <= 1'b0;
                    ldA <= 1'b0;
                    pc <= pc + 1;
                    state <= 4'b0000;
                end
                4'b1100: begin //display Binary
                    displaySelect <= 1'b0;
                    ldA <= 1'b1;
                    state <= 4'b0111;
                end
                4'b1101: begin //display Hex
                    displaySelect <= 1'b1;
                    ldA <= 1'b1;
                    state <= 4'b0111;
                end
                4'b1111: begin // end of program
                    state <= 4'b1111;
                end
                default: state <= 4'b0000;
            endcase
        end
    end

endmodule