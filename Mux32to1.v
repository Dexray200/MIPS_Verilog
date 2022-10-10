`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #4
//
// Create Date: 06/16/2022
// File Name: Mux32to1.v
//
// 32bit 32 to 1 Mux for the Register Bank
//////////////////////////////////////////////////////////////////////////////////

module Mux32to1(
    input [31:0] In1, In2, In3, In4, In5, 
    In6, In7, In8, In9, In10, In11, In12,
    In13, In14, In15, In16, In17, In18, In19,
    In20, In21, In22, In23, In24, In25, In26, In27,
    In28, In29, In30, In31, In32,
    input [4:0] Sel,
    output reg [31:0] Out
    );
    // Select any input from 5 bit address
    always @(In1, In2, In3, In4, In5, 
    In6, In7, In8, In9, In10, In11, In12,
    In13, In14, In15, In16, In17, In18, In19,
    In20, In21, In22, In23, In24, In25, In26,
    In28, In29, In30, In31, In32, Sel)
        case(Sel)
            5'b00000:Out <= In1;
            5'b00001:Out <= In2;
            5'b00010:Out <= In3;
            5'b00011:Out <= In4;
            5'b00100:Out <= In5;
            5'b00101:Out <= In6;
            5'b00110:Out <= In7;
            5'b00111:Out <= In8;
            5'b01000:Out <= In9;
            5'b01001:Out <= In10;
            5'b01010:Out <= In11;
            5'b01011:Out <= In12;
            5'b01100:Out <= In13;
            5'b01101:Out <= In14;
            5'b01110:Out <= In15;
            5'b01111:Out <= In16;
            5'b10000:Out <= In17;
            5'b10001:Out <= In18;
            5'b10010:Out <= In19;
            5'b10011:Out <= In20;
            5'b10100:Out <= In21;
            5'b10101:Out <= In22;
            5'b10110:Out <= In23;
            5'b10111:Out <= In24;
            5'b11000:Out <= In25;
            5'b11001:Out <= In26;
            5'b11010:Out <= In27;
            5'b11011:Out <= In28;
            5'b11100:Out <= In29;
            5'b11101:Out <= In30;
            5'b11110:Out <= In31;
            5'b11111:Out <= In32;
        endcase
endmodule
