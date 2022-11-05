`timescale 1ns / 1ps

module HazardMux(ALUOp, RegDst, SEH_Mux, RegWrite, ALUSrc,
MemWrite, MemRead, MemToReg, BitsIn, Branch_ALU_op, JAL_Mux, MAS_Control, HiLo_Zero,
HiLoOut, WriteDataHi, WriteDataLo, HiLoWB, SeOpt, Sel_MAdd, HiLoSel, Alu_RS_mux,D2_sadMux_sel,
D2_sadMem_control,D2_sadRegWrite,D2_minRegWrite,
in_ALUOp, in_RegDst, in_SEH_Mux, in_RegWrite, in_ALUSrc,
in_MemWrite, in_MemRead, in_MemToReg, in_BitsIn, in_Branch_ALU_op, in_JAL_Mux, in_MAS_Control, in_HiLo_Zero,
in_HiLoOut, in_WriteDataHi, in_WriteDataLo, in_HiLoWB, in_SeOpt, in_Sel_MAdd, in_HiLoSel, in_Alu_RS_mux, HazardControl,D1_sadMux_sel,
D1_sadMem_control,D1_sadRegWrite, D1_minRegWrite);

input [4:0]in_ALUOp; 
input [1:0]in_RegDst;
input [1:0]in_SEH_Mux;
input in_RegWrite;
input in_ALUSrc;
input in_MemWrite;
input in_MemRead;
input in_MemToReg; 
input [1:0]in_BitsIn;
input in_Branch_ALU_op;
input in_JAL_Mux;
input in_MAS_Control;
input in_HiLo_Zero;
input in_HiLoOut;
input in_WriteDataHi;
input in_WriteDataLo;
input in_Sel_MAdd;
input in_SeOpt;
input in_HiLoSel;
input in_HiLoWB; 
input in_Alu_RS_mux;
input HazardControl;
input D1_sadMux_sel;
input D1_sadMem_control;
input [1:0] D1_sadRegWrite;
input D1_minRegWrite;


output reg [4:0]ALUOp; 
output reg [1:0]RegDst;
output reg [1:0]SEH_Mux;
output reg RegWrite;
output reg ALUSrc;
output reg MemWrite;
output reg MemRead;
output reg MemToReg; 
output reg [1:0]BitsIn;
output reg Branch_ALU_op;
output reg JAL_Mux;
output reg MAS_Control;
output reg HiLo_Zero;
output reg HiLoOut;
output reg WriteDataHi;
output reg WriteDataLo;
output reg Sel_MAdd;
output reg SeOpt;
output reg HiLoSel;
output reg HiLoWB; 
output reg Alu_RS_mux;
output reg D2_sadMux_sel;
output reg D2_sadMem_control;
output reg [1:0] D2_sadRegWrite;
output reg D2_minRegWrite; 


always @(*)begin
    
    if (HazardControl == 0) begin

        ALUOp <= in_ALUOp; 
        RegDst <= in_RegDst;
        SEH_Mux <= in_SEH_Mux;
        RegWrite <= in_RegWrite;
        ALUSrc <= in_ALUSrc;
        MemWrite <= in_MemWrite;
        MemRead <= in_MemRead;
        MemToReg <= in_MemToReg; 
        BitsIn <= in_BitsIn;
        Branch_ALU_op <= in_Branch_ALU_op;
        JAL_Mux <= in_JAL_Mux;
        MAS_Control <= in_MAS_Control;
        HiLo_Zero <= in_HiLo_Zero;
        HiLoOut <= in_HiLoOut;
        WriteDataHi <= in_WriteDataHi;
        WriteDataLo <= in_WriteDataLo;
        Sel_MAdd <= in_Sel_MAdd;
        SeOpt <= in_SeOpt;
        HiLoSel <= in_HiLoSel;
        HiLoWB <= in_HiLoWB; 
        Alu_RS_mux <= in_Alu_RS_mux;
        D2_sadMux_sel <= D1_sadMux_sel;
        D2_sadRegWrite <= D1_sadRegWrite;
        D2_minRegWrite <= D1_minRegWrite;
        D2_sadMem_control <= D1_sadMem_control;

    end
    else begin
    
        ALUOp <= 5'b11011; 
        RegDst <= in_RegDst;//0;
        SEH_Mux <= 0;
        RegWrite <= 0;
        ALUSrc <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemToReg <= 0; 
        BitsIn <= 0;
        Branch_ALU_op <= 0;
        JAL_Mux <= 0;
        MAS_Control <= 0;
        HiLo_Zero <= 0;
        HiLoOut <= 0;
        WriteDataHi <= 0;
        WriteDataLo <= 0;
        Sel_MAdd <= 0;
        SeOpt <= 0;
        HiLoSel <= 0;
        HiLoWB <= 0; 
        Alu_RS_mux <= 0;
        D2_sadMux_sel <=0;
        D2_sadRegWrite <= 0;
        D2_minRegWrite <= 0;
        D2_sadMem_control <= 0;
    end
    
end

endmodule
