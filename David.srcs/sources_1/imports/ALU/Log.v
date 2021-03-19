`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2021 15:31:05
// Design Name: 
// Module Name: Log
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


module Log( input [31:0] A,B,
            input [3:0] ALUOP,
            output [31:0] LogOut);

    wire [31:0] ANDO, ORO, XORO, NORO;            
    
    assign ANDO = A & B;
    assign ORO = A | B;
    assign XORO = A ^ B;
    assign NORO = ~(A | B);        
            
    assign LogOut = (ALUOP[1:0] == 2'b00) ? ANDO :   
                    (ALUOP[1:0] == 2'b01) ? ORO  :
                    (ALUOP[1:0] == 2'b10) ? XORO :
                                            NORO;
            
endmodule
