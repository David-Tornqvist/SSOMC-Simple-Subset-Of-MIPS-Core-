`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2021 18:50:00
// Design Name: 
// Module Name: PC
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


module PC(input RST,
          input CLK,  
          input [31:0] nPC,
          output reg [31:0] PC);

    always @ (posedge CLK)
        begin
            
            if (RST == 0)PC <= 0;
            else PC <= nPC;
        end
          
endmodule
