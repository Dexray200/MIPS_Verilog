`timescale 1ns / 1ps



module EX_MEM(
    input clk,
    input LD,
    input reset,
    input [74:0] datain,
  
    input [74:0] Initial,
    
    output reg [74:0] dataout
    );
    // at every clock cycle check for reset or data module load
    always @(posedge clk)
    begin
        if(!reset)
            dataout <= Initial;
        else
            if(LD)
                dataout <= datain;
    end
endmodule
