`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux1Bit2To1.v
// Description - Performs signal multiplexing between 2 1-Bit signals.
////////////////////////////////////////////////////////////////////////////////

module Mux_1Bit_2To1(out, inA, inB, select);

    
    input inA;
    input inB;
    input select;

    output reg out;
    
    
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
