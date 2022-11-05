`timescale 1ns / 1ps
/*

Group Names
Alan Manuel Loreto Corndidez: 33% Effort
Haseeb Sarwar Irfan: 33% Effort
Chris W Bremser: 33% Effort
Ali Akoglu: 1% to round out to 100%

*/


module TopLevel(Clk, Rst, v0, v1);

input Clk, Rst;
output  [31:0] v0;
output  [31:0] v1;

//
//
//Fetch Stage
//
//
wire [1:0] SEH_Mux;
wire [31:0]memToRegMuxOut;
wire [31:0]SE_byteOut;
wire [31:0]SE_halfWordOut;
wire [31:0]bitsInMuxOut;
wire [31:0]JAL_MuxOut;
wire [31:0]MaddMsubMuxOut;//MaddMsub mux and HiLoWb ALUHiResult
wire [31:0]hiLoWriteBackMuxOut;
//wire [31:0]PCAddyMux_F;
wire [31:0]PCOut;
wire [31:0]PCAddOut_F;
wire [31:0]Instruction_F;
//wire [31:0]PCAddyMux_D;
wire [31:0]PCAddOut_D;
wire [31:0]Instruction_D;
wire [31:0]Instruction_E;
wire [31:0]Instruction_M;
wire [31:0]Instruction_W;
wire [31:0]Trash;
wire [4:0]RegDstMuxOut;
wire [31:0]rt_D;
wire [31:0]SEHMuxOut;
wire [31:0]SignExtendOut;
wire [31:0]WriteData_D;
wire [31:0]Hi_D;
wire [31:0]Lo_D;
wire [31:0]rs_D;
wire BranchFlag_D;//Changed this to a 1 bit wire 10/26/2021 8:33 PM
wire [1:0]SelOP_D;
wire [27:0]shiftOut;
wire [31:0]PCAddyMux_E;
wire [31:0]JumpLink_E;
wire [31:0]PCPlusFour_E;
wire [31:0]Branch_E;
wire [31:0]BranchFlag_E;
wire [31:0]SelOP_E;
wire [31:0]rs_E;
wire [31:0]rt_E;
wire [31:0]Hi_E;
wire [31:0]Lo_E;
wire [31:0]Alu_A;
wire [31:0]EX_ALU_A;
wire [31:0]SignExtend_E;
wire [31:0]WriteData_E;
wire [31:0]BranchSignExtendOut;
wire [31:0]BranchMuxIn;
wire [31:0]ALUResult;
wire [31:0]ALUHiResult;
wire Zero;
wire [31:0]MemoryPR_to_PcAdd4PR;
wire [31:0]MemoryPR_to_Address;
wire [31:0]MemoryPR_to_memToRegPR;
wire [31:0]MemoryPR_to_WriteDataMem;
wire [63:0]MemoryPR_to_MaubMsub_input0_ALU;
wire [63:0]MemoryPR_to_MaubMsub_input1_ALU;
wire [31:0]MemoryPR_to_HiLo;
wire [31:0]writeBackPR_to_MemoryPR;
wire [31:0]ALUMuxOut;
wire [63:0]MaddMsubOut;
wire [31:0]ReadHiLo_E;
wire [63:0]HiLoMadd_E;
wire [31:0]writeBackPR_to_PcAdd4Mux;
wire [31:0]writeBackPR_to_in0_memToRegMux;
wire [31:0]writeBackPR_to_in1_memToRegMux;
wire [63:0]writeBackPR_to_MaddMsubMux;
wire [31:0]writebackPR_to_HiLoWbMux;
wire [31:0] dataMemoryOut;
wire [31:0] PCMuxOut;

// for output from register to send to FPGA the Coord's of SAD value
wire [31:0] _v0;
wire [31:0] _v1;

//wire ID_ALUOp;
//wire [3:0]ID_ALUSrc;
//wire ID_HiLo_Sel;
//wire ID_HiLo_Zero;
//wire ID_MemWrite;
//wire ID_MemRead;
//wire ID_MAS;
//wire ID_MemToReg;
wire [1:0]ID_BitsIn;//made this wire a 2 bit wire 10/26/2021, 8:36PM
//wire ID_Jal_Mux;
//wire ID_SEL_Madd;
//wire ID_HiLo_WB;
wire [4:0]ALUOp;
wire [4:0]EX_ALUOp;
wire EX_ALUSrc;
wire EX_HiLo_Sel;
wire EX_HiLo_Zero;
wire EX_MemWrite;
wire EX_MemRead;
wire EX_MAS;
wire EX_MemToReg;
wire [1:0]EX_BitsIn;
wire EX_Jal_Mux;
wire EX_SEL_Madd;
wire EX_HiLo_WB;
wire EX_RegWrite;

wire MEM1_MemWrite;
wire MEM1_MemRead;
wire MEM1_MAS;
wire MEM1_MemToReg;
wire [1:0]MEM1_BitsIn;
wire MEM1_Jal_Mux;
wire MEM1_SEL_Madd;
wire MEM1_HiLo_WB;
wire MEM_RegWrite;

wire WB_MemToReg;
wire [1:0]WB_BitsIn;
wire WB_Jal_Mux;
wire WB_SEL_Madd;
wire WB_HiLo_WB;
wire WB_RegWrite;

wire [4:0] ID_WriteRegCarry;
wire [4:0] EX_WriteRegCarry;
wire [4:0] MEM_WriteRegCarry;
wire [4:0] WB_WriteRegCarry;

wire WriteDataHi_E;
wire WriteDataLo_E;

wire WriteDataHi_M;
wire WriteDataLo_M;

wire WriteDataHi_W;
wire WriteDataLo_W;

wire Alu_RS_mux_D; 
wire Alu_RS_mux_E; 
/*
ALAN CHANGES to wires
*/
wire [1:0]RegDst;
wire [1:0]BitsIn;

wire WriteDataHi;
wire WriteDataLo;

wire flush;
wire flushMuxOut;

wire [4:0]in_ALUOp; 
wire [1:0]in_RegDst;
wire [1:0]in_SEH_Mux;
wire in_RegWrite;
wire in_ALUSrc;
wire in_MemWrite;
wire in_MemRead;
wire in_MemToReg; 
wire [1:0]in_BitsIn;
wire in_Branch_ALU_op;
wire in_JAL_Mux;
wire in_MAS_Control;
wire in_HiLo_Zero;
wire in_HiLoOut;
wire in_WriteDataHi;
wire in_WriteDataLo;
wire in_Sel_MAdd;
wire in_SeOpt;
wire in_HiLoSel;
wire in_HiLoWB; 
wire in_Alu_RS_mux;

wire hazardMuxControl;

wire PCWrite;
wire rt_forward_D;
wire rd_forward_D;
wire rs_forward_D;

wire rt_forward_E;
wire rd_forward_E;
wire rs_forward_E;

wire rt_rd_mux_out_D;
wire rt_rd_mux_out_M;

wire [4:0] X1_WriteRegCarry;
wire [4:0] X2_WriteRegCarry;
wire [4:0] X3_WriteRegCarry;

wire X1_RegWrite;
wire X2_RegWrite;
wire X3_RegWrite;






wire [31:0] X1_Instruction_W;
wire [31:0] X1_writeBackPR_to_PcAdd4Mux;
wire [31:0] X1_writeBackPR_to_in0_memToRegMux;
wire [31:0] X1_writeBackPR_to_in1_memToRegMux;
wire [63:0] X1_writeBackPR_to_MaddMsubMux;
wire [31:0] X1_writebackPR_to_HiLoWbMux;
wire X1_MemToReg;
wire [1:0] X1_BitsIn;
wire X1_Jal_Mux;
wire X1_SEL_Madd;
wire X1_HiLo_WB;
wire X1_WriteDataHi_W;
wire X1_WriteDataLo_W;

wire [31:0] X2_Instruction_W;
wire [31:0] X2_writeBackPR_to_PcAdd4Mux;
wire [31:0] X2_writeBackPR_to_in0_memToRegMux;
wire [31:0] X2_writeBackPR_to_in1_memToRegMux;
wire [63:0] X2_writeBackPR_to_MaddMsubMux;
wire [31:0] X2_writebackPR_to_HiLoWbMux;
wire X2_MemToReg;
wire [1:0] X2_BitsIn;
wire X2_Jal_Mux;
wire X2_SEL_Madd;
wire X2_HiLo_WB;
wire X2_WriteDataHi_W;
wire X2_WriteDataLo_W;

wire [31:0] X3_Instruction_W;
wire [31:0] X3_writeBackPR_to_PcAdd4Mux;
wire [31:0] X3_writeBackPR_to_in0_memToRegMux;
wire [31:0] X3_writeBackPR_to_in1_memToRegMux;
wire [63:0] X3_writeBackPR_to_MaddMsubMux;
wire [31:0] X3_writebackPR_to_HiLoWbMux;
wire X3_MemToReg;
wire [1:0] X3_BitsIn;
wire X3_Jal_Mux;
wire X3_SEL_Madd;
wire X3_HiLo_WB;
wire X3_WriteDataHi_W;
wire X3_WriteDataLo_W;

wire D1_sadMux_sel; 
wire D2_sadMux_sel;
wire EX_sadMux_sel;
wire MEM_sadMux_sel;

wire D1_sadMem_control;
wire D2_sadMem_control;
wire EX_sadMem_control;
wire MEM_sadMem_control;

wire [31:0]sadMux0_Out;
wire [31:0]sadMux1_Out;
wire [31:0]sadMux2_Out;
wire [31:0]sadMux3_Out;
wire [31:0]sadMux4_Out;
wire [31:0]sadMux5_Out;
wire [31:0]sadMux6_Out;
wire [31:0]sadMux7_Out;
wire [31:0]sadMux8_Out;
wire [31:0]sadMux9_Out;
wire [31:0]sadMux10_Out;
wire [31:0]sadMux11_Out;
wire [31:0]sadMux12_Out;
wire [31:0]sadMux13_Out;
wire [31:0]sadMux14_Out;
wire [31:0]sadMux15_Out;

wire [31:0]sadMem0_out;
wire [31:0]sadMem1_out;
wire [31:0]sadMem2_out;
wire [31:0]sadMem3_out;
wire [31:0]sadMem4_out;
wire [31:0]sadMem5_out;
wire [31:0]sadMem6_out;
wire [31:0]sadMem7_out;
wire [31:0]sadMem8_out;
wire [31:0]sadMem9_out;
wire [31:0]sadMem10_out;
wire [31:0]sadMem11_out;
wire [31:0]sadMem12_out;
wire [31:0]sadMem13_out;
wire [31:0]sadMem14_out;
wire [31:0]sadMem15_out;


wire [31:0] X1_sadMem0_out;
wire [31:0] X1_sadMem1_out;
wire [31:0] X1_sadMem2_out;
wire [31:0] X1_sadMem3_out;
wire [31:0] X1_sadMem4_out;
wire [31:0] X1_sadMem5_out;
wire [31:0] X1_sadMem6_out;
wire [31:0] X1_sadMem7_out;
wire [31:0] X1_sadMem8_out;
wire [31:0] X1_sadMem9_out;
wire [31:0] X1_sadMem10_out;
wire [31:0] X1_sadMem11_out;
wire [31:0] X1_sadMem12_out;
wire [31:0] X1_sadMem13_out;
wire [31:0] X1_sadMem14_out;
wire [31:0] X1_sadMem15_out;

wire [1:0] D1_sadRegWrite;
wire [1:0] D2_sadRegWrite;
wire [1:0] EX_sadRegWrite;
wire [1:0] MEM_sadRegWrite;
wire [1:0] X1_sadRegWrite;

wire [31:0] OutFrameRegister0;
wire [31:0] OutFrameRegister1;
wire [31:0] OutFrameRegister2;
wire [31:0] OutFrameRegister3;
wire [31:0] OutFrameRegister4;
wire [31:0] OutFrameRegister5;
wire [31:0] OutFrameRegister6;
wire [31:0] OutFrameRegister7;
wire [31:0] OutFrameRegister8;
wire [31:0] OutFrameRegister9;
wire [31:0] OutFrameRegister10;
wire [31:0] OutFrameRegister11;
wire [31:0] OutFrameRegister12;
wire [31:0] OutFrameRegister13;
wire [31:0] OutFrameRegister14;
wire [31:0] OutFrameRegister15;

wire [31:0] OutWindowRegister0;
wire [31:0] OutWindowRegister1;
wire [31:0] OutWindowRegister2;
wire [31:0] OutWindowRegister3;
wire [31:0] OutWindowRegister4;
wire [31:0] OutWindowRegister5;
wire [31:0] OutWindowRegister6;
wire [31:0] OutWindowRegister7;
wire [31:0] OutWindowRegister8;
wire [31:0] OutWindowRegister9;
wire [31:0] OutWindowRegister10;
wire [31:0] OutWindowRegister11;
wire [31:0] OutWindowRegister12;
wire [31:0] OutWindowRegister13;
wire [31:0] OutWindowRegister14;
wire [31:0] OutWindowRegister15;

wire [31:0] Subber0_out;
wire [31:0] Subber1_out;
wire [31:0] Subber2_out;
wire [31:0] Subber3_out;
wire [31:0] Subber4_out;
wire [31:0] Subber5_out;
wire [31:0] Subber6_out;
wire [31:0] Subber7_out;
wire [31:0] Subber8_out;
wire [31:0] Subber9_out;
wire [31:0] Subber10_out;
wire [31:0] Subber11_out;
wire [31:0] Subber12_out;
wire [31:0] Subber13_out;
wire [31:0] Subber14_out;
wire [31:0] Subber15_out;

wire [31:0] X2_Subber0_out;
wire [31:0] X2_Subber1_out;
wire [31:0] X2_Subber2_out;
wire [31:0] X2_Subber3_out;
wire [31:0] X2_Subber4_out;
wire [31:0] X2_Subber5_out;
wire [31:0] X2_Subber6_out;
wire [31:0] X2_Subber7_out;
wire [31:0] X2_Subber8_out;
wire [31:0] X2_Subber9_out;
wire [31:0] X2_Subber10_out;
wire [31:0] X2_Subber11_out;
wire [31:0] X2_Subber12_out;
wire [31:0] X2_Subber13_out;
wire [31:0] X2_Subber14_out;
wire [31:0] X2_Subber15_out;

wire [31:0] sad_add_a0_out;
wire [31:0] sad_add_a1_out;
wire [31:0] sad_add_a2_out;
wire [31:0] sad_add_a3_out;
wire [31:0] sad_add_a4_out;
wire [31:0] sad_add_a5_out;
wire [31:0] sad_add_a6_out;
wire [31:0] sad_add_a7_out;

wire [31:0] sad_add_b0_out;
wire [31:0] sad_add_b1_out;
wire [31:0] sad_add_b2_out;
wire [31:0] sad_add_b3_out;

wire [31:0] X3_sad_add_b0_out;
wire [31:0] X3_sad_add_b1_out;
wire [31:0] X3_sad_add_b2_out;
wire [31:0] X3_sad_add_b3_out;

wire [31: 0] sad_add_c0_out;
wire [31: 0] sad_add_c1_out;

wire [31: 0] sad_add_d0_out;

wire [31: 0] WB_sad_add_c0_out;

wire [31:0] sad_Comparitor_out;

wire WB_minRegWrite;
wire X3_minRegWrite;
wire X2_minRegWrite;
wire X1_minRegWrite;
wire MEM_minRegWrite;
wire EX_minRegWrite;
wire D2_minRegWrite;
wire D1_minRegWrite;
wire [31:0] X3_minVal; 
wire [31:0]WB_sad_add_d0_out;
wire [31:0]WB_minVal;

/*
End of alan changes to wires*/

ProgramCounter PCComponent(
    .PCIn(PCMuxOut),
    .PCOut(PCOut),
    .Clk(Clk),
    .Reset(Rst),
    .PCWrite(PCWrite)
);

Mux_PC PCFeeder(
    .out(PCMuxOut),
    .inA(PCAddOut_F),
    .inB(PCAddyMux_E),
    .sel(SelOP_D[1]||SelOP_D[0])
);

//Adder4_32Bit(in, out);
Add4_32Bit PCAdd(
    .in(PCOut),
    .out(PCAddOut_F)
);



//InstructionMemory(Address, Instruction);
InstructionMemory IM(PCOut, Instruction_F);

//
//
//Decode Stage
//
//

//Mux_1Bit_2To1(out, inA, inB, select);
Mux_1Bit_2To1 flushMux(flushMuxOut, Rst, 1'b1, flush);


//IF_ID_piplineRegister(IF_PCAdd4, IF_InstructionMemory, ID_PCAdd4, ID_InstructionMemory, Clk, Reset);
IF_ID_piplineRegister FDPipelineReg (PCAddOut_F, Instruction_F, PCAddOut_D, Instruction_D, Clk, flushMuxOut,IF_ID_Write );


//Mux4to1(out, inA, inB, inC, inD, sel);
Mux_5Bit_4To1 RegDstMux( RegDstMuxOut, Instruction_D[20:16], Instruction_D[15:11], 5'b11111, 5'b0, RegDst);
//5'b00000 represents trash

//Mux4to1(out, inA, inB, inC, inD, sel);
Mux_32Bit_4To1 SEHMuxComponent(SEHMuxOut, rt_D, {16'b0,Instruction_D[15:0]},{27'b0,Instruction_D[10:6]}, 32'b0, SEH_Mux);//Changed the capital letter
//5'b00000 represents trash

//SignExtension(in, out)
SignExtension_16Bit_to_32_bit SignExtend(SEHMuxOut[15:0], SignExtendOut, SeOpt);


//hiLoRegister(dataIn, dataOut, WriteEnable, Clk);
hiLoRegister Hi(writeBackPR_to_MaddMsubMux[63:32], Hi_D, WriteDataHi_W, Clk,Rst);


//hiLoRegister(dataIn, dataOut, WriteEnable, Clk);
hiLoRegister Lo(hiLoWriteBackMuxOut, Lo_D, WriteDataLo_W, Clk, Rst);


//RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
RegisterFile Register(Instruction_D[25:21], Instruction_D[20:16], WB_WriteRegCarry, hiLoWriteBackMuxOut, WB_RegWrite, Clk, rs_D, rt_D, Rst,_v0,_v1);


//Branch_ALU(input [5:0]rs, input [5:0]rt, input [5:0]opcode, input control, branchFlag, [1:0]SEL_OP);
Branch_ALU BlackBox(.instruction(Instruction_D),
        .rs(rs_D),
        .rt(rt_D),
        .opcode(Instruction_D[31:26]),
        .control(Branch_ALU_op),
        .branchFlag(BranchFlag_D),
        .SEL_OP( SelOP_D));

//ShiftLeft2_26Bit(in, out);
ShiftLeft2_26Bit shift1(.in(Instruction_D[25:0]), .out(shiftOut));


//AAAAaaaaAAAAAaaaAAHHHHhhhhhhhHHHHHHHhhhhHHHHH 
//FIX THIS!!!!!!!!
//module Controller(instruction, Clk, ALUOp, RegDst, SEH_Mux, RegWrite, ALUSrc,
//MemWrite, MemRead, MemToReg, BitsIn, Branch_ALU_op, JAL_Mux, MAS_Control, HiLo_Zero,
//HiLoOut, WriteDataHi, WriteDataLo, HiLoWB, SeOpt, Sel_MAdd, HiLoSel);
Controller ControllerModule(Instruction_D, in_ALUOp, in_RegDst, in_SEH_Mux, in_RegWrite, in_ALUSrc,
 in_MemWrite, in_MemRead, in_MemToReg, in_BitsIn, in_Branch_ALU_op, in_JAL_Mux, in_MAS_Control, in_HiLo_Zero,
 in_HiLoOut, in_WriteDataHi, in_WriteDataLo, in_HiLoWB, in_SeOpt, in_Sel_MAdd, in_HiLoSel, in_Alu_RS_mux_D,
 D1_sadMux_sel,D1_sadMem_control,D1_sadRegWrite, D1_minRegWrite
 );
 
hazardDetection Hazard_Detection(
   .RegDst(RegDst),
   .ID_EX_Rt(rt_E),
   .IF_ID_Rs(Instruction_D[25:21]),
   .IF_ID_Rt(Instruction_D[20:16]),
   .Sel_Op(SelOP_D),
   .ID_EX_memRead(EX_MemRead),
   .PC_Write(PCWrite),
   .flush(flush),
   .IF_ID_Write(IF_ID_Write),
   .hazardMuxControl(hazardMuxControl),
   .OpCode(Instruction_D[31:26]),
   
   .EX_WriteRegCarry(EX_WriteRegCarry),
   .MEM_WriteRegCarry(MEM_WriteRegCarry),
   .WB_WriteRegCarry(WB_WriteRegCarry),
   .X1_WriteRegCarry(X1_WriteRegCarry),
   .X2_WriteRegCarry(X2_WriteRegCarry),
   .X3_WriteRegCarry(X3_WriteRegCarry),
   .EX_RegWrite(EX_RegWrite),
   .MEM_RegWrite(MEM_RegWrite),
   .WB_RegWrite(WB_RegWrite),
   .X1_RegWrite(X1_RegWrite),
   .X2_RegWrite(X2_RegWrite),
   .X3_RegWrite(X3_RegWrite)
   
);

HazardMux Hazard_MUX(
.ALUOp(ALUOp),
.RegDst(RegDst),
.SEH_Mux(SEH_Mux),
.RegWrite(RegWrite),
.ALUSrc(ALUSrc),
.MemWrite(MemWrite),
.MemRead(MemRead),
.MemToReg(MemToReg),
.BitsIn(BitsIn),
.Branch_ALU_op(Branch_ALU_op),
.JAL_Mux(JAL_Mux),
.MAS_Control(MAS_Control),
.HiLo_Zero(HiLo_Zero),
.HiLoOut(HiLoOut),
.WriteDataHi(WriteDataHi),
.WriteDataLo(WriteDataLo),
.HiLoWB(HiLoWB),
.SeOpt(SeOpt),
.Sel_MAdd(Sel_MAdd),
.HiLoSel(HiLoSel),
.Alu_RS_mux(Alu_RS_mux_D),
.D2_sadMux_sel(D2_sadMux_sel),
.D2_sadMem_control(D2_sadMem_control),
.D2_sadRegWrite(D2_sadRegWrite),
.D2_minRegWrite(D2_minRegWrite),

.in_ALUOp(in_ALUOp),
.in_RegDst(in_RegDst),
.in_SEH_Mux(in_SEH_Mux),
.in_RegWrite(in_RegWrite),
.in_ALUSrc(in_ALUSrc),
.in_MemWrite(in_MemWrite),
.in_MemRead(in_MemRead),
.in_MemToReg(in_MemToReg),
.in_BitsIn(in_BitsIn),
.in_Branch_ALU_op(in_Branch_ALU_op),
.in_JAL_Mux(in_JAL_Mux),
.in_MAS_Control(in_MAS_Control),
.in_HiLo_Zero(in_HiLo_Zero),
.in_HiLoOut(in_HiLoOut),
.in_WriteDataHi(in_WriteDataHi),
.in_WriteDataLo(in_WriteDataLo),
.in_HiLoWB(in_HiLoWB),
.in_SeOpt(in_SeOpt),
.in_Sel_MAdd(in_Sel_MAdd),
.in_HiLoSel(in_HiLoSel),
.in_Alu_RS_mux(in_Alu_RS_mux_D),
.HazardControl(hazardMuxControl),
.D1_sadMux_sel(D1_sadMux_sel),
.D1_sadMem_control(D1_sadMem_control),
.D1_sadRegWrite(D1_sadRegWrite),
.D1_minRegWrite(D1_minRegWrite)
);



//ShiftLeft2_32Bit(in, out)
ShiftLeft2_32Bit shift2(SignExtendOut, BranchSignExtendOut);

//Adder_32Bit(inA, inB, out);
Adder_32Bit BranchAdd(PCAddOut_D, BranchSignExtendOut, BranchMuxIn);

//Mux4to1(out, inA, inB, inC, inD, sel);
Mux_32Bit_4To1 BranchMuxComponent(PCAddyMux_E, PCAddOut_D, {PCAddOut_D[31:28],shiftOut[27:0]}, BranchMuxIn, rs_D, SelOP_D);




// ID_EX_piplineRegister(ID_jumplyAC, ID_PCAdd4, ID_Branch, ID_BranchFlag, ID_SelOp, ID_ReadData1, ID_ReadData2, ID_Hi,
// ID_Lo, ID_SignExtentsion, EX_PCAddyMux, EX_jumplyAC, EX_PCAdd4, EX_Branch, EX_BranchFlag, EX_SelOp, EX_ReadData1, EX_ReadData2,
// EX_Hi, EX_Lo, EX_SignExtentsion, Clk);

//ID_EX_piplineRegister DE_Pipeline({PCAddOut_D,shiftOut}, PCAddOut_D, PCAddOut_D, BranchFlag_D, SelOP_D, rs_D, rt_D, Hi_D,
 //Lo_D, SignExtendOut, JumpLink_E, PCPlusFour_E, Branch_E, BranchFlag_E, SelOP_E, rs_E, rt_E,
 //Hi_E, Lo_E, SignExtend_E, Clk);
 
 ID_EX_piplineRegister DE_Pipeline(
    //.ID_jumplyAC({PCAddOut_D[31:28],shiftOut[27:0]}),//take 4 most significant from pc out and the shifted bits from the output of the shift left module.
    .ID_Instruction(Instruction_D),
    .ID_PCAdd4(PCAddOut_D),
    //.ID_Branch(PCAddOut_D),
    //.ID_BranchFlag( BranchFlag_D),
    //.ID_SelOp(SelOP_D),
    .ID_ReadData1(rs_D),
    .ID_ReadData2(rt_D),
    .ID_Hi(Hi_D),
    .ID_Lo(Lo_D),
    .ID_SignExtentsion(SignExtendOut),
    .ID_WriteRegCarry(RegDstMuxOut),
    .D2_sadRegWrite(D2_sadRegWrite),
    .D2_minRegWrite(D2_minRegWrite),
    //Controls
    
    .ID_ALUOp(ALUOp),
	.ID_ALUSrc(ALUSrc),
	.ID_HiLo_Sel(HiLoSel),
	.ID_HiLo_Zero(HiLo_Zero),
	.ID_MemWrite(MemWrite),
	.ID_MemRead(MemRead),
	.ID_MAS(MAS_Control),
	.ID_MemToReg(MemToReg),
	.ID_BitsIn(BitsIn),
	.ID_Jal_Mux(JAL_Mux),
	.ID_SEL_Madd(Sel_MAdd),
	.ID_HiLo_WB(HiLoWB),
	.ID_RegWrite(RegWrite),
	.ID_WriteDataHi(WriteDataHi),
	.ID_WriteDataLo(WriteDataLo),
	.ID_Alu_RS_mux_D(Alu_RS_mux_D),
    .D2_sadMux_sel(D2_sadMux_sel),
    .D2_sadMem_control(D2_sadMem_control),
   
    
    .EX_Instruction(Instruction_E),
//EX_jumplyAC(JumpLink_E),
    .EX_PCAdd4(PCPlusFour_E),
   // .EX_Branch(Branch_E),
    //.EX_BranchFlag(BranchFlag_E),
    //.EX_SelOp(SelOP_E),
    .EX_ReadData1(rs_E),
    .EX_ReadData2(rt_E),
    .EX_Hi(Hi_E),
    .EX_Lo(Lo_E),
    .EX_SignExtentsion(SignExtend_E),
    .EX_WriteRegCarry(EX_WriteRegCarry),
    .EX_sadRegWrite(EX_sadRegWrite),

    
    //controls
    .EX_ALUOp(EX_ALUOp),
	.EX_ALUSrc(EX_ALUSrc),
	.EX_HiLo_Sel(EX_HiLo_Sel),
	.EX_HiLo_Zero(EX_HiLo_Zero),
	.EX_MemWrite(EX_MemWrite),
	.EX_MemRead(EX_MemRead),
	.EX_MAS(EX_MAS),
	.EX_MemToReg(EX_MemToReg),
	.EX_BitsIn(EX_BitsIn),
	.EX_Jal_Mux(EX_Jal_Mux),
	.EX_SEL_Madd(EX_SEL_Madd),
	.EX_HiLo_WB(EX_HiLo_WB),
	.EX_RegWrite(EX_RegWrite),
	.EX_WriteDataHi(WriteDataHi_E),
	.EX_WriteDataLo(WriteDataLo_E),
	.EX_Alu_RS_mux_D(Alu_RS_mux_E),
	.EX_sadMux_sel(EX_sadMux_sel),
	.EX_sadMem_control(EX_sadMem_control),
	.EX_minRegWrite(EX_minRegWrite),
    
    .Clk(Clk), //Yes, the registers are clocked.
    .Reset(Rst)
    );

//
//
//Execute Stage
//
//







//Mux_32Bit_2To1(out, inA, inB, select);
Mux_32Bit_2To1 ALUSrcMux (ALUMuxOut, rt_E, SignExtend_E, EX_ALUSrc);

//Mux_32Bit_2To1(out, inA, inB, select);
Mux_32Bit_2To1 SLMUX (Alu_A, rs_E, SignExtend_E, Alu_RS_mux_E);

//ALU32Bit(ALUControl, A, B, ALUResult, ALUHiResult, Zero);
ALU32Bit ALU(EX_ALUOp, Alu_A, ALUMuxOut, ALUResult, ALUHiResult, Zero);


//Mux_32Bit_2To1(out, inA, inB, select);
Mux_32Bit_2To1 HiLoReadMux(ReadHiLo_E, Lo_E, Hi_E, HiLoSel);


//Mux_32Bit_2To1(out, inA, inB, select);
Mux_64Bit_2To1 HiLoZeroMux(HiLoMadd_E, 64'h0000000000000000, {Hi_E,Lo_E}, EX_HiLo_Zero);


//list of things to put in exmem pipeline input in order
//
//EX_PC_Add4        PCPlusFour_E
//EX_Address        ALUResult
//EX_toMemToReg     ALUResult
//EX_Rt             rt_E
//EX_ALUResult      {ALUHiResult, ALUResult}
//EX_HiLoMadd       HiLoMadd_E
//EX_ReadHiLo       ReadHiLo_E
//EX_WriteData      WriteData_E
//


/*
 *
 *
 *
 *
 *
 *
*/

/*Pipline register between execute stage and memory stage.*/
/*These are the wires that are outputting from the pipeline registers*/
//this is the write data going back.
/****************************************************************/

EX_MEM_piplineRegister EM_MEM(
    .EX_Instruction(Instruction_E),
    .EX_PC_Add4(PCPlusFour_E),
    .EX_Address(ALUResult[31:0]),
    .EX_toMemToReg(ALUResult[31:0]),
    .EX_Rt(rt_E),
    .EX_ALUResult({ALUHiResult, ALUResult}),
    .EX_HiLoMadd(HiLoMadd_E),
    .EX_ReadHiLo(ReadHiLo_E),
    .EX_sadRegWrite(EX_sadRegWrite),
    
    .EX_MemWrite(EX_MemWrite),
	.EX_MemRead(EX_MemRead),
	.EX_MAS(EX_MAS),
	.EX_MemToReg(EX_MemToReg),
	.EX_BitsIn(EX_BitsIn),
	.EX_Jal_Mux(EX_Jal_Mux),
	.EX_SEL_Madd(EX_SEL_Madd),
	.EX_HiLo_WB(EX_HiLo_WB),
	.EX_RegWrite(EX_RegWrite),
	.EX_WriteRegCarry(EX_WriteRegCarry),
	.EX_WriteDataHi(WriteDataHi_E),
	.EX_WriteDataLo(WriteDataLo_E),
	.EX_sadMux_sel(EX_sadMux_sel),
	.EX_sadMem_control(EX_sadMem_control),
	.EX_minRegWrite(EX_minRegWrite),

    .MEM_Instruction(Instruction_M),
    .MEM_PC_Add4(MemoryPR_to_PcAdd4PR),//goes to the mem_wb pipline register.
    .MEM_Address(MemoryPR_to_Address),//goes to the address field of the data memory.
    .MEM_toMemToReg(MemoryPR_to_memToRegPR),//goes to the mem to reg pipeline register.
    .MEM_Rt(MemoryPR_to_WriteDataMem),//goes to the write data field of the data memory.
    .MEM_ALUResult(MemoryPR_to_MaubMsub_input0_ALU),//goes to the top input of the MaddMsubALU
    .MEM_HiLoMadd(MemoryPR_to_MaubMsub_input1_ALU),//goes to the bottom input of the MaddMsubALU
    .MEM_ReadHiLo(MemoryPR_to_HiLo),//goes to the mem_wb pipline register.
    .MEM_sadRegWrite(MEM_sadRegWrite),
    
    .MEM_MemWrite(MEM1_MemWrite),
	.MEM_MemRead(MEM1_MemRead),
	.MEM_MAS(MEM1_MAS),
	.MEM_MemToReg(MEM1_MemToReg),
	.MEM_BitsIn(MEM1_BitsIn),
	.MEM_Jal_Mux(MEM1_Jal_Mux),
	.MEM_SEL_Madd(MEM1_SEL_Madd),
	.MEM_HiLo_WB(MEM1_HiLo_WB),
	.MEM_RegWrite(MEM_RegWrite),
	.MEM_WriteRegCarry(MEM_WriteRegCarry),
	.MEM_WriteDataHi(WriteDataHi_M),
	.MEM_WriteDataLo(WriteDataLo_M),
	.MEM_sadMux_sel(MEM_sadMux_sel),
	.MEM_sadMem_control(MEM_sadMem_control),
	.MEM_minRegWrite(MEM_minRegWrite),
    
    .Clk(Clk),
    .Reset(Rst)

);


/*Execution Stage of the pipeline*/


Adder_Subtractor_64Bit MaddMsubAdderSubtractor(
    .inA(MemoryPR_to_MaubMsub_input0_ALU),
    .inB(MemoryPR_to_MaubMsub_input1_ALU),
    .out(MaddMsubOut),
    .control(MEM1_MAS)
);



DataMemory memory(
    .Address(MemoryPR_to_Address),
    .WriteData(MemoryPR_to_WriteDataMem),
    .Clk(Clk),
    .MemWrite(MEM1_MemWrite),//control signal
    .MemRead(MEM1_MemRead),//control signal
    .ReadData(dataMemoryOut)//goes to the mem_wb pipline register
); 

// TODO Send values from reg through pipelines for a2 and s7

//Sad Muxes: 0-15 
//1
sadMemoryMux sadMux0(
 .address(MemoryPR_to_Address), 
 .inA(32'd0),
 .inB(32'd0), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux0_Out)
 );
 
 //2
 sadMemoryMux sadMux1(
 .address(MemoryPR_to_Address), 
 .inA(32'd4),
 .inB(32'd4), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux1_Out)
 );
 
 //3
 sadMemoryMux sadMux2(
 .address(MemoryPR_to_Address), 
 .inA(32'd8),
 .inB(32'd8), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux2_Out)
 );
 
 //4
 sadMemoryMux sadMux3(
 .address(MemoryPR_to_Address), 
 .inA(32'd12),
 .inB(32'd12), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux3_Out)
 );
 
 //5
 sadMemoryMux sadMux4(
 .address(MemoryPR_to_Address), 
 .inA(32'd16),
 .inB(32'd256), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux4_Out)
 );
 
 //6
 sadMemoryMux sadMux5(
 .address(MemoryPR_to_Address), 
 .inA(32'd20),
 .inB(32'd260), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux5_Out)
 );
 
 //7
 sadMemoryMux sadMux6(
 .address(MemoryPR_to_Address), 
 .inA(32'd24),
 .inB(32'd264), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux6_Out)
 );
 
 //8
 sadMemoryMux sadMux7(
 .address(MemoryPR_to_Address), 
 .inA(32'd28),
 .inB(32'd268), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux7_Out)
 );
 
 //9
 sadMemoryMux sadMux8(
 .address(MemoryPR_to_Address), 
 .inA(32'd32),
 .inB(32'd512), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux8_Out)
 );
 
 //10
 sadMemoryMux sadMux9(
 .address(MemoryPR_to_Address), 
 .inA(32'd36),
 .inB(32'd516), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux9_Out)
 );
 
 //11
 sadMemoryMux sadMux10(
 .address(MemoryPR_to_Address), 
 .inA(32'd40),
 .inB(32'd520), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux10_Out)
 );
 
 //12
 sadMemoryMux sadMux11(
 .address(MemoryPR_to_Address), 
 .inA(32'd44),
 .inB(32'd524), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux11_Out)
 );
 
 //13
 sadMemoryMux sadMux12(
 .address(MemoryPR_to_Address), 
 .inA(32'd48),
 .inB(32'd768), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux12_Out)
 );
 
 //14
 sadMemoryMux sadMux13(
 .address(MemoryPR_to_Address), 
 .inA(32'd52),
 .inB(32'd772), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux13_Out)
 );
 
 //15
 sadMemoryMux sadMux14(
 .address(MemoryPR_to_Address), 
 .inA(32'd56),
 .inB(32'd776), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux14_Out)
 );
 
 //16
 sadMemoryMux sadMux15(
 .address(MemoryPR_to_Address), 
 .inA(32'd60),
 .inB(32'd780), 
 .sel(MEM_sadMux_sel),
 .outReg(sadMux15_Out)
 );


// Sad Memories 0-15

//1
SADMemory sadMem0(
.Address(sadMux0_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem0_out)
 );
 
 //2
SADMemory sadMem1(
.Address(sadMux1_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem1_out)
 );

//3
SADMemory sadMem2(
.Address(sadMux2_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem2_out)
 );

//4
SADMemory sadMem3(
.Address(sadMux3_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem3_out)
 );

//5
SADMemory sadMem4(
.Address(sadMux4_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem4_out)
 );

//6
SADMemory sadMem5(
.Address(sadMux5_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem5_out)
 );

//7
SADMemory sadMem6(
.Address(sadMux6_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem6_out)
 );

//8
SADMemory sadMem7(
.Address(sadMux7_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem7_out)
 );

//9
SADMemory sadMem8(
.Address(sadMux8_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem8_out)
 );


//10
SADMemory sadMem9(
.Address(sadMux9_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem9_out)
 );

//11
SADMemory sadMem10(
.Address(sadMux10_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem10_out)
 );
 
//12
SADMemory sadMem11(
.Address(sadMux11_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem11_out)
 );

//13
SADMemory sadMem12(
.Address(sadMux12_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem12_out)
 );

//14
SADMemory sadMem13(
.Address(sadMux13_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem13_out)
 );

//15
SADMemory sadMem14(
.Address(sadMux14_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem14_out)
 );
 
 //16
SADMemory sadMem15(
.Address(sadMux15_Out),
.Clk(Clk),
.MemRead(MEM_sadMem_control),
.ReadData(sadMem15_out)
 );





/*Pipline register between memory stage and writeback stage.*/

/*These are the wires that are outputting from the pipeline registers*/

/****************************************************************/

//Declaration of the pipleine register
MEM_X1_pipelineRegister MEM_X1(
    .MEM_Instruction(Instruction_M),
    .MEM_PCAdd4(MemoryPR_to_PcAdd4PR),//comes from ex_mem pipepline register
    .MEM_DataMemOut(dataMemoryOut),//comes from data memory
    .MEM_ALUOut(MemoryPR_to_memToRegPR),//comes from the 64 bit adder and subtractor
    .MEM_MaddOut(MaddMsubOut),
    .MEM_HiLoOut(MemoryPR_to_HiLo),
    .MEM_MemToReg(MEM1_MemToReg),
	.MEM_BitsIn(MEM1_BitsIn),
	.MEM_Jal_Mux(MEM1_Jal_Mux),
	.MEM_SEL_Madd(MEM1_SEL_Madd),
	.MEM_HiLo_WB(MEM1_HiLo_WB),//HiLoWB
	.MEM_RegWrite(MEM_RegWrite),
	.MEM_WriteRegCarry(MEM_WriteRegCarry),
	
	.MEM_WriteDataHi(WriteDataHi_M),
	.MEM_WriteDataLo(WriteDataLo_M),
    .MEM_sadRegWrite(MEM_sadRegWrite),
	
	.MEM_sadMem0_out(sadMem0_out),
	.MEM_sadMem1_out(sadMem1_out),
	.MEM_sadMem2_out(sadMem2_out),
	.MEM_sadMem3_out(sadMem3_out),
	.MEM_sadMem4_out(sadMem4_out),
	.MEM_sadMem5_out(sadMem5_out),
	.MEM_sadMem6_out(sadMem6_out),
	.MEM_sadMem7_out(sadMem7_out),
	.MEM_sadMem8_out(sadMem8_out),
	.MEM_sadMem9_out(sadMem9_out),
	.MEM_sadMem10_out(sadMem10_out),
	.MEM_sadMem11_out(sadMem11_out),
	.MEM_sadMem12_out(sadMem12_out),
	.MEM_sadMem13_out(sadMem13_out),
	.MEM_sadMem14_out(sadMem14_out),
	.MEM_sadMem15_out(sadMem15_out),
	.MEM_minRegWrite(MEM_minRegWrite),
		
    .X1_Instruction(X1_Instruction_W),
    .X1_PCAdd4(X1_writeBackPR_to_PcAdd4Mux),//goes to the jal_Mux
    .X1_DataMemOut(X1_writeBackPR_to_in0_memToRegMux),//goes to input 1 of the mem to reg mux
    .X1_ALUOut(X1_writeBackPR_to_in1_memToRegMux), //goes to input 2 of the mem to reg mux
    .X1_MaddOut(X1_writeBackPR_to_MaddMsubMux),//goes to input of MaddMsub mux
    .X1_HiLoOut(X1_writebackPR_to_HiLoWbMux),//goes to input of HiLoWb mux
    .X1_MemToReg(X1_MemToReg),
	.X1_BitsIn(X1_BitsIn),
	.X1_Jal_Mux(X1_Jal_Mux),
	.X1_SEL_Madd(X1_SEL_Madd),
	.X1_HiLo_WB(X1_HiLo_WB),
	.X1_RegWrite(X1_RegWrite),
	.X1_WriteRegCarry(X1_WriteRegCarry),
	
	.X1_WriteDataHi(X1_WriteDataHi_W),
	.X1_WriteDataLo(X1_WriteDataLo_W),
	.X1_sadRegWrite(X1_sadRegWrite),
	
	.X1_sadMem0_out(X1_sadMem0_out),
	.X1_sadMem1_out(X1_sadMem1_out),
	.X1_sadMem2_out(X1_sadMem2_out),
	.X1_sadMem3_out(X1_sadMem3_out),
	.X1_sadMem4_out(X1_sadMem4_out),
	.X1_sadMem5_out(X1_sadMem5_out),
	.X1_sadMem6_out(X1_sadMem6_out),
	.X1_sadMem7_out(X1_sadMem7_out),
	.X1_sadMem8_out(X1_sadMem8_out),
	.X1_sadMem9_out(X1_sadMem9_out),
	.X1_sadMem10_out(X1_sadMem10_out),
	.X1_sadMem11_out(X1_sadMem11_out),
	.X1_sadMem12_out(X1_sadMem12_out),
	.X1_sadMem13_out(X1_sadMem13_out),
	.X1_sadMem14_out(X1_sadMem14_out),
	.X1_sadMem15_out(X1_sadMem15_out),
	.X1_minRegWrite(X1_minRegWrite),
	
    .Clk(Clk),
    .Reset(Rst)

);

/*X1 stage*/


SadRegister SadRegister(

.RegWrite(X1_sadRegWrite),
.Clk(Clk),
.Reset(Rst),

.WriteData0(X1_sadMem0_out),
.WriteData1(X1_sadMem1_out),
.WriteData2(X1_sadMem2_out),
.WriteData3(X1_sadMem3_out),
.WriteData4(X1_sadMem4_out),
.WriteData5(X1_sadMem5_out),
.WriteData6(X1_sadMem6_out),
.WriteData7(X1_sadMem7_out),
.WriteData8(X1_sadMem8_out),
.WriteData9(X1_sadMem9_out),
.WriteData10(X1_sadMem10_out),
.WriteData11(X1_sadMem11_out),
.WriteData12(X1_sadMem12_out),
.WriteData13(X1_sadMem13_out),
.WriteData14(X1_sadMem14_out),
.WriteData15(X1_sadMem15_out),

.OutWindowRegister0(OutWindowRegister0),
.OutWindowRegister1(OutWindowRegister1),
.OutWindowRegister2(OutWindowRegister2),
.OutWindowRegister3(OutWindowRegister3),
.OutWindowRegister4(OutWindowRegister4),
.OutWindowRegister5(OutWindowRegister5),
.OutWindowRegister6(OutWindowRegister6),
.OutWindowRegister7(OutWindowRegister7),
.OutWindowRegister8(OutWindowRegister8),
.OutWindowRegister9(OutWindowRegister9),
.OutWindowRegister10(OutWindowRegister10),
.OutWindowRegister11(OutWindowRegister11),
.OutWindowRegister12(OutWindowRegister12),
.OutWindowRegister13(OutWindowRegister13),
.OutWindowRegister14(OutWindowRegister14),
.OutWindowRegister15(OutWindowRegister15),

.OutFrameRegister0(OutFrameRegister0),
.OutFrameRegister1(OutFrameRegister1),
.OutFrameRegister2(OutFrameRegister2),
.OutFrameRegister3(OutFrameRegister3),
.OutFrameRegister4(OutFrameRegister4),
.OutFrameRegister5(OutFrameRegister5),
.OutFrameRegister6(OutFrameRegister6),
.OutFrameRegister7(OutFrameRegister7),
.OutFrameRegister8(OutFrameRegister8),
.OutFrameRegister9(OutFrameRegister9),
.OutFrameRegister10(OutFrameRegister10),
.OutFrameRegister11(OutFrameRegister11),
.OutFrameRegister12(OutFrameRegister12),
.OutFrameRegister13(OutFrameRegister13),
.OutFrameRegister14(OutFrameRegister14),
.OutFrameRegister15(OutFrameRegister15)

);

Subber Subber0(
    .inA(OutWindowRegister0),
    .inB(OutFrameRegister0),
    .out(Subber0_out)
    );
    
Subber Subber1(
    .inA(OutWindowRegister1),
    .inB(OutFrameRegister1),
    .out(Subber1_out)
    );

Subber Subber2(
    .inA(OutWindowRegister2),
    .inB(OutFrameRegister2),
    .out(Subber2_out)
    );
    
Subber Subber3(
    .inA(OutWindowRegister3),
    .inB(OutFrameRegister3),
    .out(Subber3_out)
    );

Subber Subber4(
    .inA(OutWindowRegister4),
    .inB(OutFrameRegister4),
    .out(Subber4_out)
    );
    
Subber Subber5(
    .inA(OutWindowRegister5),
    .inB(OutFrameRegister5),
    .out(Subber5_out)
    );
    
    
Subber Subber6(
    .inA(OutWindowRegister6),
    .inB(OutFrameRegister6),
    .out(Subber6_out)
    );
    
    
Subber Subber7(
    .inA(OutWindowRegister7),
    .inB(OutFrameRegister7),
    .out(Subber7_out)
    );
    
    
Subber Subber8(
    .inA(OutWindowRegister8),
    .inB(OutFrameRegister8),
    .out(Subber8_out)
    );
    
    
    
Subber Subber9(
    .inA(OutWindowRegister9),
    .inB(OutFrameRegister9),
    .out(Subber9_out)
    );
    
    
Subber Subber10(
    .inA(OutWindowRegister10),
    .inB(OutFrameRegister10),
    .out(Subber10_out)
    );
    
    
Subber Subber11(
    .inA(OutWindowRegister11),
    .inB(OutFrameRegister11),
    .out(Subber11_out)
    );
    
    
Subber Subber12(
    .inA(OutWindowRegister12),
    .inB(OutFrameRegister12),
    .out(Subber12_out)
    );
    
    
Subber Subber13(
    .inA(OutWindowRegister13),
    .inB(OutFrameRegister13),
    .out(Subber13_out)
    );


Subber Subber14(
    .inA(OutWindowRegister14),
    .inB(OutFrameRegister14),
    .out(Subber14_out)
    );


Subber Subber15(
    .inA(OutWindowRegister15),
    .inB(OutFrameRegister15),
    .out(Subber15_out)
    );


X1_X2_pipelineRegister X1_X2(
    
    .X1_Instruction(X1_Instruction_W),
    .X1_PCAdd4(X1_writeBackPR_to_PcAdd4Mux),//goes to the jal_Mux
    .X1_DataMemOut(X1_writeBackPR_to_in0_memToRegMux),//goes to input 1 of the mem to reg mux
    .X1_ALUOut(X1_writeBackPR_to_in1_memToRegMux), //goes to input 2 of the mem to reg mux
    .X1_MaddOut(X1_writeBackPR_to_MaddMsubMux),//goes to input of MaddMsub mux
    .X1_HiLoOut(X1_writebackPR_to_HiLoWbMux),//goes to input of HiLoWb mux
    .X1_MemToReg(X1_MemToReg),
	.X1_BitsIn(X1_BitsIn),
	.X1_Jal_Mux(X1_Jal_Mux),
	.X1_SEL_Madd(X1_SEL_Madd),
	.X1_HiLo_WB(X1_HiLo_WB),
	.X1_RegWrite(X1_RegWrite),
	.X1_WriteRegCarry(X1_WriteRegCarry),
	
	.X1_WriteDataHi(X1_WriteDataHi_W),
	.X1_WriteDataLo(X1_WriteDataLo_W),
	
	.X1_Subber0_out(Subber0_out),
	.X1_Subber1_out(Subber1_out),
	.X1_Subber2_out(Subber2_out),
	.X1_Subber3_out(Subber3_out),
	.X1_Subber4_out(Subber4_out),
	.X1_Subber5_out(Subber5_out),
	.X1_Subber6_out(Subber6_out),
	.X1_Subber7_out(Subber7_out),
	.X1_Subber8_out(Subber8_out),
	.X1_Subber9_out(Subber9_out),
	.X1_Subber10_out(Subber10_out),
	.X1_Subber11_out(Subber11_out),
	.X1_Subber12_out(Subber12_out),
	.X1_Subber13_out(Subber13_out),
	.X1_Subber14_out(Subber14_out),
	.X1_Subber15_out(Subber15_out),	
	.X1_minRegWrite(X1_minRegWrite),
	
    .X2_Instruction(X2_Instruction_W),
    .X2_PCAdd4(X2_writeBackPR_to_PcAdd4Mux),//goes to the jal_Mux
    .X2_DataMemOut(X2_writeBackPR_to_in0_memToRegMux),//goes to input 1 of the mem to reg mux
    .X2_ALUOut(X2_writeBackPR_to_in1_memToRegMux), //goes to input 2 of the mem to reg mux
    .X2_MaddOut(X2_writeBackPR_to_MaddMsubMux),//goes to input of MaddMsub mux
    .X2_HiLoOut(X2_writebackPR_to_HiLoWbMux),//goes to input of HiLoWb mux
    .X2_MemToReg(X2_MemToReg),
	.X2_BitsIn(X2_BitsIn),
	.X2_Jal_Mux(X2_Jal_Mux),
	.X2_SEL_Madd(X2_SEL_Madd),
	.X2_HiLo_WB(X2_HiLo_WB),
	.X2_RegWrite(X2_RegWrite),
	.X2_WriteRegCarry(X2_WriteRegCarry),
	
	.X2_WriteDataHi(X2_WriteDataHi_W),
	.X2_WriteDataLo(X2_WriteDataLo_W),
	
	
	.X2_Subber0_out(X2_Subber0_out),
	.X2_Subber1_out(X2_Subber1_out),
	.X2_Subber2_out(X2_Subber2_out),
	.X2_Subber3_out(X2_Subber3_out),
	.X2_Subber4_out(X2_Subber4_out),
	.X2_Subber5_out(X2_Subber5_out),
	.X2_Subber6_out(X2_Subber6_out),
	.X2_Subber7_out(X2_Subber7_out),
	.X2_Subber8_out(X2_Subber8_out),
	.X2_Subber9_out(X2_Subber9_out),
	.X2_Subber10_out(X2_Subber10_out),
	.X2_Subber11_out(X2_Subber11_out),
	.X2_Subber12_out(X2_Subber12_out),
	.X2_Subber13_out(X2_Subber13_out),
	.X2_Subber14_out(X2_Subber14_out),
	.X2_Subber15_out(X2_Subber15_out),
	.X2_minRegWrite(X2_minRegWrite),
		
    .Clk(Clk),
    .Reset(Rst)

);

// 8 adders a0 - a7 

    //1
Adder_32Bit sad_add_a0(
    .inA(X2_Subber0_out),
    .inB(X2_Subber1_out),
    .out(sad_add_a0_out)
    );
    
    
    //2
Adder_32Bit sad_add_a1(
    .inA(X2_Subber2_out),
    .inB(X2_Subber3_out),
    .out(sad_add_a1_out)
    );

    //3
Adder_32Bit sad_add_a2(
    .inA(X2_Subber4_out),
    .inB(X2_Subber5_out),
    .out(sad_add_a2_out)
    );

    //4
Adder_32Bit sad_add_a3(
    .inA(X2_Subber6_out),
    .inB(X2_Subber7_out),
    .out(sad_add_a3_out)
    );

    //5
Adder_32Bit sad_add_a4(
    .inA(X2_Subber8_out),
    .inB(X2_Subber9_out),
    .out(sad_add_a4_out)
    );

    //6
Adder_32Bit sad_add_a5(
    .inA(X2_Subber10_out),
    .inB(X2_Subber11_out),
    .out(sad_add_a5_out)
    );

    //7
Adder_32Bit sad_add_a6(
    .inA(X2_Subber12_out),
    .inB(X2_Subber13_out),
    .out(sad_add_a6_out)
    );
    
    //8
Adder_32Bit sad_add_a7(
    .inA(X2_Subber14_out),
    .inB(X2_Subber15_out),
    .out(sad_add_a7_out)
    );



// 4 adders  b0-b3 (sad_add_b0_out)

    //1
    Adder_32Bit sad_add_b0(
    .inA(sad_add_a0_out),
    .inB(sad_add_a1_out),
    .out(sad_add_b0_out)
    );
    
    //2
    Adder_32Bit sad_add_b1(
    .inA(sad_add_a2_out),
    .inB(sad_add_a3_out),
    .out(sad_add_b1_out)
    );
    
    //3
    Adder_32Bit sad_add_b2(
    .inA(sad_add_a4_out),
    .inB(sad_add_a5_out),
    .out(sad_add_b2_out)
    );
    
    //4
    Adder_32Bit sad_add_b3(
    .inA(sad_add_a6_out),
    .inB(sad_add_a7_out),
    .out(sad_add_b3_out)
    );


/*X2*/
X2_X3_pipelineRegister X2_X3(
    .X2_Instruction(X2_Instruction_W),
    .X2_PCAdd4(X2_writeBackPR_to_PcAdd4Mux),//goes to the jal_Mux
    .X2_DataMemOut(X2_writeBackPR_to_in0_memToRegMux),//goes to input 1 of the mem to reg mux
    .X2_ALUOut(X2_writeBackPR_to_in1_memToRegMux), //goes to input 2 of the mem to reg mux
    .X2_MaddOut(X2_writeBackPR_to_MaddMsubMux),//goes to input of MaddMsub mux
    .X2_HiLoOut(X2_writebackPR_to_HiLoWbMux),//goes to input of HiLoWb mux
    .X2_MemToReg(X2_MemToReg),
	.X2_BitsIn(X2_BitsIn),
	.X2_Jal_Mux(X2_Jal_Mux),
	.X2_SEL_Madd(X2_SEL_Madd),
	.X2_HiLo_WB(X2_HiLo_WB),
	.X2_RegWrite(X2_RegWrite),
	.X2_WriteRegCarry(X2_WriteRegCarry),
	
	.X2_WriteDataHi(X2_WriteDataHi_W),
	.X2_WriteDataLo(X2_WriteDataLo_W),
	.X2_sad_add_b0_out(sad_add_b0_out),
	.X2_sad_add_b1_out(sad_add_b1_out),
	.X2_sad_add_b2_out(sad_add_b2_out),
	.X2_sad_add_b3_out(sad_add_b3_out),
	.X2_minRegWrite(X2_minRegWrite),
	
    .X3_Instruction(X3_Instruction_W),
    .X3_PCAdd4(X3_writeBackPR_to_PcAdd4Mux),//goes to the jal_Mux
    .X3_DataMemOut(X3_writeBackPR_to_in0_memToRegMux),//goes to input 1 of the mem to reg mux
    .X3_ALUOut(X3_writeBackPR_to_in1_memToRegMux), //goes to input 2 of the mem to reg mux
    .X3_MaddOut(X3_writeBackPR_to_MaddMsubMux),//goes to input of MaddMsub mux
    .X3_HiLoOut(X3_writebackPR_to_HiLoWbMux),//goes to input of HiLoWb mux
    .X3_MemToReg(X3_MemToReg),
	.X3_BitsIn(X3_BitsIn),
	.X3_Jal_Mux(X3_Jal_Mux),
	.X3_SEL_Madd(X3_SEL_Madd),
	.X3_HiLo_WB(X3_HiLo_WB),
	.X3_RegWrite(X3_RegWrite),
	.X3_WriteRegCarry(X3_WriteRegCarry),
	
	.X3_WriteDataHi(X3_WriteDataHi_W),
	.X3_WriteDataLo(X3_WriteDataLo_W),
	.X3_sad_add_b0_out(X3_sad_add_b0_out),
	.X3_sad_add_b1_out(X3_sad_add_b1_out),
	.X3_sad_add_b2_out(X3_sad_add_b2_out),
	.X3_sad_add_b3_out(X3_sad_add_b3_out),
	.X3_minRegWrite(X3_minRegWrite),
	
    .Clk(Clk),
    .Reset(Rst)

);

// 2 adders c0, c1

    //1
     Adder_32Bit sad_add_c0(
    .inA(X3_sad_add_b0_out),
    .inB(X3_sad_add_b1_out),
    .out(sad_add_c0_out)
    );

    //2
     Adder_32Bit sad_add_c1(
    .inA(X3_sad_add_b2_out),
    .inB(X3_sad_add_b3_out),
    .out(sad_add_c1_out)
    );



// 1 final adder d0
    Adder_32Bit sad_add_d0(
    .inA(sad_add_c0_out),
    .inB(sad_add_c1_out),
    .out(sad_add_d0_out)
    );


// min register
MINregister minregister(
   .dataIn(sad_Comparitor_out), 
   .dataOut(X3_minVal), 
   .WriteEnable(WB_minRegWrite), 
   .Clk(Clk), 
   .Reset(Rst) 
    );


/*X3*/


X3_WB_pipelineRegister X3_WB(
    .X3_Instruction(X3_Instruction_W),
    .X3_PCAdd4(X3_writeBackPR_to_PcAdd4Mux),//goes to the jal_Mux
    .X3_DataMemOut(X3_writeBackPR_to_in0_memToRegMux),//goes to input 1 of the mem to reg mux
    .X3_ALUOut(X3_writeBackPR_to_in1_memToRegMux), //goes to input 2 of the mem to reg mux
    .X3_MaddOut(X3_writeBackPR_to_MaddMsubMux),//goes to input of MaddMsub mux
    .X3_HiLoOut(X3_writebackPR_to_HiLoWbMux),//goes to input of HiLoWb mux
    .X3_MemToReg(X3_MemToReg),
	.X3_BitsIn(X3_BitsIn),
	.X3_Jal_Mux(X3_Jal_Mux),
	.X3_SEL_Madd(X3_SEL_Madd),
	.X3_HiLo_WB(X3_HiLo_WB),
	.X3_RegWrite(X3_RegWrite),
	.X3_WriteRegCarry(X3_WriteRegCarry),
	
	.X3_WriteDataHi(X3_WriteDataHi_W),
	.X3_WriteDataLo(X3_WriteDataLo_W),
	.X3_sad_add_d0_out(sad_add_d0_out),
	.X3_minVal(X3_minVal),
	.X3_minRegWrite(X3_minRegWrite),
	
    .WB_Instruction(Instruction_W),
    .WB_PCAdd4(writeBackPR_to_PcAdd4Mux),//goes to the jal_Mux
    .WB_DataMemOut(writeBackPR_to_in0_memToRegMux),//goes to input 1 of the mem to reg mux
    .WB_ALUOut(writeBackPR_to_in1_memToRegMux), //goes to input 2 of the mem to reg mux
    .WB_MaddOut(writeBackPR_to_MaddMsubMux),//goes to input of MaddMsub mux
    .WB_HiLoOut(writebackPR_to_HiLoWbMux),//goes to input of HiLoWb mux
    .WB_MemToReg(WB_MemToReg),
	.WB_BitsIn(WB_BitsIn),
	.WB_Jal_Mux(WB_Jal_Mux),
	.WB_SEL_Madd(WB_SEL_Madd),
	.WB_HiLo_WB(WB_HiLo_WB),
	.WB_RegWrite(WB_RegWrite),
	.WB_WriteRegCarry(WB_WriteRegCarry),
	
	.WB_WriteDataHi(WriteDataHi_W),
	.WB_WriteDataLo(WriteDataLo_W),
	.WB_sad_add_d0_out(WB_sad_add_d0_out),
	.WB_minVal(WB_minVal),
	.WB_minRegWrite(WB_minRegWrite),
    .Clk(Clk),
    .Reset(Rst)

);

Comparitor comparitor(
.sadAdderFinal(WB_sad_add_d0_out),
.minSad(WB_minVal),
.out(sad_Comparitor_out)
);


Mux_32Bit_2To1 memToRegMux(
    .out(memToRegMuxOut),//this goes to the three inputs with modifications.
    .inA(writeBackPR_to_in1_memToRegMux),
    .inB(writeBackPR_to_in0_memToRegMux),
    .sel(WB_MemToReg)
);



SignExtension_16Bit_to_32_bit SE_halfWord(
    .in(memToRegMuxOut[15:0]),//comes from memToRegMux
    .out(SE_halfWordOut),//goes to input 01 of bitsInMux
    .control(0)
);


SignExtension_16Bit_to_32_bit SE_byte(
    .in(memToRegMuxOut[15:0]),//comes from memToRegMux
    .out(SE_byteOut),//goes to input 01 of bitsInMux
    .control(0)
);


Mux_32Bit_4To1 bitsInMux(
    
    .out(bitsInMuxOut),//goes to JALMux
    .inA(memToRegMuxOut),//comes from memToRegMux
    .inB(SE_halfWordOut),//comes from SE_halfword
    .inC(SE_byteOut),//comes from SE_byte
    .inD(sad_Comparitor_out),//No connection. /*Check if this works syntax-wise*/
    .select(WB_BitsIn)

);



Mux_32Bit_2To1 JalMux(
    .out(JAL_MuxOut),//goes to MaddMsubbMux
    .inA(bitsInMuxOut),//comes from 3to1 mux.
    .inB(writeBackPR_to_PcAdd4Mux),//comes from pc+4
    .sel(WB_Jal_Mux)
);




Mux_32Bit_2To1 MaddMsubMux(
    .out(MaddMsubMuxOut),//goes to HiLoWriteBackMux
    .inA(JAL_MuxOut),//comes from JALMux
    .inB(writeBackPR_to_MaddMsubMux[31:0]),//comes from pipline register
    .sel(WB_SEL_Madd)
);


//HiLoWb mux and MEM_EX_piplineRegister
Mux_32Bit_2To1 HiLoWriteBackMux(
    .out(hiLoWriteBackMuxOut),//goes to the pipline register
    .inA(MaddMsubMuxOut),//comes from the maddmsub mux
    .inB(writebackPR_to_HiLoWbMux),//comes from pipline register
    .sel(WB_HiLo_WB)
);

/*End Writeback stage of the pipline*/

//always @(*) begin
   assign v0 = _v0;
   assign v1 = _v1;
//end


endmodule
