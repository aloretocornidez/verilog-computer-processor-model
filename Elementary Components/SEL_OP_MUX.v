`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
//Christopher Bremser - 33.0%
// Alan Manual Loreto Cornidez - 33.0%
// Haseeb Irfan - 33.0%
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SEL_OP_MUX( jump_JAL, PC_4, branch, JR, out, sel_IN);
input [31:0]jump_JAL;
input [31:0] PC_4; 
input [31:0] branch;
input [31:0] JR; 
input [1:0]sel_IN;


output reg [31:0] out; 

always @(*)begin 

if (sel_IN == 01) begin

    out <= jump_JAL;

end
else if (sel_IN == 10) begin
    out <= branch;
end
else if (sel_IN == 11) begin

    out <= JR;
    
end

else begin
  
  out <= PC_4;

end


end
endmodule
