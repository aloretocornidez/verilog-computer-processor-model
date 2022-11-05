`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux_PC(
    out,
    inA,
    inB,
    sel
    );

    output reg [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input sel;

    always @(*)begin 
    
        if (sel == 1) begin 
            out <= inB;
        end
        else begin
            out <= inA;
        end
    
    end

endmodule
