`timescale 1ns / 1ps


module MEM_WB(
    input clk,
    input LD,
    input reset,
    input [102:0] datain,
  
    input [102:0] Initial,
    
    output reg [102:0] dataout
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
