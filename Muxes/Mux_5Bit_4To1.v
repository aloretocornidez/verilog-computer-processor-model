`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 4 2-Bit signals.
////////////////////////////////////////////////////////////////////////////////

module Mux_5Bit_4To1(out, inA, inB, inC, inD, select);

    
    input [4:0] inA;
    input [4:0] inB;
    input [4:0] inC;
    input [4:0] inD;
    input [1:0]select;

    output reg [4:0] out;
    
    
    always @(*)begin 
    
        case (select)
        
            2'b00:
            begin
                out <= inA;
            end

            2'b01:
            begin
                out <= inB;
            end

            2'b10:
            begin
                out <= inC;
            end

            2'b11:
            begin
                out <= inD;
            end

        endcase

    end

endmodule
