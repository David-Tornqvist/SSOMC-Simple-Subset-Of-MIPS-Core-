`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2021 14:57:40
// Design Name: 
// Module Name: SE
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


module SE(input [15:0] immediate,
          output [31:0] signextim  
    );
    
    assign signextim [15:0] = immediate [15:0];
    
    assign signextim [31:16] = (immediate [15:15]) ? 16'hffff : 0;  
    
endmodule
