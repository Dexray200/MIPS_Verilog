`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #4
//
// Create Date: 06/16/2022
// File Name: Register_Bank.v
//
// 32 32bit Register Register Bank for MIPS processor
//////////////////////////////////////////////////////////////////////////////////


module Register_Bank(
    input [4:0]ReadReg1, ReadReg2,
    input [4:0]WriteReg,
    input [31:0]WriteData,
    input regWrite,
    input clk,
    input rst,
    
    output [31:0]ReadData1,
    output [31:0]ReadData2
    );
    wire [31:0] In1, In2, In3, In4, In5, 
    In6, In7, In8, In9, In10, In11, In12,
    In13, In14, In15, In16, In17, In18, In19,
    In20, In21, In22, In23, In24, In25, In26, In27,
    In28, In29, In30, In31, In32;
    wire [31:0] regLDHigh;
    wire [31:0] regLoad;
    
    Write_Decode decoder(.RegAddr(WriteReg),.regWrite(regWrite),.regLoad(regLoad));
    
    and (regLDHigh[0], regLoad[0], regWrite);
    and (regLDHigh[1], regLoad[1], regWrite);
    and (regLDHigh[2], regLoad[2], regWrite);
    and (regLDHigh[3], regLoad[3], regWrite);
    and (regLDHigh[4], regLoad[4], regWrite);
    and (regLDHigh[5], regLoad[5], regWrite);
    and (regLDHigh[6], regLoad[6], regWrite);
    and (regLDHigh[7], regLoad[7], regWrite);
    and (regLDHigh[8], regLoad[8], regWrite);
    and (regLDHigh[9], regLoad[9], regWrite);
    and (regLDHigh[10], regLoad[10], regWrite);
    and (regLDHigh[11], regLoad[11], regWrite);
    and (regLDHigh[12], regLoad[12], regWrite);
    and (regLDHigh[13], regLoad[13], regWrite);
    and (regLDHigh[14], regLoad[14], regWrite);
    and (regLDHigh[15], regLoad[15], regWrite);
    and (regLDHigh[16], regLoad[16], regWrite);
    and (regLDHigh[17], regLoad[17], regWrite);
    and (regLDHigh[18], regLoad[18], regWrite);
    and (regLDHigh[19], regLoad[19], regWrite);
    and (regLDHigh[20], regLoad[20], regWrite);
    and (regLDHigh[21], regLoad[21], regWrite);
    and (regLDHigh[22], regLoad[22], regWrite);
    and (regLDHigh[23], regLoad[23], regWrite);
    and (regLDHigh[24], regLoad[24], regWrite);
    and (regLDHigh[25], regLoad[25], regWrite);
    and (regLDHigh[26], regLoad[26], regWrite);
    and (regLDHigh[27], regLoad[27], regWrite);
    and (regLDHigh[28], regLoad[28], regWrite);
    and (regLDHigh[29], regLoad[29], regWrite);
    and (regLDHigh[30], regLoad[30], regWrite);
    and (regLDHigh[31], regLoad[31], regWrite);
    
    reg32 reg0(.clk(clk),.LD(1'b0),.reset(rst),.datain(WriteData),.Initial(32'h0000_0000),.dataout(In1));
    reg32 reg1(.clk(clk),.LD(regLoad[1]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0006),.dataout(In2));
    reg32 reg2(.clk(clk),.LD(regLoad[2]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0007),.dataout(In3));
    reg32 reg3(.clk(clk),.LD(regLoad[3]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0008),.dataout(In4));
    reg32 reg4(.clk(clk),.LD(regLoad[4]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0009),.dataout(In5));
    reg32 reg5(.clk(clk),.LD(regLoad[5]),.reset(rst),.datain(WriteData),.Initial(32'h0000_000a),.dataout(In6));
    reg32 reg6(.clk(clk),.LD(regLoad[6]),.reset(rst),.datain(WriteData),.Initial(32'h0000_000b),.dataout(In7));
    reg32 reg7(.clk(clk),.LD(regLoad[7]),.reset(rst),.datain(WriteData),.Initial(32'h0000_000c),.dataout(In8));
    reg32 reg8(.clk(clk),.LD(regLoad[8]),.reset(rst),.datain(WriteData),.Initial(32'h0000_000d),.dataout(In9));
    reg32 reg9(.clk(clk),.LD(regLoad[9]),.reset(rst),.datain(WriteData),.Initial(32'h0000_000e),.dataout(In10));
    reg32 reg10(.clk(clk),.LD(regLoad[10]),.reset(rst),.datain(WriteData),.Initial(32'h0000_000f),.dataout(In11));
    reg32 reg11(.clk(clk),.LD(regLoad[11]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0010),.dataout(In12));
    reg32 reg12(.clk(clk),.LD(regLoad[12]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0011),.dataout(In13));
    reg32 reg13(.clk(clk),.LD(regLoad[13]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0012),.dataout(In14));
    reg32 reg14(.clk(clk),.LD(regLoad[14]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0013),.dataout(In15));
    reg32 reg15(.clk(clk),.LD(regLoad[15]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0014),.dataout(In16));
    reg32 reg16(.clk(clk),.LD(regLoad[16]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0015),.dataout(In17));
    reg32 reg17(.clk(clk),.LD(regLoad[17]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0016),.dataout(In18));
    reg32 reg18(.clk(clk),.LD(regLoad[18]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0017),.dataout(In19));
    reg32 reg19(.clk(clk),.LD(regLoad[19]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0018),.dataout(In20));
    reg32 reg20(.clk(clk),.LD(regLoad[20]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0019),.dataout(In21));
    reg32 reg21(.clk(clk),.LD(regLoad[21]),.reset(rst),.datain(WriteData),.Initial(32'h0000_001a),.dataout(In22));
    reg32 reg22(.clk(clk),.LD(regLoad[22]),.reset(rst),.datain(WriteData),.Initial(32'h0000_001b),.dataout(In23));
    reg32 reg23(.clk(clk),.LD(regLoad[23]),.reset(rst),.datain(WriteData),.Initial(32'h0000_001c),.dataout(In24));
    reg32 reg24(.clk(clk),.LD(regLoad[24]),.reset(rst),.datain(WriteData),.Initial(32'h0000_001d),.dataout(In25));
    reg32 reg25(.clk(clk),.LD(regLoad[25]),.reset(rst),.datain(WriteData),.Initial(32'h0000_001e),.dataout(In26));
    reg32 reg26(.clk(clk),.LD(regLoad[26]),.reset(rst),.datain(WriteData),.Initial(32'h0000_001f),.dataout(In27));
    reg32 reg27(.clk(clk),.LD(regLoad[27]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0020),.dataout(In28));
    reg32 reg28(.clk(clk),.LD(regLoad[28]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0021),.dataout(In29));
    reg32 reg29(.clk(clk),.LD(regLoad[29]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0022),.dataout(In30));
    reg32 reg30(.clk(clk),.LD(regLoad[30]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0023),.dataout(In31));
    reg32 reg31(.clk(clk),.LD(regLoad[31]),.reset(rst),.datain(WriteData),.Initial(32'h0000_0024),.dataout(In32));
    
    Mux32to1 ReadDataMux1(
    .In1(In1), .In2(In2), .In3(In3), .In4(In4), .In5(In5), 
    .In6(In6), .In7(In7), .In8(In8), .In9(In9), .In10(In10), .In11(In11), .In12(In12),
    .In13(In13), .In14(In14), .In15(In15), .In16(In16), .In17(In17), .In18(In18), .In19(In19),
    .In20(In20), .In21(In21), .In22(In22), .In23(In23), .In24(In24), .In25(In25), .In26(In26), .In27(In27),
    .In28(In28), .In29(In29), .In30(In30), .In31(In31), .In32(In32),
    .Sel(ReadReg1),
    .Out(ReadData1)
    );
    
    Mux32to1 ReadDataMux2(
    .In1(In1), .In2(In2), .In3(In3), .In4(In4), .In5(In5), 
    .In6(In6), .In7(In7), .In8(In8), .In9(In9), .In10(In10), .In11(In11), .In12(In12),
    .In13(In13), .In14(In14), .In15(In15), .In16(In16), .In17(In17), .In18(In18), .In19(In19),
    .In20(In20), .In21(In21), .In22(In22), .In23(In23), .In24(In24), .In25(In25), .In26(In26), .In27(In27),
    .In28(In28), .In29(In29), .In30(In30), .In31(In31), .In32(In32),
    .Sel(ReadReg2),
    .Out(ReadData2)
    );
    
    
endmodule