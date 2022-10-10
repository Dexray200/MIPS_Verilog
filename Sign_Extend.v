`timescale 1ns / 1ps



module Sign_Extend(
    input [15:0] in,
    input clk,
    output reg [31:0] out
    );
    always @(posedge clk)
        begin
            out <= $signed(in);
        end
endmodule
