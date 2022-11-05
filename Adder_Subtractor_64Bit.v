`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/
module Adder_Subtractor_64Bit(
    inA,
    inB,
    out,
    control
    );
    
    input [63:0]inA;
    input [63:0]inB;
    input control;
    output reg [63:0]out;
    
    
    always @(*)
    begin
        if(control == 1)
        begin
            out <= inA + inB;    
        end
        else 
        begin
            out <= inA - inB;
        end
    
    end

    
endmodule
