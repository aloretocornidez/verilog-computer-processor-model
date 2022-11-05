`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 05:15:16 PM
// Design Name: 
// Module Name: TopLevel_tb
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


module TopLevel_tb();
    reg Clk; 
    reg Reset;
    TopLevel t1(.Clk(Clk), .Rst(Reset));
    initial begin
    Clk <= 1'b1; 
    forever 
    #100 
    Clk <= ~Clk; 
    
 
    end


    initial begin
    
    Reset <= 1'b1;
    @(posedge Clk);
    @(posedge Clk);
    Reset <=0;
    end
endmodule
