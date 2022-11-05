`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 01:45:02 AM
// Design Name: 
// Module Name: sadMemoryMux
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


module sadMemoryMux(
 address, 
 inA,
 inB, 
 sel,
 outReg
 
    );
    
    input [31:0]address;  // Reg a1 
    input [31:0]inA;// Number of mux 
    input [31:0]inB; // offSet for s7 
    input sel;
    output reg [31:0] outReg;
    
    always@ (*) begin
    
    if (sel) begin
    outReg <= address + inB; 
    end
    else begin
    outReg <= address + inA;
    end
    
    end
    
endmodule
