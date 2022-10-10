`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #4
//
// Create Date: 06/16/2022
// File Name: Control.v
//
// Main Control unit for MIPS processor, all done structrually
//////////////////////////////////////////////////////////////////////////////////


module Control(
    input [5:0] OPcode,
    
    output [1:0] ALUop,
    output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch
    );
    
    // Building It Structurally from Appendix D
    
    and (RegDst, ~OPcode[5], ~OPcode[4], ~OPcode[3], ~OPcode[2], ~OPcode[1], ~OPcode[0]);
    and (MemtoReg, OPcode[5],~OPcode[4], ~OPcode[3], ~OPcode[2],OPcode[1],OPcode[0]);
    and (MemWrite, OPcode[5],~OPcode[4], OPcode[3],~OPcode[2],OPcode[1],OPcode[0]);
    and (Branch, ~OPcode[5], ~OPcode[4], ~OPcode[3],OPcode[2],~OPcode[1], ~OPcode[0]);
    
    or (RegWrite, RegDst, MemtoReg);
    or (ALUSrc, MemtoReg, MemWrite);
    
    assign ALUop[1] = RegDst;
    assign MemRead = MemtoReg;
    assign ALUop[0] = Branch;
     
    
    
    
    /*
    // Behaviorally made Control
    always @(OPcode)
        if(OPcode == 0) begin //RType Instuction
            regWrite <= 1;
            ALUop <= 2'b10;
        end
        else
            if(OPcode == 35) begin //Load Instruction
                regWrite <= 1;
                ALUop <= 2'b00;
            end
        else
            if(OPcode == 43) begin //Store Instruction
                regWrite <= 0;
                ALUop <= 2'b00;
            end  
        else
            if(OPcode == 4) begin
                regWrite <= 0;
                ALUop <= 2'b01;
            end
            */
endmodule
