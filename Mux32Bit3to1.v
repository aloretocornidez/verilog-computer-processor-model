`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2021 04:24:32 PM
// Design Name: 
// Module Name: Mux32Bit3to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux32Bit3to1(inA, inB, inC, sel, out);
input [31:0] inA; 
input [31:0] inB; 
input [31:0] inC;
input [1:0] sel; 

output reg [31:0]out; 
 
 always @ (*)   
    if (sel == 00) begin
    
    out <= inA; 
    
    end
    else if (sel == 01)begin 
    out <= inB; 
    end
    else if (sel == 10) begin
    
    out <= inC;
    end
    
endmodule
