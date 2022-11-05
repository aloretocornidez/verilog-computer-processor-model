`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort

*/

module EX_MEM_piplineRegister(
    EX_Instruction,
    EX_PC_Add4,
    EX_Address,
    EX_toMemToReg,
    EX_Rt,
    EX_ALUResult,
    EX_HiLoMadd,
    EX_ReadHiLo,
    EX_WriteRegCarry,
    EX_sadRegWrite,

   // EX_WriteData,
   
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
	EX_sadMux_sel,
	EX_sadMem_control,
	EX_minRegWrite, 

    MEM_Instruction,
    MEM_PC_Add4,
    MEM_Address,
    MEM_toMemToReg,
    MEM_Rt,
    MEM_ALUResult,
    MEM_HiLoMadd,
    MEM_ReadHiLo,
    MEM_WriteRegCarry,
    MEM_sadRegWrite,
    //MEM_WriteData,
    
    MEM_MemWrite,
	MEM_MemRead,
	MEM_MAS,
	MEM_MemToReg,
	MEM_BitsIn,
	MEM_Jal_Mux,
	MEM_SEL_Madd,
	MEM_HiLo_WB,
    MEM_RegWrite,
    MEM_WriteDataHi,
    MEM_WriteDataLo,
    MEM_sadMux_sel,
	MEM_sadMem_control,
	MEM_minRegWrite,
    
    Clk, //Yes, the registers are clocked.
    Reset
    );

    input Clk;
    input Reset;
    input [31:0]EX_Instruction;
    input [31:0]EX_PC_Add4;
    input [31:0]EX_Address;
    input [31:0]EX_toMemToReg;
    input [31:0]EX_Rt; //changed to 31 form 4
    input [63:0]EX_ALUResult;
    input [63:0]EX_HiLoMadd;
    input [31:0]EX_ReadHiLo;
    input [4:0]EX_WriteRegCarry;
    input [1:0] EX_sadRegWrite;
    //input [31:0]MEM_WriteData;//this is going back
    
    input EX_MemWrite;
	input EX_MemRead;
	input EX_MAS;
	input EX_MemToReg;
	input [1:0]EX_BitsIn;
	input EX_Jal_Mux;
	input EX_SEL_Madd;
	input EX_HiLo_WB;
	input EX_RegWrite;
	input EX_WriteDataHi;
	input EX_WriteDataLo;
	input EX_sadMux_sel;
	input EX_sadMem_control;
	input EX_minRegWrite; 
    
    output reg [31:0]MEM_Instruction;
    output reg [31:0]MEM_PC_Add4;
    output reg [31:0]MEM_Address;
    output reg [31:0]MEM_toMemToReg;
    output reg [31:0]MEM_Rt;//changed to 31 form 4
    output reg [63:0]MEM_ALUResult;
    output reg [63:0]MEM_HiLoMadd;
    output reg [31:0]MEM_ReadHiLo;
    output reg [4:0]MEM_WriteRegCarry;
    output reg [1:0] MEM_sadRegWrite;
    //output reg [31:0]EX_WriteData;//this is going back
    
    output reg MEM_MemWrite;
	output reg MEM_MemRead;
	output reg MEM_MAS;
	output reg MEM_MemToReg;
	output reg [1:0]MEM_BitsIn;
	output reg MEM_Jal_Mux;
	output reg MEM_SEL_Madd;
	output reg MEM_HiLo_WB;
	output reg MEM_RegWrite;
	output reg MEM_WriteDataHi;
	output reg MEM_WriteDataLo;
	output reg MEM_sadMux_sel;
	output reg MEM_sadMem_control;
	output reg MEM_minRegWrite;

    always @(posedge Clk)
    begin
      
      
    if (Reset == 1) begin
    MEM_Instruction <= 0;
    MEM_PC_Add4 <= 0;
        MEM_Address <= 0;
        MEM_toMemToReg <= 0;
        MEM_Rt <= 0;
        MEM_ALUResult <= 0;
        MEM_HiLoMadd <= 0;
        MEM_ReadHiLo <= 0;
        //EX_WriteData <= MEM_WriteData;   
        MEM_MemWrite <= 0;
	    MEM_MemRead <= 0;
	    MEM_MAS <= 0;
        MEM_MemToReg <= 0;
        MEM_BitsIn <= 0;
        MEM_Jal_Mux <= 0;
	    MEM_SEL_Madd <= 0;
	    MEM_HiLo_WB <= 0;    
	    MEM_RegWrite <= 0;
	    MEM_WriteRegCarry <= 0;
        
        MEM_WriteDataHi <= 0;        
        MEM_WriteDataLo <= 0;
        MEM_sadMux_sel <= 0;
    	MEM_sadMem_control <= 0;
    	MEM_sadRegWrite <= 0;
    	MEM_minRegWrite <= 0; 
    end
    
    else begin
        MEM_Instruction <= EX_Instruction;
        MEM_PC_Add4 <= EX_PC_Add4;
        MEM_Address <= EX_Address;
        MEM_toMemToReg <= EX_toMemToReg;
        MEM_Rt <= EX_Rt;
        MEM_ALUResult <= EX_ALUResult;
        MEM_HiLoMadd <= EX_HiLoMadd;
        MEM_ReadHiLo <= EX_ReadHiLo;
        //EX_WriteData <= MEM_WriteData;   
        MEM_MemWrite <= EX_MemWrite;
	    MEM_MemRead <= EX_MemRead;
	    MEM_MAS <= EX_MAS;
        MEM_MemToReg <= EX_MemToReg;
        MEM_BitsIn <= EX_BitsIn;
        MEM_Jal_Mux <= EX_Jal_Mux;
	    MEM_SEL_Madd <= EX_SEL_Madd;
	    MEM_HiLo_WB <= EX_HiLo_WB;    
	    MEM_RegWrite <= EX_RegWrite;
	    MEM_WriteRegCarry <= EX_WriteRegCarry;
        
        MEM_WriteDataHi <= EX_WriteDataHi;        
        MEM_WriteDataLo <= EX_WriteDataLo;
        
        MEM_sadMux_sel <= EX_sadMux_sel;
	    MEM_sadMem_control <= EX_sadMem_control;
	    MEM_sadRegWrite <= EX_sadRegWrite;
	    MEM_minRegWrite <= EX_minRegWrite;
    end
    end
   /* //We want the writedata to behave like a short, so it will be inside an always block.
    always @(*)
    begin

    end
   */ 
endmodule
