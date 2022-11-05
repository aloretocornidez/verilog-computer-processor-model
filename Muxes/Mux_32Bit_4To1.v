`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 4 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux_32Bit_4To1(out, inA, inB, inC, inD, select);

    output reg [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input [31:0] inD;
    input [1:0]select;

    always @(*)begin 
    
        case (select)
        
            4'b00:
            begin
                out <= inA;
            end

            4'b01:
            begin
                out <= inB;
            end

            4'b10:
            begin
                out <= inC;
            end

            4'b11:
            begin
                out <= inD;
            end

        endcase

    end

endmodule
