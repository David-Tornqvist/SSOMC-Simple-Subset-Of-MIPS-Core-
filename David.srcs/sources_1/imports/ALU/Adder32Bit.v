`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2021 16:11:37
// Design Name: 
// Module Name: Adder32Bit
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


module ADD(  input [31:0] A,B,
               input Cin,
               output [31:0] SUM,
               output Cout);
    //wire [31:0] ADD;

   // full_adder Adder0(.cin(Cin),.a(A[3:0]),.b(B[3:0]),.s(ADD[3:0]),.cout(C0));
   // full_adder Adder1(.cin(C0),.a(A[7:4]),.b(B[7:4]),.s(ADD[7:4]),.cout(C1));
    //full_adder Adder2(.cin(C1),.a(A[11:8]),.b(B[11:8]),.s(ADD[11:8]),.cout(C2));
    //full_adder Adder3(.cin(C2),.a(A[15:12]),.b(B[15:12]),.s(ADD[15:12]),.cout(C3));
    
    //full_adder Adder4(.cin(C3),.a(A[19:16]),.b(B[19:16]),.s(ADD[19:16]),.cout(C4));
    //full_adder Adder5(.cin(C4),.a(A[23:20]),.b(B[23:20]),.s(ADD[23:20]),.cout(C5));
    //full_adder Adder6(.cin(C5),.a(A[27:24]),.b(B[27:24]),.s(ADD[27:24]),.cout(C6));
    //full_adder Adder7(.cin(C6),.a(A[31:28]),.b(B[31:28]),.s(ADD[31:28]),.cout(Cout));
    
    assign SUM = A + B + Cin;
    
endmodule
