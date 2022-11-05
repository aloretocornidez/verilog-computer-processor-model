`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/

module MEM_X1_pipelineRegister(
    MEM_Instruction,
    MEM_PCAdd4,
    MEM_DataMemOut,
    MEM_ALUOut,
    MEM_MaddOut,
    MEM_HiLoOut,
    MEM_WriteRegCarry,
    //controller
    
    MEM_MemToReg,
	MEM_BitsIn,
	MEM_Jal_Mux,
	MEM_SEL_Madd,
	MEM_HiLo_WB,
	MEM_RegWrite,
	MEM_WriteDataHi,
	MEM_WriteDataLo,
	MEM_sadRegWrite,
	
	MEM_sadMem0_out,
	MEM_sadMem1_out,
	MEM_sadMem2_out,
	MEM_sadMem3_out,
	MEM_sadMem4_out,
	MEM_sadMem5_out,
	MEM_sadMem6_out,
	MEM_sadMem7_out,
	MEM_sadMem8_out,
	MEM_sadMem9_out,
	MEM_sadMem10_out,
	MEM_sadMem11_out,
	MEM_sadMem12_out,
	MEM_sadMem13_out,
	MEM_sadMem14_out,
	MEM_sadMem15_out,
	MEM_minRegWrite,
	
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
    X1_sadRegWrite,
    
   	X1_sadMem0_out,
	X1_sadMem1_out,
	X1_sadMem2_out,
	X1_sadMem3_out,
	X1_sadMem4_out,
	X1_sadMem5_out,
	X1_sadMem6_out,
	X1_sadMem7_out,
	X1_sadMem8_out,
	X1_sadMem9_out,
	X1_sadMem10_out,
	X1_sadMem11_out,
	X1_sadMem12_out,
	X1_sadMem13_out,
	X1_sadMem14_out,
	X1_sadMem15_out,
	X1_minRegWrite,

    Clk,
    Reset
    );

    input Clk;
    input Reset;

    input [31:0] MEM_Instruction;
    input [31:0]MEM_PCAdd4;
    input [31:0]MEM_DataMemOut;
    input [31:0]MEM_ALUOut;
    input [63:0]MEM_MaddOut;
    input [31:0]MEM_HiLoOut;
    input [4:0]MEM_WriteRegCarry;
   
    input MEM_MemToReg;
	input [1:0]MEM_BitsIn;
	input MEM_Jal_Mux;
	input MEM_SEL_Madd;
	input MEM_HiLo_WB;
	input MEM_RegWrite;
	input MEM_WriteDataHi;
	input MEM_WriteDataLo;
	input [1:0] MEM_sadRegWrite;
	
    input [31:0]MEM_sadMem0_out;
	input [31:0]MEM_sadMem1_out;
	input [31:0]MEM_sadMem2_out;
	input [31:0]MEM_sadMem3_out;
	input [31:0]MEM_sadMem4_out;
	input [31:0]MEM_sadMem5_out;
	input [31:0]MEM_sadMem6_out;
	input [31:0]MEM_sadMem7_out;
	input [31:0]MEM_sadMem8_out;
	input [31:0]MEM_sadMem9_out;
	input [31:0]MEM_sadMem10_out;
	input [31:0]MEM_sadMem11_out;
	input [31:0]MEM_sadMem12_out;
	input [31:0]MEM_sadMem13_out;
	input [31:0]MEM_sadMem14_out;
	input [31:0]MEM_sadMem15_out;
	input MEM_minRegWrite; 
	

    output reg [31:0]X1_Instruction;
    output reg [31:0]X1_PCAdd4;
    output reg [31:0]X1_DataMemOut;
    output reg [31:0]X1_ALUOut;
    output reg [63:0]X1_MaddOut;
    output reg [31:0]X1_HiLoOut;
    output reg [4:0]X1_WriteRegCarry;

    output reg X1_MemToReg;
	output reg [1:0]X1_BitsIn;
	output reg X1_Jal_Mux;
	output reg X1_SEL_Madd;
	output reg X1_HiLo_WB;
	output reg X1_RegWrite;
	output reg X1_WriteDataHi;
	output reg X1_WriteDataLo;
	output reg [1:0] X1_sadRegWrite;
	
    output reg [31:0]X1_sadMem0_out;
	output reg [31:0]X1_sadMem1_out;
	output reg [31:0]X1_sadMem2_out;
	output reg [31:0]X1_sadMem3_out;
	output reg [31:0]X1_sadMem4_out;
	output reg [31:0]X1_sadMem5_out;
	output reg [31:0]X1_sadMem6_out;
	output reg [31:0]X1_sadMem7_out;
	output reg [31:0]X1_sadMem8_out;
	output reg [31:0]X1_sadMem9_out;
	output reg [31:0]X1_sadMem10_out;
	output reg [31:0]X1_sadMem11_out;
	output reg [31:0]X1_sadMem12_out;
	output reg [31:0]X1_sadMem13_out;
	output reg [31:0]X1_sadMem14_out;
	output reg [31:0]X1_sadMem15_out;
	output reg X1_minRegWrite;
	

    always @(posedge Clk)
    begin
    
    if(Reset == 1) begin
        X1_Instruction <= 0;
        X1_PCAdd4 <= 0;
        X1_DataMemOut <= 0;
        X1_ALUOut <= 0;
        X1_MaddOut <= 0;
        X1_HiLoOut <= 0;

        X1_MemToReg <= 0;
	    X1_BitsIn <= 0;
	    X1_Jal_Mux <= 0;
	    X1_SEL_Madd <= 0;
	    X1_HiLo_WB <= 0;
	    X1_RegWrite <= 0;
	    X1_WriteRegCarry <= 0;
	    
	    X1_WriteDataHi <= 0;
	    X1_WriteDataLo <= 0;
	    X1_sadRegWrite <= 0;
	    
	    X1_sadMem0_out <= 0;
	    X1_sadMem1_out <= 0;
	    X1_sadMem2_out <= 0;
	    X1_sadMem3_out <= 0;
	    X1_sadMem4_out <= 0;
	    X1_sadMem5_out <= 0;
	    X1_sadMem6_out <= 0;
	    X1_sadMem7_out <= 0;
	    X1_sadMem8_out <= 0;
	    X1_sadMem9_out <= 0;
	    X1_sadMem10_out <= 0;
	    X1_sadMem11_out <= 0;
	    X1_sadMem12_out <= 0;
	    X1_sadMem13_out <= 0;
	    X1_sadMem14_out <= 0;
	    X1_sadMem15_out <= 0;
	    X1_minRegWrite <= 0;
	    
    end
    
    else begin
        X1_Instruction <= MEM_Instruction;
        X1_PCAdd4 <= MEM_PCAdd4;
        X1_DataMemOut <= MEM_DataMemOut;
        X1_ALUOut <= MEM_ALUOut;
        X1_MaddOut <= MEM_MaddOut;
        X1_HiLoOut <= MEM_HiLoOut;

        X1_MemToReg <= MEM_MemToReg;
	    X1_BitsIn <= MEM_BitsIn;
	    X1_Jal_Mux <= MEM_Jal_Mux;
	    X1_SEL_Madd <= MEM_SEL_Madd;
	    X1_HiLo_WB <= MEM_HiLo_WB;
	    X1_RegWrite <= MEM_RegWrite;
	    X1_WriteRegCarry <= MEM_WriteRegCarry;
	    
	    X1_WriteDataHi <= MEM_WriteDataHi;
	    X1_WriteDataLo <= MEM_WriteDataLo;
	    X1_sadRegWrite <= MEM_sadRegWrite;
	    
	    X1_sadMem0_out <= MEM_sadMem0_out;
	    X1_sadMem1_out <= MEM_sadMem1_out;
	    X1_sadMem2_out <= MEM_sadMem2_out;
	    X1_sadMem3_out <= MEM_sadMem3_out;
	    X1_sadMem4_out <= MEM_sadMem4_out;
	    X1_sadMem5_out <= MEM_sadMem5_out;
	    X1_sadMem6_out <= MEM_sadMem6_out;
	    X1_sadMem7_out <= MEM_sadMem7_out;
	    X1_sadMem8_out <= MEM_sadMem8_out;
	    X1_sadMem9_out <= MEM_sadMem9_out;
	    X1_sadMem10_out <= MEM_sadMem10_out;
	    X1_sadMem11_out <= MEM_sadMem11_out;
	    X1_sadMem12_out <= MEM_sadMem12_out;
	    X1_sadMem13_out <= MEM_sadMem13_out;
	    X1_sadMem14_out <= MEM_sadMem14_out;
	    X1_sadMem15_out <= MEM_sadMem15_out;
	    X1_minRegWrite <= MEM_minRegWrite;

    end
    end
    
endmodule
