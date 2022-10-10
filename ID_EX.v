`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #5
//
// Create Date: 06/23/2022
// File Name: ID_EX.v
//
// Pipelining register for inbetween the register bank and the ALU
//////////////////////////////////////////////////////////////////////////////////

module ID_EX(
    input clk,
    input LD,
    input reset,
    input [114:0] datain,
    
    input [114:0] Initial,
    
    output reg [114:0] dataout
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
