`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2021 18:46:16
// Design Name: 
// Module Name: top
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


module top(input FPGACLK, RST,
           input [31:0] IOReadData,
           output reg [31:0] Display);

    wire [31:0] IOWriteData;
    wire [31:0] IOAddr;
    wire IOWriteEn;

    processor i_processor(  .CLK(FPGACLK),.RST(RST),
                            .IOWriteData(IOWriteData), 
                            .IOAddr(IOAddr), 
                            .IOWriteEn(IOWriteEn), 
                            .IOReadData(IOReadData));

    always @ (posedge FPGACLK, posedge RST)
        begin
            if(RST) Display = 31'h0;
                else if((IOAddr == 31'h00007FF0) & IOWriteEn) Display = IOWriteData; 
        end


endmodule