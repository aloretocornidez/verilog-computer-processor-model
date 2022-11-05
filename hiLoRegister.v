`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
Lab Group Names:
Alan Loreto Cornidez 33%
Chris W Bremser 33%
Haseeb Irfan 33%
*/ 
//////////////////////////////////////////////////////////////////////////////////


module hiLoRegister(
        dataIn, dataOut, WriteEnable, Clk, Reset 
    );

input [31:0]dataIn;
output reg[31:0] dataOut;
input WriteEnable;
input Clk;
input Reset;


always @(posedge Clk)
begin
    if (Reset) begin
        dataOut <= 0;
    end
    else if(WriteEnable == 1) begin
        dataOut <= dataIn;
    end
end


endmodule
