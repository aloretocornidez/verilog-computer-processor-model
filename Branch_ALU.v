`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Christopher Bremser - 33.0%
// Alan Manual Loreto Cornidez - 33.0%
// Haseeb Irfan - 33.0 %
// Ali Akoglu - 1% 
// Create Date: 10/17/2021 05:55:11 PM
// Design Name: 
// Module Name: Branch_ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Branch_ALU(instruction, rs, rt, opcode, control,  branchFlag, SEL_OP);
input [31:0] instruction; 
input [31:0]rs;
input [31:0]rt; 
input [5:0]opcode;
input control;
output reg branchFlag;
output reg [1:0]SEL_OP;


always@(*) begin
    

    if (control == 0 ) begin
      branchFlag <=0;
      SEL_OP <= 2'b00; 
    end
    
    else begin
    case(opcode)
   
    6'b000001:
    //BGEZ
    if (rs >= 0) begin
    branchFlag <= 1; 
    SEL_OP  <= 2'b10;
    
    end
    else begin
    branchFlag <= 0;
    SEL_OP <= 2'b00;
    end
         
    
    6'b000100:
    // BEQ
    if(rs == rt) begin
    branchFlag <= 1;
    SEL_OP <= 2'b10;
    
    end
    else begin
    branchFlag <= 0; 
    SEL_OP <= 2'b00;
    
    end
    
     6'b000101:
    // BNE
    if(!(rs == rt)) begin
    branchFlag <= 1;
    SEL_OP <= 2'b10;
    
    end
    else begin
    branchFlag <= 0; 
    SEL_OP <= 2'b00;
    
    end
    
    6'b000111:
    //BGTZ
    if(rs > 0 ) begin
    branchFlag <= 1; 
    SEL_OP <= 2'b10;
    
    end
    else begin
    branchFlag <= 0;
    SEL_OP <= 2'b00;
    end
    
    6'b000110:
    // BLEZ
    if( rs <= 0) begin
    branchFlag <= 1;
    SEL_OP <= 2'b10;
    
    end
    
    else begin
    branchFlag <= 0;
    SEL_OP <= 2'b00;
    end
    
    
    6'b000001:
    //BLTZ
    
    if ( rs < 0) begin
    branchFlag <= 1;
    SEL_OP <= 2'b10;
    
    
    end
    
    else begin
    branchFlag <= 0;
    SEL_OP <= 2'b00;
    end
    
    6'b000010:
    //J
    begin
    branchFlag <= 0;
    SEL_OP <= 2'b01;
    
    end 
    6'b000000:
    // Jr
    
    begin
    if (instruction == 32'h00000000)begin
    branchFlag <= 0;
    SEL_OP <= 2'b0;
    end
    else begin
    branchFlag  <= 0;
    SEL_OP <= 2'b11; // Sending Funct Code instead of Opcode because opcode 
    end
    end
    6'b000011:
    // JAL 
    begin
    branchFlag <= 0;
    SEL_OP <= 2'b01;
    end
     default: 
    begin
    branchFlag <= 0;
    SEL_OP <= 2'b00;
    end
    endcase
end
end

endmodule
