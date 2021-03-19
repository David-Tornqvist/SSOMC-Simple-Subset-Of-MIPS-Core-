`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2021 21:13:37
// Design Name: 
// Module Name: DM
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


module DM(input CLK, WE,
          input [5:0] adress,
          input [31:0] writeData,
          output [31:0] outData);
          
    reg [31:0] dataMemory [63:0];
    
    initial
      begin
        $readmemh("datamem_h.txt", dataMemory);  // Initialize the array with this content
      end
    
    assign outData = dataMemory[adress];
    
    always @ (posedge CLK)
        begin
            if(WE)
                dataMemory[adress] <= writeData;
        end  
          
endmodule
