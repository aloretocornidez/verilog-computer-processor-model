`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 06:09:19 PM
// Design Name: 
// Module Name: InstructionMemory_tb
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


module InstructionMemory_tb( );
InstructionMemory a1(.Address(add), .Instruction(ins));

reg [31:0]add; 
wire [31:0]ins; 

initial begin
add <= 32'h0000001;
#10;
add <= 32'h0000005;
#10;
add <= 32'h0000009;
#10;
add <= 32'h00000013;
#10;
add <= 32'h00000017;
#10;
add <= 32'h0000006;
#10;

end
endmodule
