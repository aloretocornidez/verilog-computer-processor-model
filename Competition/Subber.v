`timescale 1ns / 1ps

module Subber(inA, inB, out);
    input [31:0] inA;
    input [31:0] inB; 

    output reg [31:0] out; 
    always @ (*) begin
        if(inA >= inB) begin
            out <= inA - inB;
        end
        else begin
            out <= inB - inA;
        end
    end

endmodule