`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/

module X2_X3_pipelineRegister(
    X2_Instruction,
    X2_PCAdd4,
    X2_DataMemOut,
    X2_ALUOut,
    X2_MaddOut,
    X2_HiLoOut,
    X2_WriteRegCarry,
    //controller
    
    X2_MemToReg,
	X2_BitsIn,
	X2_Jal_Mux,
	X2_SEL_Madd,
	X2_HiLo_WB,
	X2_RegWrite,
	X2_WriteDataHi,
	X2_WriteDataLo,
	X2_sad_add_b0_out,
	X2_sad_add_b1_out,
	X2_sad_add_b2_out,
	X2_sad_add_b3_out,
	X2_minRegWrite, 
	
    X3_Instruction,
    X3_PCAdd4,
    X3_DataMemOut,
    X3_ALUOut,
    X3_MaddOut,
    X3_HiLoOut,
    X3_WriteRegCarry,
   
    //controller

    X3_MemToReg,
	X3_BitsIn,
	X3_Jal_Mux,
	X3_SEL_Madd,
	X3_HiLo_WB,
	X3_RegWrite,
	X3_WriteDataHi,
	X3_WriteDataLo,
	X3_sad_add_b0_out,
	X3_sad_add_b1_out,
	X3_sad_add_b2_out,
	X3_sad_add_b3_out,
	X3_minRegWrite,
    

    Clk,
    Reset
    );

    input Clk;
    input Reset;

    input [31:0] X2_Instruction;
    input [31:0]X2_PCAdd4;
    input [31:0]X2_DataMemOut;
    input [31:0]X2_ALUOut;
    input [63:0]X2_MaddOut;
    input [31:0]X2_HiLoOut;
    input [4:0]X2_WriteRegCarry;
   
    input X2_MemToReg;
	input [1:0]X2_BitsIn;
	input X2_Jal_Mux;
	input X2_SEL_Madd;
	input X2_HiLo_WB;
	input X2_RegWrite;
	input X2_WriteDataHi;
	input X2_WriteDataLo;
	input [31:0]X2_sad_add_b0_out;
	input [31:0]X2_sad_add_b1_out;
	input [31:0]X2_sad_add_b2_out;
	input [31:0]X2_sad_add_b3_out;
	input X2_minRegWrite;

    output reg [31:0]X3_Instruction;
    output reg [31:0]X3_PCAdd4;
    output reg [31:0]X3_DataMemOut;
    output reg [31:0]X3_ALUOut;
    output reg [63:0]X3_MaddOut;
    output reg [31:0]X3_HiLoOut;
    output reg [4:0]X3_WriteRegCarry;

    output reg X3_MemToReg;
	output reg [1:0]X3_BitsIn;
	output reg X3_Jal_Mux;
	output reg X3_SEL_Madd;
	output reg X3_HiLo_WB;
	output reg X3_RegWrite;
	output reg X3_WriteDataHi;
	output reg X3_WriteDataLo;
	output reg [31:0]X3_sad_add_b0_out;
	output reg [31:0]X3_sad_add_b1_out;
	output reg [31:0]X3_sad_add_b2_out;
	output reg [31:0]X3_sad_add_b3_out;
	output reg X3_minRegWrite;
    

    always @(posedge Clk)
    begin
    
    if(Reset == 1) begin
        X3_Instruction <= 0;
        X3_PCAdd4 <= 0;
        X3_DataMemOut <= 0;
        X3_ALUOut <= 0;
        X3_MaddOut <= 0;
        X3_HiLoOut <= 0;

        X3_MemToReg <= 0;
	    X3_BitsIn <= 0;
	    X3_Jal_Mux <= 0;
	    X3_SEL_Madd <= 0;
	    X3_HiLo_WB <= 0;
	    X3_RegWrite <= 0;
	    X3_WriteRegCarry <= 0;
	    
	    X3_WriteDataHi <= 0;
	    X3_WriteDataLo <= 0;
	    X3_sad_add_b0_out <= 0;
	    X3_sad_add_b1_out <= 0;
	    X3_sad_add_b2_out <= 0;
	    X3_sad_add_b3_out <= 0;
	    X3_minRegWrite <= 0;
    end
    
    else begin
        X3_Instruction <= X2_Instruction;
        X3_PCAdd4 <= X2_PCAdd4;
        X3_DataMemOut <= X2_DataMemOut;
        X3_ALUOut <= X2_ALUOut;
        X3_MaddOut <= X2_MaddOut;
        X3_HiLoOut <= X2_HiLoOut;

        X3_MemToReg <= X2_MemToReg;
	    X3_BitsIn <= X2_BitsIn;
	    X3_Jal_Mux <= X2_Jal_Mux;
	    X3_SEL_Madd <= X2_SEL_Madd;
	    X3_HiLo_WB <= X2_HiLo_WB;
	    X3_RegWrite <= X2_RegWrite;
	    X3_WriteRegCarry <= X2_WriteRegCarry;
	    
	    X3_WriteDataHi <= X2_WriteDataHi;
	    X3_WriteDataLo <= X2_WriteDataLo;
	    X3_sad_add_b0_out <= X2_sad_add_b0_out;
	    X3_sad_add_b1_out <= X2_sad_add_b1_out;
	    X3_sad_add_b2_out <= X2_sad_add_b2_out;
	    X3_sad_add_b3_out <= X2_sad_add_b3_out;
	    X3_minRegWrite <= X2_minRegWrite;

    end
    end
    
endmodule
