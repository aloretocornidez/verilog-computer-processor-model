`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/

module X3_WB_pipelineRegister(
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
	X3_sad_add_d0_out,
	X3_minVal,
	X3_minRegWrite,
	
    WB_Instruction,
    WB_PCAdd4,
    WB_DataMemOut,
    WB_ALUOut,
    WB_MaddOut,
    WB_HiLoOut,
    WB_WriteRegCarry,
   
    //controller

    WB_MemToReg,
	WB_BitsIn,
	WB_Jal_Mux,
	WB_SEL_Madd,
	WB_HiLo_WB,
	WB_RegWrite,
	WB_WriteDataHi,
	WB_WriteDataLo,
	WB_sad_add_d0_out,
	WB_minVal,
	WB_minRegWrite,
    

    Clk,
    Reset
    );

    input Clk;
    input Reset;

    input [31:0] X3_Instruction;
    input [31:0]X3_PCAdd4;
    input [31:0]X3_DataMemOut;
    input [31:0]X3_ALUOut;
    input [63:0]X3_MaddOut;
    input [31:0]X3_HiLoOut;
    input [4:0]X3_WriteRegCarry;
   
    input X3_MemToReg;
	input [1:0]X3_BitsIn;
	input X3_Jal_Mux;
	input X3_SEL_Madd;
	input X3_HiLo_WB;
	input X3_RegWrite;
	input X3_WriteDataHi;
	input X3_WriteDataLo;
	input [31:0]X3_sad_add_d0_out;
	input [31:0]X3_minVal;
	input X3_minRegWrite; 

    output reg [31:0]WB_Instruction;
    output reg [31:0]WB_PCAdd4;
    output reg [31:0]WB_DataMemOut;
    output reg [31:0]WB_ALUOut;
    output reg [63:0]WB_MaddOut;
    output reg [31:0]WB_HiLoOut;
    output reg [4:0]WB_WriteRegCarry;

    output reg WB_MemToReg;
	output reg [1:0]WB_BitsIn;
	output reg WB_Jal_Mux;
	output reg WB_SEL_Madd;
	output reg WB_HiLo_WB;
	output reg WB_RegWrite;
	output reg WB_WriteDataHi;
	output reg WB_WriteDataLo;
	output reg [31:0]WB_sad_add_d0_out;
	output reg [31:0]WB_minVal;
	output reg WB_minRegWrite; 
	

    always @(posedge Clk)
    begin
    
    if(Reset == 1) begin
        WB_Instruction <= 0;
        WB_PCAdd4 <= 0;
        WB_DataMemOut <= 0;
        WB_ALUOut <= 0;
        WB_MaddOut <= 0;
        WB_HiLoOut <= 0;

        WB_MemToReg <= 0;
	    WB_BitsIn <= 0;
	    WB_Jal_Mux <= 0;
	    WB_SEL_Madd <= 0;
	    WB_HiLo_WB <= 0;
	    WB_RegWrite <= 0;
	    WB_WriteRegCarry <= 0;
	    
	    WB_WriteDataHi <= 0;
	    WB_WriteDataLo <= 0;
	    WB_sad_add_d0_out <= 0;
	    WB_minVal <= 0;
	    WB_minRegWrite <= 0; 
	    
    end
    
    else begin
        WB_Instruction <= X3_Instruction;
        WB_PCAdd4 <= X3_PCAdd4;
        WB_DataMemOut <= X3_DataMemOut;
        WB_ALUOut <= X3_ALUOut;
        WB_MaddOut <= X3_MaddOut;
        WB_HiLoOut <= X3_HiLoOut;

        WB_MemToReg <= X3_MemToReg;
	    WB_BitsIn <= X3_BitsIn;
	    WB_Jal_Mux <= X3_Jal_Mux;
	    WB_SEL_Madd <= X3_SEL_Madd;
	    WB_HiLo_WB <= X3_HiLo_WB;
	    WB_RegWrite <= X3_RegWrite;
	    WB_WriteRegCarry <= X3_WriteRegCarry;
	    
	    WB_WriteDataHi <= X3_WriteDataHi;
	    WB_WriteDataLo <= X3_WriteDataLo;
	    WB_sad_add_d0_out <= X3_sad_add_d0_out;
	    WB_minVal <= X3_minVal;
	    WB_minRegWrite <= X3_minRegWrite;

    end
    end
    
endmodule
