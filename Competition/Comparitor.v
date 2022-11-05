`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Competition: 
// Alan Manuel Loreto Cornidez 33%
// Christopher Bremser 33 %
// Haseeb Irfan 33%
// Ali Akoglu 1% 
// Lets Finish Strong!
//////////////////////////


module Comparitor(
sadAdderFinal,
minSad,
out

    );
    
    
    input [31:0] sadAdderFinal;
    input [31:0] minSad; 
    output reg [31:0]out;
    
    
    always@ (*) begin
    if (sadAdderFinal <=  minSad) begin
    
    out <= sadAdderFinal; 
    
    end
    else begin
    out <= minSad;
    end
    end
endmodule
