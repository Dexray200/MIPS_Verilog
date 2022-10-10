`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #6
//
// Create Date: 06/30/2022
// File Name: MIPS_CPU.v
//
// MAIN FILE FOR MIPS PROCESSOR: Main file that structurally
// connects all components of the processor design
// Updated for 5 cycle pipelining with two extra registers IF_ID, ID_EX, EX_MEM, and MEM_WB
//////////////////////////////////////////////////////////////////////////////////


module MIPS_CPU(
    input rst,
    input clk,
    input [31:0] inst,
    
    output [31:0] WriteData
    );
    
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire RegWrite;
    wire [1:0]ALUop;
    wire [3:0]ALUctl;
    wire [31:0]AddOut;
    wire [31:0]AddIn;
    wire RegDst, ALUSrc, MemtoReg, MemRead, MemWrite, Branch;
    wire [31:0] SignExtend;
    wire [4:0] RegDst_out;
    wire [31:0] ALUSrc_out;
    wire Zero;
    wire [31:0] MemReadData;
    wire [31:0] MemtoReg_out;
    
    // Pipelining inputs and outputs
    wire [31:0] IF_ID_in;
    wire [31:0] IF_ID_out;
    wire [114:0] ID_EX_in;
    wire [114:0] ID_EX_out;
    wire [74:0] EX_MEM_in;
    wire [74:0] EX_MEM_out;
    wire [102:0] MEM_WB_in;
    wire [102:0] MEM_WB_out;
    
    // Pipelining Addition:
    // ALUop 2 [114:113], RegDst 1 [112], ALUSrc 1 [111], MemtoReg [110], MemRead [109], MemWrite [108], Branch [107], RegWrite [106], ReadData1 32 [105:74], ReadData2 32 [73:42]  
    // SignExtend [41:10] (Funct [15:10]), Load Adder [9:5], R adder [4:0]
    assign ID_EX_in= {ALUop, RegDst, ALUSrc, MemtoReg, MemRead, MemWrite, Branch, RegWrite, ReadData1, ReadData2, SignExtend, IF_ID_out[20:16], IF_ID_out[15:11]}; 
    
    // MemtoReg [74], MemRead [73], MemWrite [72], Branch [71], RegWrite [70], Zero [69], WriteData 32 [68:37], ReadData2 32 [36:5], Addressreg [4:0]
    assign EX_MEM_in = {ID_EX_out[110:106], Zero, WriteData, ID_EX_out[73:42], RegDst_out};
    
    // MemtoReg [102], Regwrite [101], MemoryData 32 [100:69], WriteData [68:37], ReadData2 [36:5], Addressreg [4:0]
    assign MEM_WB_in = {EX_MEM_out[74],EX_MEM_out[70],MemReadData,EX_MEM_out[68:0]};
    
    // Initialization of pipeline registers
    IF_ID ifid (.clk(clk),.LD(1'b1),.reset(rst),.datain(IF_ID_in),.Initial(32'h0000_0000),.dataout(IF_ID_out));
    ID_EX idex (.clk(clk),.LD(1'b1),.reset(rst),.datain(ID_EX_in),.Initial(115'h0000_0000),.dataout(ID_EX_out));
    EX_MEM exmem (.clk(clk),.LD(1'b1),.reset(rst),.datain(EX_MEM_in),.Initial(75'h0000_0000),.dataout(EX_MEM_out));
    MEM_WB memwb (.clk(clk),.LD(1'b1),.reset(rst),.datain(MEM_WB_in),.Initial(103'h0000_0000),.dataout(MEM_WB_out));
   
    // Program Counter and add 4
    PC pc(.clk(clk),.LD(1'b1),.reset(rst),.datain(AddOut),.Initial(32'h0000_0000),.dataout(AddIn));
    
    ALU32bit ALU32_Add4(
        .ALUctl(4'b0010),
        .A(AddIn), 
        .B(32'h0000_0004),
        .result(AddOut)
    );
    IR_Mem Inst_Mem(.data_out(IF_ID_in),.address(AddIn));
    
    
    Multi2to1_5bit MuxRegDst(.In1(ID_EX_out[9:5]), .In2(ID_EX_out[4:0]), .Sel(ID_EX_out[112]), .Out(RegDst_out));
    
    Mux2to1_32bit MuxAlUSrc(.In1(ID_EX_out[73:42]), .In2(ID_EX_out[41:10]), .Sel(ID_EX_out[111]), .Out(ALUSrc_out));
    
    Mux2to1_32bit MuxMemtoReg(.In2(MEM_WB_out[100:69]), .In1(MEM_WB_out[68:37]), .Sel(MEM_WB_out[102]), .Out(MemtoReg_out));
    
    Sign_Extend signExtend(.in(IF_ID_out[15:0]),.clk(clk),.out(SignExtend));
    
    Register_Bank Registers(
        .ReadReg1(IF_ID_out[25:21]),
        .ReadReg2(IF_ID_out[20:16]),
        .WriteReg(MEM_WB_out[4:0]),
        .regWrite(MEM_WB_out[101]),
        .WriteData(MemtoReg_out),
        .clk(clk),
        .rst(rst),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );
    
    Control control(
        .OPcode(IF_ID_out[31:26]),
        .ALUop(ALUop),
        .RegWrite(RegWrite),
        .RegDst(RegDst), 
        .ALUSrc(ALUSrc), 
        .MemtoReg(MemtoReg),
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .Branch(Branch)
    );
    
    ALU_Control alucontrol(
        .funct(ID_EX_out[15:10]),
        .ALUop(ID_EX_out[114:113]),
        .ALUctl(ALUctl)
    );
    
    ALU32bit ALU32(
        .ALUctl(ALUctl),
        .A(ID_EX_out[105:74]), 
        .B(ALUSrc_out),
        .result(WriteData),
        .Zero(Zero)
    );
    
    DataMemory Mem(.ReadData(MemReadData),
    .address(EX_MEM_out[68:37]),
    .WriteData(EX_MEM_out[36:5]),
    .MemRead(EX_MEM_out[73]),
    .MemWrite(EX_MEM_out[72])
    );
    
    /* Old Single cycle Code  
    Register_Bank Registers(
        .ReadReg1(inst[25:21]),
        .ReadReg2(inst[20:16]),
        .WriteReg(inst[15:11]),
        .regWrite(RegWrite),
        .WriteData(WriteData),
        .clk(clk),
        .rst(rst),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );
    
    Control control(
        .OPcode(inst[31:26]),
        .ALUop(ALUop),
        .RegWrite(RegWrite)
    );
    
    ALU_Control alucontrol(
        .funct(inst[5:0]),
        .ALUop(ALUop),
        .ALUctl(ALUctl)
    );
    
    ALU32bit ALU32(
        .ALUctl(ALUctl),
        .A(ReadData1), 
        .B(ReadData2),
        .result(WriteData)
    );
    */
endmodule
