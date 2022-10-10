//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #1
//
// Create Date: 05/23/2022
// File Name: Adder.v
//
// Adder made for 1-bit ALU. Adder is done behaviorly
//////////////////////////////////////////////////////////////////////////////////
module adder (
    input a,
    input b,
    input CarryIn,
    output Sum,
    output CarryOut
);
  assign CarryOut = (b*CarryIn) + (a*CarryIn)+(a*b); // Carry out calculation
  assign Sum = (a*(~b)*(~CarryIn))+((~a)*b*(~CarryIn))+((~a)*(~b)*CarryIn)+(a*b*CarryIn); // Sum calculation
  
endmodule