`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/

module Add4_32Bit(
    in, out
    );
    
    input [31:0] in;
    output reg [31:0] out;
    
    
    
    
    always @(*)
    begin
    
    out <= in + 32'h4;
    
    end
    
endmodule
