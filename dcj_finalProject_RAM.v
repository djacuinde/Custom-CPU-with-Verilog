`include "dcj_finalProject_instructionSet.v"
module RAM (
    output reg [13:0] data_o,
    input [13:0] data_i,
    input rd, wrt,
    input [5:0] address);
    
    reg [13:0] memory [0:63];

    begin // Initialize memory from mem file
        
        integer fid, i;

        initial begin
            fid = $fopen("program.mem","r");
            for (i = 0; i < 64; i = i+1) begin
                $fscanf(fid, "%b\n", memory[i]);
            end
        end

    end

    always @ (posedge rd or posedge wrt) begin
        if (rd == 1'b1) data_o <= memory[address];
        else if (wrt == 1'b1) memory[address] <= data_i;
    end

endmodule