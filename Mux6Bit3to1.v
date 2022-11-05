`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2021 05:04:05 PM
// Design Name: 
// Module Name: Mux6Bit3to1
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


module Mux6Bit3to1(inA, inB, inC, sel,out);
input [5:0] inA; 
input [5:0] inB;
input [5:0] inC;

input sel; 

output reg [5:0] out; 

always @ (*)
if (sel == 00) begin
out <= inA;
end

else if (sel == 01) begin
out <= inB;
end

else if(sel == 10) begin
out <= inC;
end




endmodule
