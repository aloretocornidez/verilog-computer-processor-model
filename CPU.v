`timescale 1ns / 1ps
//mani 33
//chris 33
//haseeb 33
//ali akolgu .9

module CPU(Clk, Reset, out7, en_out);

    input Clk;
    input Reset;
    output [6:0] out7;
    output [7:0] en_out;

    wire [31:0] v0;
    wire [31:0] v1;

    wire ClkOut;
//ClkDiv(Clk, Rst, ClkOut);
    ClkDiv c1(.Clk(Clk), .Rst(Reset), .ClkOut(ClkOut));
    //module TopLevel(Clk, Rst, PC, WB);
    TopLevel TL(.Clk(ClkOut), .Rst(Reset), .v0(v0), .v1(v1));
    //module Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
    Two4DigitDisplay Seg(.Clk(Clk), .NumberA(v0[15:0]),.NumberB( v1[15:0]), .out7(out7), .en_out(en_out));


endmodule
