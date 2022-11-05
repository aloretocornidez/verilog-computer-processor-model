`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/

module ID_EX_piplineRegister(
    ID_Instruction,
    ID_PCAdd4,
    ID_ReadData1,
    ID_ReadData2,
    ID_Hi,
    ID_Lo,
    ID_SignExtentsion,
    ID_WriteRegCarry,
    //ID_WriteData,
    
    
    //Controls
    
    ID_ALUOp,
	ID_ALUSrc,
	ID_HiLo_Sel,
	ID_HiLo_Zero,
	ID_MemWrite,
	ID_MemRead,
	ID_MAS,
	ID_MemToReg,
	ID_BitsIn,
	ID_Jal_Mux,
	ID_SEL_Madd,
	ID_HiLo_WB,
	ID_RegWrite,
	ID_WriteDataHi,
	ID_WriteDataLo,
	ID_Alu_RS_mux_D,
	D2_sadMux_sel,
    D2_sadMem_control,
    D2_sadRegWrite,
    D2_minRegWrite,

    EX_Instruction,
    EX_PCAdd4,
    EX_ReadData1,
    EX_ReadData2,
    EX_Hi,
    EX_Lo,
    EX_SignExtentsion,
    EX_WriteRegCarry,
    
    
    //controls
    EX_ALUOp,
	EX_ALUSrc,
	EX_HiLo_Sel,
	EX_HiLo_Zero,
	EX_MemWrite,
	EX_MemRead,
	EX_MAS,
	EX_MemToReg,
	EX_BitsIn,
	EX_Jal_Mux,
	EX_SEL_Madd,
	EX_HiLo_WB,
    EX_RegWrite,
    EX_WriteDataHi,
    EX_WriteDataLo,
    EX_Alu_RS_mux_D,
    EX_sadMux_sel,
    EX_sadMem_control,
    EX_sadRegWrite,
    EX_minRegWrite,
    
    
    Clk, //Yes, the registers are clocked.
    Reset
    );
    input Clk;
    input Reset;
    input [31:0] ID_Instruction;
   
    input [31:0]ID_PCAdd4;
    input [31:0]ID_ReadData1;
    input [31:0]ID_ReadData2;
    input [31:0]ID_Hi;
    input [31:0]ID_Lo;
    input [31:0]ID_SignExtentsion;
    input [4:0] ID_WriteRegCarry;
   
    input ID_Alu_RS_mux_D;

    input [4:0]ID_ALUOp;
	input ID_ALUSrc;
	input ID_HiLo_Sel;
	input ID_HiLo_Zero;
	input ID_MemWrite;
	input ID_MemRead;
	input ID_MAS;
	input ID_MemToReg;
	input [1:0]ID_BitsIn;
	input ID_Jal_Mux;
	input ID_SEL_Madd;
	input ID_HiLo_WB;
    input ID_RegWrite;
    input ID_WriteDataHi;
    input ID_WriteDataLo;
    input D2_sadMux_sel;
    input D2_sadMem_control;
    input [1:0] D2_sadRegWrite;
    input D2_minRegWrite; 

    //controls
    output reg [31:0]EX_Instruction;
    output reg [31:0]EX_ReadData1; // rs register
    output reg [31:0]EX_ReadData2; // rt register
    output reg [31:0]EX_Hi; // hi register 
    output reg [31:0]EX_Lo;  // low register
    output reg [31:0]EX_SignExtentsion;
    output reg [4:0]EX_WriteRegCarry;
    output reg [31:0]EX_PCAdd4;

    output reg [4:0]EX_ALUOp;
	output reg EX_ALUSrc;
	output reg EX_HiLo_Sel;
	output reg EX_HiLo_Zero;
	output reg EX_MemWrite;
	output reg EX_MemRead;
	output reg EX_MAS;
	output reg EX_MemToReg;
	output reg [1:0]EX_BitsIn;
	output reg EX_Jal_Mux;
	output reg EX_SEL_Madd;
	output reg EX_HiLo_WB;
	output reg EX_RegWrite;
    output reg EX_WriteDataHi;
    output reg EX_WriteDataLo;
    output reg EX_Alu_RS_mux_D;
    output reg EX_sadMux_sel;
    output reg EX_sadMem_control;
    output reg [1:0] EX_sadRegWrite;
    output reg EX_minRegWrite;
    

    always @(posedge Clk)
    begin
        if (Reset == 1)begin
        EX_Instruction <= 0 ;
        EX_PCAdd4 <= 0;
        EX_ReadData1 <= 0;
        EX_ReadData2 <= 0;
        EX_Hi <= 0;
        EX_Lo <= 0;
        EX_SignExtentsion <= 0;
        EX_WriteRegCarry <= 0;
    EX_ALUOp <= 0;
	EX_ALUSrc <= 0;
	EX_HiLo_Sel <= 0;
	EX_HiLo_Zero <= 0;
	EX_MemWrite <= 0;
	EX_MemRead <= 0;
	EX_MAS <= 0;
	EX_MemToReg <= 0;
	EX_BitsIn <= 0;
	EX_Jal_Mux <= 0;
	EX_SEL_Madd <= 0;
    EX_HiLo_WB <= 0;
    EX_RegWrite <= 0;
    EX_WriteDataHi <= 0;
    EX_WriteDataLo <= 0;
    EX_Alu_RS_mux_D <= 0;
    EX_sadMux_sel <= 0;
    EX_sadMem_control <= 0;
    EX_sadRegWrite <= 0;
    EX_minRegWrite <= 0; 
        
        end
        
        else begin
        //EX_jumplyAC <= ID_jumplyAC;
        EX_Instruction <= ID_Instruction;
        EX_PCAdd4 <= ID_PCAdd4;
        EX_ReadData1 <= ID_ReadData1;
        EX_ReadData2 <= ID_ReadData2;
        EX_Hi <= ID_Hi;
        EX_Lo <= ID_Lo;
        EX_SignExtentsion <= ID_SignExtentsion;
        EX_WriteRegCarry <= ID_WriteRegCarry;
    EX_ALUOp <= ID_ALUOp;
	EX_ALUSrc <= ID_ALUSrc;
	EX_HiLo_Sel <= ID_HiLo_Sel;
	EX_HiLo_Zero <= ID_HiLo_Zero;
	EX_MemWrite <= ID_MemWrite;
	EX_MemRead <= ID_MemRead;
	EX_MAS <= ID_MAS;
	EX_MemToReg <= ID_MemToReg;
	EX_BitsIn <= ID_BitsIn;
	EX_Jal_Mux <= ID_Jal_Mux;
	EX_SEL_Madd <= ID_SEL_Madd;
    EX_HiLo_WB <= ID_HiLo_WB;
    EX_RegWrite <= ID_RegWrite;
    
    EX_WriteDataHi <= ID_WriteDataHi;
    EX_WriteDataLo <= ID_WriteDataLo;
    EX_Alu_RS_mux_D <= ID_Alu_RS_mux_D;
    EX_sadMux_sel <= D2_sadMux_sel;
    EX_sadMem_control <= D2_sadMem_control;
    EX_sadRegWrite <= D2_sadRegWrite;
    EX_minRegWrite <= D2_minRegWrite;
    
    end
    end

    //We want the writedata to behave like a short, so it will be inside an always block.
  /*  always @(*)
    begin
        ID_PCAddyMux <= EX_PCAddyMux;
        ID_WriteData <= EX_WriteData;
    end
    */
endmodule
