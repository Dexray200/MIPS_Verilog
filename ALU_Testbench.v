//////////////////////////////////////////////////////////////////////////////////
// Dexter Elmendorf
// Class:
// ECE 483 Lab #1
//
// Create Date: 05/23/2022
// File Name: ALU_Testbench.v
//
// Testing of all inputs and operating modes of the ALU
//////////////////////////////////////////////////////////////////////////////////

module ALU_Testbench();
    reg [31:0] a;
    reg [31:0] b;
    
    reg [3:0] aluop;
    wire [31:0] Result;
    wire zero;
    wire carryoutFlag;
    wire overflow;
    wire [31:0] CarryOut;
    ALU32bit alu32(
        .ALUctl(aluop),
        .A(a),
        .B(b),
        .result(Result),
        .carryOut(CarryOut),
        .Zero(zero),
        .carryFlag(carryoutFlag),
        .overflowFlag(overflow)
    );

	initial begin
        $dumpvars;
        a = 32'h01010_f00c;
        b = 32'h040f_0e0c;
        aluop = 4'b0000;
        #5
        aluop = 4'b1101;
        #5
        aluop = 4'b0001;
        #5
        aluop = 4'b1100;
        #5
        a = 32'hffff_fffe;
        b = 32'h1000_0001;
        aluop = 4'b0010;
        #5
        a = 32'h0fff_ffff;
        b = 32'h0000_0004;
        aluop = 4'b0110;
        #5
        aluop = 4'b0011;
        #5
        aluop = 4'b0110;
        a = 32'h0fff_fffb;
        b = 32'hffff_fffe;
        #5
        aluop = 4'b0011;
        #5
        $finish;
    end
endmodulede