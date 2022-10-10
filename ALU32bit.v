`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #2
//
// Create Date: 05/31/2022
// File Name: ALU32bit.v
//
// full 32-bit Arithmatic Logic Unit
//////////////////////////////////////////////////////////////////////////////////


module ALU32bit(
    input [3:0]ALUctl,
    input [31:0] A, B,
    // no carry in for this one 
    
    output [31:0] carryOut,
    output Zero,
    output [31:0] result,
    output carryFlag,
    output overflowFlag
    );

    wire orOut;

    ALU alu1(.a(A[0]),.b(B[0]),.CarryIn(ALUctl[2]), .ALUop(ALUctl),.Result(result[0]),.CarryOut(carryOut[0]));    // 1
    ALU alu2(.a(A[1]),.b(B[1]),.CarryIn(carryOut[0]), .ALUop(ALUctl),.Result(result[1]),.CarryOut(carryOut[1]));    // 2
    ALU alu3(.a(A[2]),.b(B[2]),.CarryIn(carryOut[1]), .ALUop(ALUctl),.Result(result[2]),.CarryOut(carryOut[2]));    // 3
    ALU alu4(.a(A[3]),.b(B[3]),.CarryIn(carryOut[2]), .ALUop(ALUctl),.Result(result[3]),.CarryOut(carryOut[3]));    // 4
    ALU alu5(.a(A[4]),.b(B[4]),.CarryIn(carryOut[3]), .ALUop(ALUctl),.Result(result[4]),.CarryOut(carryOut[4]));    // 5
    ALU alu6(.a(A[5]),.b(B[5]),.CarryIn(carryOut[4]), .ALUop(ALUctl),.Result(result[5]),.CarryOut(carryOut[5]));    // 6
    ALU alu7(.a(A[6]),.b(B[6]),.CarryIn(carryOut[5]), .ALUop(ALUctl),.Result(result[6]),.CarryOut(carryOut[6]));    // 7
    ALU alu8(.a(A[7]),.b(B[7]),.CarryIn(carryOut[6]), .ALUop(ALUctl),.Result(result[7]),.CarryOut(carryOut[7]));    // 8
    ALU alu9(.a(A[8]),.b(B[8]),.CarryIn(carryOut[7]), .ALUop(ALUctl),.Result(result[8]),.CarryOut(carryOut[8]));    // 9
    ALU alu10(.a(A[9]),.b(B[9]),.CarryIn(carryOut[8]), .ALUop(ALUctl),.Result(result[9]),.CarryOut(carryOut[9]));    // 10
    ALU alu11(.a(A[10]),.b(B[10]),.CarryIn(carryOut[9]), .ALUop(ALUctl),.Result(result[10]),.CarryOut(carryOut[10]));    // 11
    ALU alu12(.a(A[11]),.b(B[11]),.CarryIn(carryOut[10]), .ALUop(ALUctl),.Result(result[11]),.CarryOut(carryOut[11]));    // 12
    ALU alu13(.a(A[12]),.b(B[12]),.CarryIn(carryOut[11]), .ALUop(ALUctl),.Result(result[12]),.CarryOut(carryOut[12]));    // 13
    ALU alu14(.a(A[13]),.b(B[13]),.CarryIn(carryOut[12]), .ALUop(ALUctl),.Result(result[13]),.CarryOut(carryOut[13]));    // 14
    ALU alu15(.a(A[14]),.b(B[14]),.CarryIn(carryOut[13]), .ALUop(ALUctl),.Result(result[14]),.CarryOut(carryOut[14]));    // 15
    ALU alu16(.a(A[15]),.b(B[15]),.CarryIn(carryOut[14]), .ALUop(ALUctl),.Result(result[15]),.CarryOut(carryOut[15]));    // 16
    ALU alu17(.a(A[16]),.b(B[16]),.CarryIn(carryOut[15]), .ALUop(ALUctl),.Result(result[16]),.CarryOut(carryOut[16]));    // 17
    ALU alu18(.a(A[17]),.b(B[17]),.CarryIn(carryOut[16]), .ALUop(ALUctl),.Result(result[17]),.CarryOut(carryOut[17]));    // 18
    ALU alu19(.a(A[18]),.b(B[18]),.CarryIn(carryOut[17]), .ALUop(ALUctl),.Result(result[18]),.CarryOut(carryOut[18]));    // 19
    ALU alu20(.a(A[19]),.b(B[19]),.CarryIn(carryOut[18]), .ALUop(ALUctl),.Result(result[19]),.CarryOut(carryOut[19]));    // 20
    ALU alu21(.a(A[20]),.b(B[20]),.CarryIn(carryOut[19]), .ALUop(ALUctl),.Result(result[20]),.CarryOut(carryOut[20]));    // 21
    ALU alu22(.a(A[21]),.b(B[21]),.CarryIn(carryOut[20]), .ALUop(ALUctl),.Result(result[21]),.CarryOut(carryOut[21]));    // 22
    ALU alu23(.a(A[22]),.b(B[22]),.CarryIn(carryOut[21]), .ALUop(ALUctl),.Result(result[22]),.CarryOut(carryOut[22]));    // 23
    ALU alu24(.a(A[23]),.b(B[23]),.CarryIn(carryOut[22]), .ALUop(ALUctl),.Result(result[23]),.CarryOut(carryOut[23]));    // 24
    ALU alu25(.a(A[24]),.b(B[24]),.CarryIn(carryOut[23]), .ALUop(ALUctl),.Result(result[24]),.CarryOut(carryOut[24]));    // 25
    ALU alu26(.a(A[25]),.b(B[25]),.CarryIn(carryOut[24]), .ALUop(ALUctl),.Result(result[25]),.CarryOut(carryOut[25]));    // 26
    ALU alu27(.a(A[26]),.b(B[26]),.CarryIn(carryOut[25]), .ALUop(ALUctl),.Result(result[26]),.CarryOut(carryOut[26]));    // 27
    ALU alu28(.a(A[27]),.b(B[27]),.CarryIn(carryOut[26]), .ALUop(ALUctl),.Result(result[27]),.CarryOut(carryOut[27]));    // 28
    ALU alu29(.a(A[28]),.b(B[28]),.CarryIn(carryOut[27]), .ALUop(ALUctl),.Result(result[28]),.CarryOut(carryOut[28]));    // 29
    ALU alu30(.a(A[29]),.b(B[29]),.CarryIn(carryOut[28]), .ALUop(ALUctl),.Result(result[29]),.CarryOut(carryOut[29]));    // 30
    ALU alu31(.a(A[30]),.b(B[30]),.CarryIn(carryOut[29]), .ALUop(ALUctl),.Result(result[30]),.CarryOut(carryOut[30]));    // 31
    ALU alu32(.a(A[31]),.b(B[31]),.CarryIn(carryOut[30]), .ALUop(ALUctl),.Result(result[31]),.CarryOut(carryOut[31]));    // 32
    
    or (orOut, result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15],result[16],result[17],result[18],result[19],
        result[20],result[21],result[22],result[23],result[24],result[25],result[26],result[27],result[28],result[29],result[30],result[31]);
    not (Zero, orOut);
    xor (overflowFlag ,carryOut[30], carryOut[31]);
    assign carryFlag = carryOut[31];
endmodule
