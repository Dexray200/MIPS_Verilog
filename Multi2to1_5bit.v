`timescale 1ns / 1ps



module Multi2to1_5bit(In1, In2, Sel, Out);
  input  [4:0]In1, In2;
  input  Sel;
  output reg [4:0] Out;

  always @(In1, In2, Sel)
    case(Sel)
      0: Out <= In1;
      1: Out <= In2;
    endcase
endmodule
