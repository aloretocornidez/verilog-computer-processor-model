`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Christopher W Bremser 33%
// Hasseb Irfan  33%
// Alan Manuel Loreto Cornidez  33%
// Alex Fusco: 1% For being awesome
// Module Name: Controller
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module Controller(instruction, ALUOp, RegDst, SEH_Mux, RegWrite, ALUSrc,
MemWrite, MemRead, MemToReg, BitsIn, Branch_ALU_op, JAL_Mux, MAS_Control, HiLo_Zero,
HiLoOut, WriteDataHi, WriteDataLo, HiLoWB, SeOpt, Sel_MAdd, HiLoSel, Alu_RS_mux,
D1_sadMux_sel, D1_sadMem_control,D1_sadRegWrite,D1_minRegWrite);

input [31:0]instruction;

// OpCode is instruction;
wire [5:0]FunctCode;
wire [5:0]instruct;

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
output reg D1_sadMux_sel;
output reg D1_sadMem_control;
output reg [1:0]D1_sadRegWrite;
output reg D1_minRegWrite;



assign FunctCode = instruction[5:0];
assign instruct = instruction[31:26];

always @(instruction,instruct, FunctCode)
begin
    Alu_RS_mux <= 0;
    //functcode; 

    //FunctCode = instruction[5:0]; 
    //instruct = instruction[31:26];

  case (instruct)
        6'b000000:
        begin
          // ADD SUB, ADDU, MULT, MULTU, JR, AND, OR, NOR, 
          //XOR, SLL, SRL, SRLV, SLT, MOVN, MOVZ, ROTRV,
          //SRA SRAV, SLTU, MFLHI, MFLO
          case (FunctCode)
            6'b100000:
            begin
              //Add
              ALUOp <= 5'b00000;
              RegDst <= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 0;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              Alu_RS_mux <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
            
            6'b100001:
            begin
              // addu in ALUop
              ALUOp <= 5'b00000;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
    
            end
            
            6'b100010:
            begin
              // SUB
              ALUOp <= 5'b00001;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 0;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
            
            end
            
            6'b011000: 
            begin
              //Mult
              ALUOp <= 5'b00010;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 1;
              WriteDataLo <= 1;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
            end
            
            6'b011001:
            begin
            //Multu
              ALUOp <= 5'b00010;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 1;
              WriteDataLo <= 1;
              HiLoWB <= 0;
              SeOpt <= 0;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
            
            end
    
            6'b001000:
            begin
            // JR instruction
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 1;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
    
            end
    
            6'b100100: 
            begin
              // AND
              ALUOp <= 5'b01000;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b100101: 
            begin
              // OR ALUOp
              ALUOp <= 5'b01001;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b100111: 
            begin
              //NOR
              ALUOp <= 5'b01011;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0;
              D1_sadMem_control<=0; 
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
    
            end
    
            6'b100110: 
            begin
            // XOR ALUOp
              ALUOp <= 5'b01010;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
    
            end
    
            6'b000000: 
            begin
              //SLL ALUOp
              ALUOp <= 5'b00100;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b10;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              Alu_RS_mux <= 1;
              D1_sadMux_sel <= 0;
              D1_sadMem_control<=0; 
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b000010: 
            begin
            // SRL AluOP
    
              ALUOp <= 5'b00101;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b10;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              Alu_RS_mux <= 1;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b000110: 
            begin
            // SRLV aluop
              ALUOp <= 5'b10110;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
    
            end
    
            6'b101010: 
            begin
            // SLT ALUop
    
              ALUOp <= 5'b01111;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b001011: 
            begin
            // MOVN ALU OP Code
              ALUOp <= 5'b11010;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b001010: 
            begin
            // MOVZ AlUop Code
    
              ALUOp <= 5'b11001;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b000110:
            begin
            // ROTRV AlUop Code
    
              ALUOp <= 5'b00111;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
    
            end
    
            6'b000011: 
            begin
            // SRA ALUOP Code
    
              ALUOp <= 5'b11000;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
            end
    
            6'b000111: 
            begin
            // srav aluop code
    
              ALUOp <= 5'b10111;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b101011: 
            begin
            // SLTU ALUop Code
    
              ALUOp <= 5'b01111;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b010000: 
            begin
              /* MFHI AlUOP Code
              I have RegWrite on here. But i dont know if thats right. Can someone look at this?*/
    
              ALUOp <= 5'b00000;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 1;
              WriteDataLo <= 0;
              HiLoWB <= 1;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 1;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
    
            6'b010010:
            begin
              // MFLO ALUOP ( Even tho it doesnt use the ALU rofl
    
              ALUOp <= 5'b00000;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 1;
              HiLoWB <= 1;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
     default:
        begin
              ALUOp <= 5'b00000;
              RegDst <= 2'b00;
              SEH_Mux <= 2'b00;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 0;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
            //ending the funct code case.
          endcase
        end
        
      
       
        6'b001001:
        begin
              // ADDIu
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 0;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b001000:
        begin
          // ADDI 
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
          
    
        6'b011100:
        begin
          // MADD, MSUB, 
          if (FunctCode == 6'b000000) begin
          // MADD OP CODE
    
              ALUOp <= 5'b00010;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 1;
              HiLo_Zero <= 1;
              HiLoOut <= 0;
              WriteDataHi <= 1;
              WriteDataLo <= 1;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 1;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
    
          end
          else if (FunctCode == 6'b000100) begin
          // MSUB OP CODE
    
              ALUOp <= 5'b00010;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 1;
              HiLoOut <= 1;
              WriteDataHi <= 1;
              WriteDataLo <= 1;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 1;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
            
          end
          
          
          else if (FunctCode == 6'b000010) begin
          // MUL
              ALUOp <= 5'b00010;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
            end
          
          
        end
        
        6'b100011:
        begin
          // LW,
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 1;
              MemToReg <= 1;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b101011:
        begin
            // SW
              ALUOp <= 5'b00000;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 1;
              MemWrite <= 1;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b101000:
        begin
          //SB
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 1;
              MemWrite <= 1;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b10;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b100001:
        begin
          //LH
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 1;
              MemToReg <= 1;
              BitsIn <= 2'b01;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b100000:
        begin
          // LB
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 1;
              MemToReg <= 1;
              BitsIn <= 2'b10;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
        
        6'b101001:
        begin
          // SH
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 1;
              MemWrite <= 1;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b01;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b001111:
        begin
          //LUI
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 1;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 0;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b000001:
        begin
          //BGEZ
          if (instruction [16] == 1 ) begin
              ALUOp <= 5'b10100;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 1;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
          end
          
          else 
          begin
            //BLTZ
              ALUOp <= 5'b10000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 1;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0;
              D1_sadMem_control<=0; 
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
          end
        
        end
    
        6'b000100:
        begin
          //BEQ
              ALUOp <= 5'b10011;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 1'b0;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 1;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b000101:
        begin
          // BNE
              ALUOp <= 5'b10010;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 1;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
    
        6'b000111:
        begin
          // Bgtz
              ALUOp <= 5'b10001;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 1;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
    
        end
    
        6'b000110:
        begin
            //BLEZ
            ALUOp <= 5'b10101;
              RegDst<= 2'b01;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 1;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 1;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0;
              D1_sadMem_control<=0; 
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
        end
    
        6'b000010:
        begin
          //jump
              ALUOp <= 5'b00000;
              RegDst<= 2'b00;
              SEH_Mux <= 2'b01;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 1;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 1;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
        end
    
        6'b000011:
        begin
          //jal
          ALUOp <= 5'b00000;
          RegDst<= 2'b10;
          SEH_Mux <= 2'b01;
          RegWrite <= 1;
          ALUSrc <= 0;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b00;
          Branch_ALU_op <= 1;
          JAL_Mux <= 1;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 1;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0;
          D1_sadMem_control<=0; 
          D1_sadRegWrite <= 0;
          D1_minRegWrite <= 0;
          
        end 
    
        6'b001100:
        begin
    
          //ANDI
          ALUOp <= 5'b01000;
          RegDst<= 2'b00;
          SEH_Mux <= 2'b01;
          RegWrite <= 1;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b00;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 1;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0; 
          D1_sadMem_control<=0;
          D1_sadRegWrite <= 0;
          D1_minRegWrite <= 0;
          
        end
    
        6'b001101:
        begin
    
          // ORI
          ALUOp <= 5'b01001;
          RegDst<= 2'b00;
          SEH_Mux <= 2'b01;
          RegWrite <= 1;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b00;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 0;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0; 
          D1_sadMem_control<=0;
          D1_sadRegWrite <= 0;
          D1_minRegWrite <= 0;
          
        end
    
        6'b001110:
        begin
          // XORI
          ALUOp <= 5'b01010;
          RegDst<= 2'b00;
          SEH_Mux <= 2'b01;
          RegWrite <= 1;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b00;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 1;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0;
          D1_sadMem_control<=0; 
          D1_sadRegWrite <= 0;
          D1_minRegWrite <= 0;
          
        end
    
        6'b011111:
        begin
          // SEH
          ALUOp <= 5'b00000;
          RegDst<= 2'b01;
          SEH_Mux <= 2'b00;
          RegWrite <= 1;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b00;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 1;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0; 
          D1_sadMem_control<=0;
          D1_sadRegWrite <= 0;
          D1_minRegWrite <= 0;
          
        end
    
        6'b001010:
        begin
    
          // SLTI
          ALUOp <= 5'b01111;
          RegDst<= 2'b00;
          SEH_Mux <= 2'b01;
          RegWrite <= 1;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b00;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 1;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0;
          D1_sadMem_control<=0; 
          D1_sadRegWrite <= 0;
          D1_minRegWrite <= 0;
          
          
        end
        6'b011111:
        begin
          // SEB
          ALUOp <= 5'b00000;
          RegDst<= 2'b01;
          SEH_Mux <= 2'b01;
          RegWrite <= 1;
          ALUSrc <= 0;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b00;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 1;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0; 
          D1_sadMem_control<=0;
          D1_sadRegWrite <= 0;
          D1_minRegWrite <= 0;
          
          
        end
    
        6'b001011:
        begin
    
          // SLTIU
          ALUOp <= 5'b01111;
          RegDst<= 2'b00;
          SEH_Mux <= 2'b01;
          RegWrite <= 1;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b00;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 1;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0; 
          D1_sadMem_control<=0;
          D1_sadRegWrite <= 0;
          D1_minRegWrite <= 0;
          
        end
        6'b010000:
        //Custom Lw window
        begin
          ALUOp <= 5'b00000;
          RegDst<= 2'b01;
          SEH_Mux <= 2'b01;
          RegWrite <= 0;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b11;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 0;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0; 
          D1_sadMem_control<=1;
          D1_sadRegWrite <= 2'b01;
          D1_minRegWrite <= 0;
        end
        
        6'b010001:
        //Custom lw frame + calculate sad
        begin
          ALUOp <= 5'b00000;
          RegDst<= 2'b01;
          SEH_Mux <= 2'b01;
          RegWrite <= 0;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b11;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 0;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 1; 
          D1_sadMem_control<=1;
          D1_sadRegWrite <= 2'b11;
          D1_minRegWrite <= 1;
        end
        
        6'b010010:
        //retrieve min
        begin
          ALUOp <= 5'b00000;
          RegDst<= 2'b00;
          SEH_Mux <= 2'b01;
          RegWrite <= 1;
          ALUSrc <= 1;
          MemWrite <= 0;
          MemRead <= 0;
          MemToReg <= 0;
          BitsIn <= 2'b11;
          Branch_ALU_op <= 0;
          JAL_Mux <= 0;
          MAS_Control <= 0;
          HiLo_Zero <= 0;
          HiLoOut <= 0;
          WriteDataHi <= 0;
          WriteDataLo <= 0;
          HiLoWB <= 0;
          SeOpt <= 0;
          Sel_MAdd <= 0;
          HiLoSel <= 0;
          D1_sadMux_sel <= 0; 
          D1_sadMem_control<=0;
          D1_sadRegWrite <= 2'b00;
          D1_minRegWrite <= 0;
        end        
        
        
        default:
        begin
              ALUOp <= 5'b00000;
              RegDst <= 2'b00;
              SEH_Mux <= 2'b00;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 0;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
              
        end
        
    endcase
    if (instruction == 32'h00000000) begin
              ALUOp <= 5'b00000;
              RegDst <= 2'b00;
              SEH_Mux <= 2'b00;
              RegWrite <= 0;
              ALUSrc <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
              BitsIn <= 2'b00;
              Branch_ALU_op <= 0;
              JAL_Mux <= 0;
              MAS_Control <= 0;
              HiLo_Zero <= 0;
              HiLoOut <= 0;
              WriteDataHi <= 0;
              WriteDataLo <= 0;
              HiLoWB <= 0;
              SeOpt <= 0;
              Sel_MAdd <= 0;
              HiLoSel <= 0;
              D1_sadMux_sel <= 0; 
              D1_sadMem_control<=0;
              D1_sadRegWrite <= 0;
              D1_minRegWrite <= 0;
          
          end
  end




endmodule