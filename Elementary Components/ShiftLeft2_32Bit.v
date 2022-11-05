`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Group Members: Alan Manuel Loreto Cornidez, Haseeb Sarwar Irfan, Chris William Bremser
// Effort: 1/3 each
// Module - ShiftLeft2.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module ShiftLeft2_32Bit(in, out);

    /* A 16-Bit input word */
    input [31:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    

    always @(*)
    begin
        out <= in << 2;
    end
    


endmodule
