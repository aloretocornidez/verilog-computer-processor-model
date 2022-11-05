`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/
module Adder_32Bit(
    inA,
    inB,
    out
    );
    
    input [31:0]inA;
    input [31:0]inB;
    output reg [31:0]out;
    
    
    always @(*)
    begin
    
        out <= inA + inB;
    
    end

    
endmodule
