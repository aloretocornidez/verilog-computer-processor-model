`timescale 1ns / 1ps
/*
Group Names
Alan Manuel Loreto Corndidez: 1/3 Effort
Haseeb Sarwar Irfan: 1/3 Effort
Chris W Bremser: 1/3 Effort
*/


module IF_ID_piplineRegister(
    //IF_PCAddyMux,
	IF_PCAdd4,
	IF_InstructionMemory,
	//ID_PCAddyMux,
	ID_PCAdd4,
	ID_InstructionMemory,	
	Clk,
	Reset, //Yes, the registers are clocked
    IF_ID_Write);
	
	input Clk;
	//input [31:0]ID_PCAddyMux;
	input [31:0]IF_PCAdd4;
	input [31:0]IF_InstructionMemory;
	input Reset;
    input IF_ID_Write;
	
	//output reg[31:0]IF_PCAddyMux;
	output reg [31:0]ID_PCAdd4;
	output reg [31:0]ID_InstructionMemory;
    
	
	always @(posedge Clk)   //ignore else if for now, testing always at manipulation
	begin
	   if (Reset == 1) begin
		
		
		  ID_InstructionMemory <= 0;
		  ID_PCAdd4 <= 0;	
		end
		else if (IF_ID_Write != 1) begin
		 ID_InstructionMemory <= IF_InstructionMemory;
	     ID_PCAdd4 <= IF_PCAdd4;
		end
		/*else
		begin
			
		  ID_InstructionMemory <= IF_InstructionMemory;
		  ID_PCAdd4 <= IF_PCAdd4;
		end
        //IF_PCAddyMux <= ID_PCAddyMux;//comented out
	*/

	   
	/*
	always @(*)
	begin
	
	   IF_PCAddyMux <= ID_PCAddyMux;
	
	end
	
	*/
	end
	
endmodule
