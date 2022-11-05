`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Bremser Irfan Cornidez Industries
// Engineer: 
// Christopher W Bremser 33%
// Haseeb Irfan 33%
// Alan Manuel Loreto Cornidez 33%
// Ali Akoglu 1% 
// Create Date: 10/20/2021 05:10:59 PM
// Design Name: 
// Module Name: adder_subber
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


module adder_subber(inA, inB, sel, out);
input [63:0] inA;
input [63:0] inB; 
input sel; 

output reg [63:0] out; 
always @ (*)

if (sel == 1)begin
    out <= inA + inB; 
end

else if (sel == 0) begin
    out <= inA - inB;
end

endmodule
