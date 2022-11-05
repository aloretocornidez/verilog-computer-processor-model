`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);
    
    localparam period = 20;

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
	
////////////////
	   //Registers to read from
        ReadRegister1 <= 0;
        ReadRegister2 <= 0;
        
        //Testing Writing Registers
        WriteRegister <= 0;//register address.
        WriteData <= 42;//data to be written
        RegWrite <= 1;//enable writing
        #period;
        
        RegWrite <= 0;
        #period;
        
	   //Registers to read from
        ReadRegister1 <= 0;
        ReadRegister2 <= 0;
        #period;
        
        
        //Testing setting another register and reading from both.
        //setting register 2 to 52 and reading with readRegister2
        RegWrite <= 1;
        WriteRegister <= 1;
        WriteData <= 52;
        ReadRegister2 <= 1;
        
        #period;
        
        //RegWrite <= 0;//works with both setting regwrite too 1 and zero.
        
        #period;
        #period;
        
    end

endmodule
