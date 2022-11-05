`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Group Members: Alan Manuel Loreto Cornidez, Haseeb Sarwar Irfan, Chris William Bremser
// Effort: 1/3 each
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension_8Bit_to_32_bit(in, out, control);

    /* A 16-Bit input word */
    input [7:0] in;
    input control;
    /* A 32-Bit output word */
    output reg [31:0] out;
    

    always @(*)
    begin
        
        if(control == 0)
        begin
            out <= {24'b0, in[7:0]};
        end
        else if(control == 1)
        begin
            out <= { { 24 {in[15]} }, in[15:0] };
        end
    end
    


endmodule
