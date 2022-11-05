`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 2-Bit signals.
////////////////////////////////////////////////////////////////////////////////

module Mux_5Bit_2To1(out, inA, inB, select);

    
    input [4:0] inA;
    input [4:0] inB;
    input select;

    output reg [4:0] out;
    
    
    always @(*)begin 
    
        case (select)
        
            1'b0:
            begin
                out <= inA;
            end

            1'b1:
            begin
                out <= inB;
            end


        endcase



    end

endmodule
