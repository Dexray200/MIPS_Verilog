`timescale 1ns / 1ps

module IF_ID(
    input clk,
    input LD,
    input reset,
    input [77:0] datain,
    
    input [31:0] Initial,
    
    output reg [31:0] dataout
    );
    // at every clock cycle check for reset or data module load
    always @(clk)
    begin
        if(!reset)
            dataout <= Initial;
        else
            if(LD)
                dataout <= datain;
    end
endmodule

