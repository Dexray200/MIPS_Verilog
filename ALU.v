//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #1
//
// Create Date: 05/23/2022
// File Name: ALU.v
//
// 1-bit Arithmatic Logic Unit used to create the 32-bit ALU 
//////////////////////////////////////////////////////////////////////////////////
module ALU (
  input wire [3:0]ALUop,  
  input a,
  input b,

  input CarryIn,
  output CarryOut,
  output Result
);
// Important wire declares
wire Ainvert, Binvert;
wire [1:0] Operation;
wire aNot;
wire bNot;
wire andOut;
wire orOut;
wire addOut;
wire muxOuta;
wire muxOutb;

// Combine the operation variables together to set 
// operation with one four bit command
assign {Ainvert, Binvert, Operation} = ALUop;

Mult2to1 muxA ( // MUX for A input
  .In1 (a),
  .In2 (aNot),
  .Sel (Ainvert),
  .Out (muxOuta)
);

Mult2to1 muxB ( // MUX for B input
  .In1 (b),
  .In2 (bNot),
  .Sel (Binvert),
  .Out (muxOutb)
);
  
adder add( // Initalize the Adder
  .a (muxOuta),
  .b (muxOutb),
  .CarryIn (CarryIn),
  .Sum (addOut),
  .CarryOut (CarryOut)
);

Mult3to1 mux3 ( // 3-1 MUX to switch operation
  .In1 (andOut),
  .In2 (orOut),
  .In3 (addOut),
  .In4 (b),
  .Sel (Operation),
  .Out (Result)
);

// Standard cell gates declaration
not n1(aNot, a);
not n2(bNot, b);
and G1(andOut, muxOuta, muxOutb);
or G2(orOut, muxOuta, muxOutb);

endmodule