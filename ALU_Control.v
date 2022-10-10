`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #4
//
// Create Date: 06/16/2022
// File Name: ALU_Control.v
//
// Basic ALU Control for the processor, Done behavirorally
//////////////////////////////////////////////////////////////////////////////////


module ALU_Control(
    input [5:0] funct,
    input [1:0] ALUop,
    
    output reg [3:0] ALUctl
    );
    
    always @(funct, ALUop)
    if(ALUop == 2'b10) begin
        case(funct)
            6'b100000: ALUctl <= 4'b0010; //add
            6'b100010: ALUctl <= 4'b0110; //sub
            6'b100100: ALUctl <= 4'b0000; //and
            6'b100101: ALUctl <= 4'b0001; //or
            6'b101010: ALUctl <= 4'b1100; //nor
         endcase
    end
    else
        if(ALUop == 2'b00)
            ALUctl <= 4'b0010;
    else
        if(ALUop == 2'b01)
            ALUctl <=4'b0110;
endmodule