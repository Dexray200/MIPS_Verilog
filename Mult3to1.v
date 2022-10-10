//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #1
//
// Create Date: 05/23/2022
// File Name: Multi3to1.v
//
// 4 to 1 Mux for 1 bit ALU, added transfer b function
//////////////////////////////////////////////////////////////////////////////////
module Mult3to1 (In1, In2, In3,In4, Sel, Out);
  input In1, In2, In3, In4;
  input [1:0] Sel;
  output reg Out;

  always @(In1, In2, In3,In4, Sel)
    case(Sel)
      0: Out <= In1;
      1: Out <= In2;
      2: Out <= In3;
      3: Out <= In4;
    endcase
endmodule