`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2021 15:30:32
// Design Name: 
// Module Name: Aritm
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


module Aritm(   input [31:0] A,B,
                input [3:0] ALUOP,
                output [31:0] AritmOut,
                output Cout);
    wire [31:0] AADD,BADD,ADDOut,EXTOut;
    assign AADD = A; 
    assign BADD = ALUOP[1] ? ~B : B;               
          
    ADD Adder(.SUM(ADDOut),.Cin(ALUOP[1]),.Cout(Cout),.A(AADD),.B(BADD));
    
    EXT Extender(.in(ADDOut),.out(EXTOut));
    
    assign AritmOut = ALUOP[3] ? EXTOut : ADDOut;
                
endmodule
