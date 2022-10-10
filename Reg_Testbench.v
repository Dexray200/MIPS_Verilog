`timescale 1ns / 1ps


module Reg_Testbench;
  reg CLK,RST;
  reg [31:0] INST;  //inputs for circuit
  reg regWrite;
  reg [31:0]WriteData;
  
  wire [31:0] ReadData1;
  wire [31:0] ReadData2;
  
  Register_Bank Registers(
    .ReadReg1(INST[25:21]),
    .ReadReg2(INST[20:16]),
    .WriteReg(INST[15:11]),
    .regWrite(regWrite),
    .WriteData(WriteData),
    .clk(CLK),
    .rst(RST),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2)
);

    initial begin
          RST = 0;
          CLK = 0;
          INST = 32'b000000_00010_00011_00001_00000_100000; //R1 = R2 + R3;
          WriteData = 32'h0000_0007 + 32'h0000_0008;
          #3 CLK = 1;
          #3 CLK = 0;
          #4 RST = 1;
          regWrite = 1;
          #5
          CLK = 1;
          #5
          CLK = 0;
          regWrite = 0;
          #5
          INST = 32'b000000_00101_00110_00100_00000_100010; //R5 = R5 - R6;
          CLK = 1;
          regWrite = 1;
          #5
          CLK = 0;
          regWrite = 0;
          #5
          INST = 32'b000000_01000_01001_00111_00000_100100; //R7 = R8 AND R9;
          CLK = 1;
          regWrite = 1;
          #5
          CLK = 0;
          regWrite = 0;
          #5
          INST = 32'b000000_00001_01100_01010_00000_101001; //R10 = R1 OR R12;
          CLK = 1;
          regWrite = 1;
          #5
          CLK = 0;
          #5
          INST = 32'b000000_00100_10001_10000_00000_101010; //R16 = R4 NOR R17;
          CLK = 1;
          regWrite = 1;
          #5
          CLK = 0;
          regWrite = 0;
          #5
          CLK = 1;
        $finish;
    end
endmodule
    

