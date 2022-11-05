`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2021 09:20:27 PM
// Design Name: 
// Module Name: CPU_tb
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


//Haseeb Irfan: 33% effort
//Chris Bremser: 33% effort
//Alan Manual Loreto Cornidez: 33% effort

module CPU_tb();

//module CPU(Clk, Reset, out7, en_out);

CPU CPUcomponent(.Clk(Clk), .Reset(Reset), .out7(out7), .en_out(en_out));

reg Clk;
reg Reset;
wire [6:0] out7;
wire [7:0] en_out;

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
