`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Christopher Bremser 33%
// Haseeb Irfan 33%
// Alan Manuel Loreto Corindez 33%
// Ali Akoglu 0.5%
// Alex Fusco 0.5% 
//////////////////////////////////////////////////////////////////////////////////


module Forwarding(
    ID_EX_RegisterRS,
    ID_EX_RegisterRT,
    WB_RegWrite,
    MEM_RegRd,
    EX_MEM_RegisterRd,
    MEM_WB_RegisterRd,
    outA,
    outB, 
    

    );
    
    input [4:0]ID_EX_RegisterRS;
    input [4:0]ID_EX_RegisterRt;
    input WB_RegWrite;
    input [4:0] MEM_RegRd;
    input [4:0] EX_MEM_RegisterRd; 
    input [4:0] MEM_WB_RegisterRd;
    
    output reg [1:0]outA; 
    output reg [1:0]outB;
    /*
    ex/mem. Regwrite on ( meaning that its writing into a register, R type) 
    EX/MEM.RegisterRD != 0 meaning the register is not 0. 
    ex.memRd = id.ex rs register 
    ---> This turns A to 1
    
    else if -> MEM.WB RD  = ID.EX Rs 
    ---> Turns A to 2
    
    EX/MEM Register RD  ==  ID.EX REgister RT 
    ---> B Mux turns to 1
    
    MEM.WB RegisterRD == ID.EX Register RT 
    ---> B Mux turns to 2.
   
    
    */
    
    
    always @ (*)
    begin
    
    if (WB_RegWrite && (EX_MEM_RegisterRd != 0 ))
    begin
        if(EX_MEM_RegisterRd  == ID_EX_RegisterRS) begin
            outA <= 2'b01;
        end
        else if (MEM_WB_RegisterRd == ID_EX_RegisterRS)begin
            outA <= 2'b10;
        end
        else if(EX_MEM_RegisterRd == ID_EX_RegisterRT)begin
            outB <= 2'b01;
        end
        else if(MEM_WB_RegisterRd == ID_EX_RegisterRT)begin
            outB <= 2'b10;
        end
    
    end
    
    
endmodule
