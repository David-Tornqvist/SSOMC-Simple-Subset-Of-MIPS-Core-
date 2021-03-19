`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2021 15:19:39
// Design Name: 
// Module Name: ALU
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


module ALU( input [31:0] A,B,
            input [3:0] ALUOP,
            output[31:0] Result,
            output Zero);
            
wire [31:0] AritmOut, LogOut;
            
Aritm Aritmethic_part(.AritmOut(AritmOut),.A(A),.B(B),.ALUOP(ALUOP),.Cout(Cout));
            
Log Logic_part(.LogOut(LogOut),.A(A),.B(B),.ALUOP(ALUOP));

assign Result = ALUOP[2] ? LogOut : AritmOut;

ZeroFlag ZeroFlag(.in(Result),.Zero(Zero));
                      
endmodule
