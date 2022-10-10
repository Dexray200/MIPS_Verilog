`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #5
//
// Create Date: 06/23/2022
// File Name: EW_WB.v
//
// Pipelining register for in between the ALU result and the writeback to the register bank
//////////////////////////////////////////////////////////////////////////////////

module EX_WB(
    input clk,
    input LD,
    input reset,
    input [37:0] datain,
  
    input [37:0] Initial,
    
    output reg [37:0] dataout
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
