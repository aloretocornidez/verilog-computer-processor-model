`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
// Chris, Haseeb and Alan
// 33% per person
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, ALUHiResult, Zero);

	input [4:0] ALUControl; // control bits for ALU operation
	input [31:0] A, B;	    // inputs
	
	integer i;
	reg [31:0] A_temp;

	output reg [31:0] ALUResult;	// answer
	output reg [31:0] ALUHiResult;  //for mult
	output reg Zero;	    // Zero=1 if ALUResult == 0
     

    initial begin
        ALUHiResult <= 32'b0;
    end

     //Zero flag, will go high if the ALU output is zero.
     always @(*) begin
          if(ALUResult == 0)
          begin
               Zero <= 1;
          end

          else
          begin
               Zero <= 0;
          end
     end


    always @(*) 
    begin
          ALUHiResult <= 32'b0;
          case(ALUControl)
               
               //Add
               5'b00000:
               begin
                    ALUResult <= A + B;
               end

              //Subtract
               5'b00001:
               begin
                    ALUResult <= A - B;
               end

               //Multiplication
               5'b00010:
               begin 
                    {ALUHiResult, ALUResult} <= A * B;
               end

               //Division///
               5'b00011:
               begin
                    ALUResult <= A/B;
               end

               //Shift Left Logical
               5'b00100:
               begin 
                    ALUResult <= B << A;
               end
               
               //Shift Right Logical 
               5'b00101:
               begin
                    ALUResult <= B >> A;
               end

               //Rotate Left///
               5'b00110: 
               begin // Rotate Left
                    for (i = 0; i < B[10:6]; i = i + 1) begin
                         A_temp <= {A[30:0],A[31]};
                    end
                    ALUResult <= A_temp;
               end
               

               //Rotate Right
               5'b00111: begin
                    for (i = 0; i < B[10:6]; i = i + 1) begin
                         A_temp <= {A[0], A[31:1]};
                    end
                    ALUResult <= A_temp;
               end

               //Logical AND
               5'b01000:
               begin
                    ALUResult <= A & B;
               end


               //Logical OR
               5'b01001:
               begin 
                    ALUResult <= A | B;
               end

               //Logical XOR
               5'b01010:
               begin
                    ALUResult <=  A ^ B;
               end

               //Logical NOR
               5'b01011:
               begin
                    ALUResult <= ~(A | B);
               end

               //Logical NAND///
               5'b01100:
               begin 
                    ALUResult <= ~(A & B);
               end

               //Logical XNOR
               5'b01101:
               begin
                    ALUResult <= ~(A ^ B);
               end

               //Greater Comparison    
               5'b01110:
               begin
                    if (!(A>B)) 
                    begin
                         
                         ALUResult = 0;
                    
                    end
                    else 
                    begin
                         ALUResult = 1;
                    end
               end    


               //Need to work on implementation for the Less than comparison.
               //Less than comparison
               5'b01111:
               begin
                    if (A < B) begin
                         ALUResult <= 1;
                    end 
                    else
                    begin
                         ALUResult <= 0;
                    end
                    
               
               end

               /*
               5 Bits at this point.
               */

               //Greater than or equal to zero
               5'b10000:
               begin
                    if(A >= 0)
                    begin
                         ALUResult <= 1;
                    end
                    
                    else
                    begin
                         ALUResult <= 0;
                    end
               end

               //Less than or equal to zero
               5'b10001:
               begin
                    if(A <= 0)
                    begin
                         ALUResult <= 1;
                    end
                    
                    else
                    begin
                         ALUResult <= 0;
                    end
               end

               //A Equal to B 
               5'b10010:
               begin 
                    if(A == B)
                    begin
                         ALUResult <= 1;
                    end
                    
                    else
                    begin
                         ALUResult <= 0;
                    end
               end

               //A Not Equal to B
               5'b10011:
               begin
                    if(~(A == B))
                    begin
                         ALUResult <= 1;
                    end
                    
                    else
                    begin
                         ALUResult <= 0;
                    end
               end


               //A less than Zero
               5'b10100:
               begin 
                    if(A < 0)
                    begin
                         ALUResult <= 1;
                    end
                    
                    else
                    begin
                         ALUResult <= 0;
                    end
               end

               //A greater than Zero
               5'b10101:
               begin
                    if(A > 0)
                    begin
                         ALUResult <= 1;
                    end
                    
                    else
                    begin
                         ALUResult <= 0;
                    end
               end

               //SRLV
               5'b10110: 
               begin
                    ALUResult <= B >> A;
               end
               

               //SRAV
               5'b10111: 
               begin
                    ALUResult <= A >>> B[4:0];
               end


               //SRA
               5'b11000:
               begin
                    ALUResult <= A >>> B[10:6];
               end

               //MOVZ
               5'b11001:
               begin 
                    if (A == 0) begin
                        ALUResult = B;
                    end
               end
                
               //MOVN
               5'b11010:
               begin
                    if (A != 0) begin
                        ALUResult = B;
                    end

               end

                //NOP
               5'b11011:
               begin
                    ALUResult = 0;
               end


               5'b11100:
               begin 

               end


               5'b11101:
               begin

               end

 
               5'b11110:
               begin

               end    


               5'b11111:
               begin

               end
               
               default: 
               begin
                ALUResult <= 32'b0;
               end

          endcase

     end
   
endmodule

