`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Group Two:  
// Chris W Bremser
// Alan Manuel Loreto Corindez
// Haseeb Irfan
// 33% of participation per person. 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

	initial begin

    ALUControl = 4'b0000; A = 32'd11; B = 32'd12;
    #10;
    ALUControl = 4'b0001; A = 32'd15; B = 32'd10;
    #10;
    ALUControl = 4'b0010; A = 32'd1; B = 32'd12;
    #10;
    ALUControl = 4'b0011; A = 32'd12; B = 32'd3;
    #10;
    ALUControl = 4'b0100; A = 32'd11; B = 32'd2;
    #10;
    ALUControl = 4'b0101; A = 32'd11; B = 32'd2; 
    #10;
    ALUControl = 4'b0110; A = 32'd11; B = 32'd2; 
    #10;
    ALUControl = 4'b0111; A = 32'd11; B = 32'd2;
    #10;
    ALUControl = 4'b1000; A = 32'd11; B = 32'd12;
    #10;
    ALUControl = 4'b1001; A = 32'd11; B = 32'd12;
    #10;
    ALUControl = 4'b1010; A = 32'd11; B = 32'd12;
    #10;
    ALUControl = 4'b1011; A = 32'd11; B = 32'd12;
    #10;
    ALUControl = 4'b1100; A = 32'd11; B = 32'd12;
    #10;
    ALUControl = 4'b1101; A = 32'd11; B = 32'd12;
    #10;
    ALUControl = 4'b1110; A = 32'd15; B = 32'd12;
    #10;
	ALUControl = 4'b1111; A = 32'd10; B = 32'd10;
    #10;
	end
	
    	
	

endmodule

