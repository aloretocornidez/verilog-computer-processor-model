`timescale 1ns / 1ps

module SadRegister(
RegWrite,
Clk,
Reset,

WriteData0,
WriteData1,
WriteData2,
WriteData3,
WriteData4,
WriteData5,
WriteData6,
WriteData7,
WriteData8,
WriteData9,
WriteData10,
WriteData11,
WriteData12,
WriteData13,
WriteData14,
WriteData15,

OutWindowRegister0,
OutWindowRegister1,
OutWindowRegister2,
OutWindowRegister3,
OutWindowRegister4,
OutWindowRegister5,
OutWindowRegister6,
OutWindowRegister7,
OutWindowRegister8,
OutWindowRegister9,
OutWindowRegister10,
OutWindowRegister11,
OutWindowRegister12,
OutWindowRegister13,
OutWindowRegister14,
OutWindowRegister15,

OutFrameRegister0,
OutFrameRegister1,
OutFrameRegister2,
OutFrameRegister3,
OutFrameRegister4,
OutFrameRegister5,
OutFrameRegister6,
OutFrameRegister7,
OutFrameRegister8,
OutFrameRegister9,
OutFrameRegister10,
OutFrameRegister11,
OutFrameRegister12,
OutFrameRegister13,
OutFrameRegister14,
OutFrameRegister15

);

    input [31:0] WriteData0;
    input [31:0] WriteData1;
    input [31:0] WriteData2;
    input [31:0] WriteData3;
    input [31:0] WriteData4;
    input [31:0] WriteData5;
    input [31:0] WriteData6;
    input [31:0] WriteData7;
    input [31:0] WriteData8;
    input [31:0] WriteData9;
    input [31:0] WriteData10;
    input [31:0] WriteData11;
    input [31:0] WriteData12;
    input [31:0] WriteData13;
    input [31:0] WriteData14;
    input [31:0] WriteData15;

    output reg [31:0] OutWindowRegister0;
    output reg [31:0] OutWindowRegister1;
    output reg [31:0] OutWindowRegister2;
    output reg [31:0] OutWindowRegister3;
    output reg [31:0] OutWindowRegister4;
    output reg [31:0] OutWindowRegister5;
    output reg [31:0] OutWindowRegister6;
    output reg [31:0] OutWindowRegister7;
    output reg [31:0] OutWindowRegister8;
    output reg [31:0] OutWindowRegister9;
    output reg [31:0] OutWindowRegister10;
    output reg [31:0] OutWindowRegister11;
    output reg [31:0] OutWindowRegister12;
    output reg [31:0] OutWindowRegister13;
    output reg [31:0] OutWindowRegister14;
    output reg [31:0] OutWindowRegister15;
    
    output reg [31:0] OutFrameRegister0;
    output reg [31:0] OutFrameRegister1;
    output reg [31:0] OutFrameRegister2;
    output reg [31:0] OutFrameRegister3;
    output reg [31:0] OutFrameRegister4;
    output reg [31:0] OutFrameRegister5;
    output reg [31:0] OutFrameRegister6;
    output reg [31:0] OutFrameRegister7;
    output reg [31:0] OutFrameRegister8;
    output reg [31:0] OutFrameRegister9;
    output reg [31:0] OutFrameRegister10;
    output reg [31:0] OutFrameRegister11;
    output reg [31:0] OutFrameRegister12;
    output reg [31:0] OutFrameRegister13;
    output reg [31:0] OutFrameRegister14;
    output reg [31:0] OutFrameRegister15;
    
    input [1:0] RegWrite;
    input Clk;
    input Reset;
    
    integer i;

    reg [31:0] registers[31:0];

    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            registers[i] <= 32'b0;
        end
 
    end

	always @(*) begin//every time a new posedge of clock is hit, execute inner loop.
	
        OutWindowRegister0 <= registers[0];
        OutWindowRegister1 <= registers[1];
        OutWindowRegister2 <= registers[2];
        OutWindowRegister3 <= registers[3];
        OutWindowRegister4 <= registers[4];
        OutWindowRegister5 <= registers[5];
        OutWindowRegister6 <= registers[6];
        OutWindowRegister7 <= registers[7];
        OutWindowRegister8 <= registers[8];
        OutWindowRegister9 <= registers[9];
        OutWindowRegister10 <= registers[10];
        OutWindowRegister11 <= registers[11];
        OutWindowRegister12 <= registers[12];
        OutWindowRegister13 <= registers[13];
        OutWindowRegister14 <= registers[14];
        OutWindowRegister15 <= registers[15];
	
        OutFrameRegister0 <= registers[16];
        OutFrameRegister1 <= registers[17];
        OutFrameRegister2 <= registers[18];
        OutFrameRegister3 <= registers[19];
        OutFrameRegister4 <= registers[20];
        OutFrameRegister5 <= registers[21];
        OutFrameRegister6 <= registers[22];
        OutFrameRegister7 <= registers[23];
        OutFrameRegister8 <= registers[24];
        OutFrameRegister9 <= registers[25];
        OutFrameRegister10 <= registers[26];
        OutFrameRegister11 <= registers[27];
        OutFrameRegister12 <= registers[28];
        OutFrameRegister13 <= registers[29];
        OutFrameRegister14 <= registers[30];
        OutFrameRegister15 <= registers[31];

	end
	always @(negedge Clk) begin
	
        if (Reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end
        
        //Window values
	    else if(RegWrite == 2'b01) begin
	    
	       registers[0] <= WriteData0;
	       registers[1] <= WriteData1;
	       registers[2] <= WriteData2;
	       registers[3] <= WriteData3;
	       registers[4] <= WriteData4;
	       registers[5] <= WriteData5;
	       registers[6] <= WriteData6;
	       registers[7] <= WriteData7;
	       registers[8] <= WriteData8;
	       registers[9] <= WriteData9;
	       registers[10] <= WriteData10;
	       registers[11] <= WriteData11;
	       registers[12] <= WriteData12;
	       registers[13] <= WriteData13;
	       registers[14] <= WriteData14;
	       registers[15] <= WriteData15;
	    end
	    
	    //Frame values
	    else if(RegWrite == 2'b11) begin
	    
	       registers[16] <= WriteData0;
	       registers[17] <= WriteData1;
	       registers[18] <= WriteData2;
	       registers[19] <= WriteData3;
	       registers[20] <= WriteData4;
	       registers[21] <= WriteData5;
	       registers[22] <= WriteData6;
	       registers[23] <= WriteData7;
	       registers[24] <= WriteData8;
	       registers[25] <= WriteData9;
	       registers[26] <= WriteData10;
	       registers[27] <= WriteData11;
	       registers[28] <= WriteData12;
	       registers[29] <= WriteData13;
	       registers[30] <= WriteData14;
	       registers[31] <= WriteData15;

	       
	   end
	   
	end

endmodule
