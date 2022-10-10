`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SIU Edwardsville
// Engineer: Steve Muren
// 
// Module Name:    DataMemory 
// Project Name: ECE 483 Lab #7 Summer 2017
// 
// Description: Data Memory module for implementation of
//		the 5-Stage Pipeline Processor.
//
//
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module DataMemory(
    output reg [31:0] ReadData,
    input [31:0] address,
    input [31:0] WriteData,
    input MemRead,
    input MemWrite
    );
	 
    reg	[31:0]	RAM  [65535:0];
	 
    always@  (address,MemWrite,MemRead)
	begin
	  if (MemWrite)
		RAM[address] <= WriteData;
	  else if  (MemRead)
		ReadData <= RAM[address];
	  else
		ReadData <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	end	
endmodule
