`timescale 1ns / 1ps

module SADMemory(Address, Clk, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input Clk;
    input MemRead; 			// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address

    reg [31:0] memory [8191:0];
    
    initial
 begin
        $readmemh("data_memory.mem", memory);
    
    end
    
    always @(MemRead, Address, Clk) begin
        if (MemRead) begin
            ReadData <= memory[Address[16:2]];
        end
        else begin
            ReadData = 8'o00000000;
        end
    end
   
endmodule
