//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #1
//
// Create Date: 05/23/2022
// File Name: Mult2to1.v
//
// 2 to 1 multiplexer for ALU
//////////////////////////////////////////////////////////////////////////////////
module Mult2to1 (In1, In2, Sel, Out);
  input  In1, In2;
  input  Sel;
  output reg  Out;

  always @(In1, In2, Sel)
    case(Sel)
      0: Out <= In1;
      1: Out <= In2;
    endcase
endmodule
  
  