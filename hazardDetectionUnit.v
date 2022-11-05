`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
/*
Lab Group Names:
Alan Loreto Cornidez 33%
Chris W Bremser 33%
Haseeb Irfan 33%
*/ 
//////////////////////////////////////////////////////////////////////////////////



module hazardDetection (
   RegDst,
   ID_EX_Rt,
   IF_ID_Rs,
   IF_ID_Rt,
   Sel_Op,
   ID_EX_memRead,
   PC_Write,
   flush,
   IF_ID_Write,
   hazardMuxControl,
   OpCode,
   
   
   EX_WriteRegCarry,
   MEM_WriteRegCarry,
   WB_WriteRegCarry,
   X1_WriteRegCarry,
   X2_WriteRegCarry,
   X3_WriteRegCarry,
   EX_RegWrite,
   MEM_RegWrite,
   WB_RegWrite,
   X1_RegWrite,
   X2_RegWrite,
   X3_RegWrite
);
input [1:0] RegDst;
input [4:0] ID_EX_Rt;
input [4:0] IF_ID_Rs;
input [4:0] IF_ID_Rt;
input [1:0] Sel_Op;

//input [4:0] ID_WriteRegCarry;
input [4:0] EX_WriteRegCarry;
input [4:0] MEM_WriteRegCarry;
input [4:0] WB_WriteRegCarry;
input [4:0] X1_WriteRegCarry;
input [4:0] X2_WriteRegCarry;
input [4:0] X3_WriteRegCarry;

input ID_EX_memRead;


input EX_RegWrite;
input MEM_RegWrite;
input WB_RegWrite;
input X1_RegWrite;
input X2_RegWrite;
input X3_RegWrite;

input [5:0] OpCode;

output reg PC_Write;
output reg flush; 
output reg IF_ID_Write;
output reg hazardMuxControl;

reg branchFlag;

//Stall signal to the program counter
//output to the control
//ifid must recieve zeroes to stall.


initial begin
    PC_Write = 0;
    IF_ID_Write = 0;
    hazardMuxControl = 0;
    flush = 0;
    branchFlag = 0;
end

always @(*)
begin
    PC_Write = 0;
    IF_ID_Write = 0;
    hazardMuxControl = 0;
    flush = 0;
    branchFlag = 0;
    //if((ID_EX_memRead == 1) &&( ( ID_EX_Rt == IF_ID_Rs) || (ID_EX_Rt == IF_ID_Rt)))
    //begin
    // stall Stop Program counter
    //    PC_Write <= 1;
    // stall the pipeline
    //    IF_ID_Write <= 1;
    // set hazard mux control to 1 (sending nop into pipeline)
    //    hazardMuxControl <= 1;
    // 
    //end
    
    case (OpCode)
        6'b000001: branchFlag = 1;
        6'b000100: branchFlag = 1;
        6'b000101: branchFlag = 1;
        6'b000111: branchFlag = 1;
        6'b000110: branchFlag = 1;
        default: branchFlag = 0;
    endcase
    
    
    if ((EX_RegWrite == 1) && ((EX_WriteRegCarry == IF_ID_Rs) || ((RegDst == 2'b01) && EX_WriteRegCarry == IF_ID_Rt))) begin
    
    // stall Stop Program counter
        PC_Write = 1;
    // stall the pipeline
        IF_ID_Write = 1;
    // set hazard mux control to 1 (sending nop into pipeline)
        hazardMuxControl = 1;
    end
    
    else if ((MEM_RegWrite == 1) && ((MEM_WriteRegCarry == IF_ID_Rs) || ((RegDst == 2'b01) && MEM_WriteRegCarry == IF_ID_Rt))) begin
    // stall Stop Program counter
        PC_Write = 1;
    // stall the pipeline
        IF_ID_Write = 1;
    // set hazard mux control to 1 (sending nop into pipeline)
        hazardMuxControl = 1;
    end
    
    else if ((X1_RegWrite == 1) && ((X1_WriteRegCarry == IF_ID_Rs) || ((RegDst == 2'b01) && X1_WriteRegCarry == IF_ID_Rt))) begin
    // stall Stop Program counter
        PC_Write = 1;
    // stall the pipeline
        IF_ID_Write = 1;
    // set hazard mux control to 1 (sending nop into pipeline)
        hazardMuxControl = 1;
    end
    
    else if ((X2_RegWrite == 1) && ((X2_WriteRegCarry == IF_ID_Rs) || ((RegDst == 2'b01) && X2_WriteRegCarry == IF_ID_Rt))) begin
    // stall Stop Program counter
        PC_Write = 1;
    // stall the pipeline
        IF_ID_Write = 1;
    // set hazard mux control to 1 (sending nop into pipeline)
        hazardMuxControl = 1;
    end
    
    else if ((X3_RegWrite == 1) && ((X3_WriteRegCarry == IF_ID_Rs) || ((RegDst == 2'b01) && X3_WriteRegCarry == IF_ID_Rt))) begin
    // stall Stop Program counter
        PC_Write = 1;
    // stall the pipeline
        IF_ID_Write = 1;
    // set hazard mux control to 1 (sending nop into pipeline)
        hazardMuxControl = 1;
    end
    
    else if ((WB_RegWrite == 1) && ((WB_WriteRegCarry == IF_ID_Rs) || ((RegDst == 2'b01) && WB_WriteRegCarry == IF_ID_Rt))) begin
    // stall Stop Program counter
        PC_Write = 1;
    // stall the pipeline
        IF_ID_Write = 1;
    // set hazard mux control to 1 (sending nop into pipeline)
        hazardMuxControl = 1;
    end
    
    /*
    //branch
    else if ((WB_RegWrite == 1) && ((WB_WriteRegCarry == IF_ID_Rs) || (WB_WriteRegCarry == IF_ID_Rt)) && (branchFlag)) begin
    // stall Stop Program counter
        PC_Write = 1;
    // stall the pipeline
        IF_ID_Write = 1;
    // set hazard mux control to 1 (sending nop into pipeline)
        hazardMuxControl = 1;
    end
    
    //branch
    else if ((MEM_RegWrite == 1) && ((MEM_WriteRegCarry == IF_ID_Rs) || (MEM_WriteRegCarry == IF_ID_Rt)) && (branchFlag)) begin
    // stall Stop Program counter
        PC_Write = 1;
    // stall the pipeline
        IF_ID_Write = 1;
    // set hazard mux control to 1 (sending nop into pipeline)
        hazardMuxControl = 1;
    end
    */
    
    else if (Sel_Op != 0) begin //flushes loaded instructions in branch taken event
        flush = 1;
    end
    
end

endmodule
