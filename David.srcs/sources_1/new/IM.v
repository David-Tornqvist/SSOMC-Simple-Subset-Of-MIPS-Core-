`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2021 21:12:37
// Design Name: 
// Module Name: IM
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


module IM(input [5:0] adress,
          output [31:0] data);
          
    reg [31:0] instructionMemory [64:0]; 
    
    initial
        begin
            $readmemh("insmem_h.txt", instructionMemory);  // Initialize the array with this content
        end          
          
     assign data = instructionMemory[adress];      
          
endmodule
