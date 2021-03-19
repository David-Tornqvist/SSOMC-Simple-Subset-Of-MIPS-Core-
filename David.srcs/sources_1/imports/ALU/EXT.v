`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2021 16:29:28
// Design Name: 
// Module Name: EXT
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


module EXT( input [31:0] in, 
            output [31:0] out);

    
    assign out[0] = ~in[31];   
    
    assign out[31:1] = 31'b0;
   
             
endmodule
