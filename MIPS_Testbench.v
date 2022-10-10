`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #5
//
// Create Date: 06/23/2022
// File Name: MIPS_Testbench.v
//
// Testbench for pipelined processor with a fixed sequance 2 with no-ops
//////////////////////////////////////////////////////////////////////////////////


module MIPS_Testbench;
  reg CLK,RST;
  reg [31:0] INST;  //inputs for circuit
  
  wire [31:0] WriteData;



MIPS_CPU cpu(
    .rst(RST),
    .clk(CLK),
    .inst(INST),
    .WriteData(WriteData)
    );
    // Single Cycle Sequance:
    // Sequance #1 works for both
    initial begin
          RST = 0;
          CLK = 0;
          #1 CLK = 1;
          #1 CLK = 0;
          #1 RST = 1;
          repeat (128)
          #5 CLK = ~CLK;
          
          
          
          
//          INST = 32'b000000_00010_00011_00001_00000_100000; //R1 = R2 + R3;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          //INST = 32'b000000_00101_00110_00100_00000_100010; //R4 = R5 - R6;
//          INST = 32'b000000_00001_00110_00100_00000_100010; 
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          //INST = 32'b000000_01000_01001_00111_00000_100100; //R7 = R8 AND R9;
//          INST = 32'b000000_00001_00100_00111_00000_100100;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          //INST = 32'b000000_00001_01100_01010_00000_100101; //R10 = R1 OR R12;
//          INST = 32'b000000_00111_00111_01010_00000_100101;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          //INST = 32'b000000_00100_10001_10000_00000_101010; //R16 = R4 NOR R17;
//          INST = 32'b000000_01010_00100_10000_00000_101010;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          CLK = 1;
//          #5
        $finish;
    end


//    // Pipelined sequance #2
//    initial begin
//          RST = 0;
//          CLK = 0;
//          #1 CLK = 1;
//          #1 CLK = 0;
//          #1 RST = 1;
//          INST = 32'b000000_00010_00011_00001_00000_100000; //R1 = R2 + R3;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          INST = 32'b000000_00000_00000_00000_00000_100000;
//          CLK = 1;
//          #5 
//          CLK = 0;
//          #5
//          INST = 32'b000000_00001_00110_00100_00000_100010; 
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          INST = 32'b000000_00000_00000_00000_00000_100000;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          INST = 32'b000000_00001_00100_00111_00000_100100;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          INST = 32'b000000_00000_00000_00000_00000_100000;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          INST = 32'b000000_00111_00111_01010_00000_100101;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          INST = 32'b000000_00000_00000_00000_00000_100000;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          INST = 32'b000000_01010_00100_10000_00000_101010;
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          CLK = 1;
//          #5
//          CLK = 0;
//          #5
//          CLK = 1;
//          #5
//        $finish;
//    end
    
endmodule