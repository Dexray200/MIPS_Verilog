`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #3
//
// Create Date: 06/09/2022
// File Name: reg32.v
//
// 32bit Register used for AC and IR registers
//////////////////////////////////////////////////////////////////////////////////

module reg32(
    input clk,
    input LD,
    input reset,
    input [31:0] datain,
  
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
