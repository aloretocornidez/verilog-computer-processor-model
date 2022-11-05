`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/

module X1_X2_pipelineRegister(
    X1_Instruction,
    X1_PCAdd4,
    X1_DataMemOut,
    X1_ALUOut,
    X1_MaddOut,
    X1_HiLoOut,
    X1_WriteRegCarry,
    //controller
    
    X1_MemToReg,
	X1_BitsIn,
	X1_Jal_Mux,
	X1_SEL_Madd,
	X1_HiLo_WB,
	X1_RegWrite,
	X1_WriteDataHi,
	X1_WriteDataLo,
	
	X1_Subber0_out,
	X1_Subber1_out,
	X1_Subber2_out,
	X1_Subber3_out,
	X1_Subber4_out,
	X1_Subber5_out,
	X1_Subber6_out,
	X1_Subber7_out,
	X1_Subber8_out,
	X1_Subber9_out,
	X1_Subber10_out,
	X1_Subber11_out,
	X1_Subber12_out,
	X1_Subber13_out,
	X1_Subber14_out,
	X1_Subber15_out,
	X1_minRegWrite, 
	
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
	
	X2_Subber0_out,
	X2_Subber1_out,
	X2_Subber2_out,
	X2_Subber3_out,
	X2_Subber4_out,
	X2_Subber5_out,
	X2_Subber6_out,
	X2_Subber7_out,
	X2_Subber8_out,
	X2_Subber9_out,
	X2_Subber10_out,
	X2_Subber11_out,
	X2_Subber12_out,
	X2_Subber13_out,
	X2_Subber14_out,
	X2_Subber15_out,
	X2_minRegWrite,
    

    Clk,
    Reset
    );

    input Clk;
    input Reset;

    input [31:0] X1_Instruction;
    input [31:0]X1_PCAdd4;
    input [31:0]X1_DataMemOut;
    input [31:0]X1_ALUOut;
    input [63:0]X1_MaddOut;
    input [31:0]X1_HiLoOut;
    input [4:0]X1_WriteRegCarry;
   
    input X1_MemToReg;
	input [1:0]X1_BitsIn;
	input X1_Jal_Mux;
	input X1_SEL_Madd;
	input X1_HiLo_WB;
	input X1_RegWrite;
	input X1_WriteDataHi;
	input X1_WriteDataLo;
	
    input [31:0] X1_Subber0_out;
	input [31:0] X1_Subber1_out;
	input [31:0] X1_Subber2_out;
	input [31:0] X1_Subber3_out;
	input [31:0] X1_Subber4_out;
	input [31:0] X1_Subber5_out;
	input [31:0] X1_Subber6_out;
	input [31:0] X1_Subber7_out;
	input [31:0] X1_Subber8_out;
	input [31:0] X1_Subber9_out;
	input [31:0] X1_Subber10_out;
	input [31:0] X1_Subber11_out;
	input [31:0] X1_Subber12_out;
	input [31:0] X1_Subber13_out;
	input [31:0] X1_Subber14_out;
	input [31:0] X1_Subber15_out;
	input X1_minRegWrite;

    output reg [31:0]X2_Instruction;
    output reg [31:0]X2_PCAdd4;
    output reg [31:0]X2_DataMemOut;
    output reg [31:0]X2_ALUOut;
    output reg [63:0]X2_MaddOut;
    output reg [31:0]X2_HiLoOut;
    output reg [4:0]X2_WriteRegCarry;

    output reg X2_MemToReg;
	output reg [1:0]X2_BitsIn;
	output reg X2_Jal_Mux;
	output reg X2_SEL_Madd;
	output reg X2_HiLo_WB;
	output reg X2_RegWrite;
	output reg X2_WriteDataHi;
	output reg X2_WriteDataLo;
	
	output reg [31:0] X2_Subber0_out;
	output reg [31:0] X2_Subber1_out;
	output reg [31:0] X2_Subber2_out;
	output reg [31:0] X2_Subber3_out;
	output reg [31:0] X2_Subber4_out;
	output reg [31:0] X2_Subber5_out;
	output reg [31:0] X2_Subber6_out;
	output reg [31:0] X2_Subber7_out;
	output reg [31:0] X2_Subber8_out;
	output reg [31:0] X2_Subber9_out;
	output reg [31:0] X2_Subber10_out;
	output reg [31:0] X2_Subber11_out;
	output reg [31:0] X2_Subber12_out;
	output reg [31:0] X2_Subber13_out;
	output reg [31:0] X2_Subber14_out;
	output reg [31:0] X2_Subber15_out;
	output reg X2_minRegWrite;

    always @(posedge Clk)
    begin
    
    if(Reset == 1) begin
        X2_Instruction <= 0;
        X2_PCAdd4 <= 0;
        X2_DataMemOut <= 0;
        X2_ALUOut <= 0;
        X2_MaddOut <= 0;
        X2_HiLoOut <= 0;

        X2_MemToReg <= 0;
	    X2_BitsIn <= 0;
	    X2_Jal_Mux <= 0;
	    X2_SEL_Madd <= 0;
	    X2_HiLo_WB <= 0;
	    X2_RegWrite <= 0;
	    X2_WriteRegCarry <= 0;
	    
	    X2_WriteDataHi <= 0;
	    X2_WriteDataLo <= 0;
	    
	    X2_Subber0_out <= 0;
	    X2_Subber1_out <= 0;
        X2_Subber2_out <= 0;
	    X2_Subber3_out <= 0;
	    X2_Subber4_out <= 0;
	    X2_Subber5_out <= 0;
	    X2_Subber6_out <= 0;
	    X2_Subber7_out <= 0;
	    X2_Subber8_out <= 0;
	    X2_Subber9_out <= 0;
	    X2_Subber10_out <= 0;
	    X2_Subber11_out <= 0;
	    X2_Subber12_out <= 0;
	    X2_Subber13_out <= 0;
	    X2_Subber14_out <= 0;
	    X2_Subber15_out <= 0;
	    X2_minRegWrite <= 0;

	    
    end
    
    else begin
        X2_Instruction <= X1_Instruction;
        X2_PCAdd4 <= X1_PCAdd4;
        X2_DataMemOut <= X1_DataMemOut;
        X2_ALUOut <= X1_ALUOut;
        X2_MaddOut <= X1_MaddOut;
        X2_HiLoOut <= X1_HiLoOut;

        X2_MemToReg <= X1_MemToReg;
	    X2_BitsIn <= X1_BitsIn;
	    X2_Jal_Mux <= X1_Jal_Mux;
	    X2_SEL_Madd <= X1_SEL_Madd;
	    X2_HiLo_WB <= X1_HiLo_WB;
	    X2_RegWrite <= X1_RegWrite;
	    X2_WriteRegCarry <= X1_WriteRegCarry;
	    
	    X2_WriteDataHi <= X1_WriteDataHi;
	    X2_WriteDataLo <= X1_WriteDataLo;
	    
	    X2_Subber0_out <= X1_Subber0_out;
	    X2_Subber1_out <= X1_Subber1_out;
        X2_Subber2_out <= X1_Subber2_out;
	    X2_Subber3_out <= X1_Subber3_out;
	    X2_Subber4_out <= X1_Subber4_out;
	    X2_Subber5_out <= X1_Subber5_out;
	    X2_Subber6_out <= X1_Subber6_out;
	    X2_Subber7_out <= X1_Subber7_out;
	    X2_Subber8_out <= X1_Subber8_out;
	    X2_Subber9_out <= X1_Subber9_out;
	    X2_Subber10_out <= X1_Subber10_out;
	    X2_Subber11_out <= X1_Subber11_out;
	    X2_Subber12_out <= X1_Subber12_out;
	    X2_Subber13_out <= X1_Subber13_out;
	    X2_Subber14_out <= X1_Subber14_out;
	    X2_Subber15_out <= X1_Subber15_out;
	    X2_minRegWrite <= X1_minRegWrite;

    end
    end
    
endmodule
