`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2022 08:12:48 PM
// Design Name: 
// Module Name: PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC(
    input clk,
    input LD,
    input reset,
    input [31:0] datain,
  
    input [31:0] Initial,
    
    output reg [31:0] dataout
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
