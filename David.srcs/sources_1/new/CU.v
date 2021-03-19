`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2021 21:12:53
// Design Name: 
// Module Name: CU
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


module CU(input [31:26] OP, 
          input [5:0] Funct,
          output reg [3:0] ALUOP,
          output reg WE3,DSTREG,ALUSRC,MWE,MEMREG,Branch,JMP
    );
 
localparam [5:0] OP_Rtype = 6'b000000;    
localparam [5:0] OP_LW = 6'b100111;
localparam [5:0] OP_SW = 6'b101011;
localparam [5:0] OP_BEQ = 6'b000100; 
localparam [5:0] OP_ADDI = 6'b001000;
localparam [5:0] OP_JMP = 6'b000010;  

//if DSTRG = 1 A3 = rd otherwise RT
//if ALUSRC = 1 B = RTD2 otherwise singext

always @ (*)
    case (OP)
        OP_Rtype: begin ALUOP = Funct [3:0]; WE3 = 1; DSTREG = 1; ALUSRC = 1; MWE = 0; MEMREG = 0; Branch = 0; JMP = 0; end
        OP_LW   : begin ALUOP = 4'b0000; WE3 = 1; DSTREG = 0; ALUSRC = 0; MWE = 0; MEMREG = 1; Branch = 0; JMP = 0; end 
        OP_SW   : begin ALUOP = 4'b0000; WE3 = 0; DSTREG = 0; ALUSRC = 0; MWE = 1; MEMREG = 0; Branch = 0; JMP = 0; end 
        OP_BEQ  : begin ALUOP = 4'b0010; WE3 = 0; DSTREG = 0; ALUSRC = 1; MWE = 0; MEMREG = 0; Branch = 1; JMP = 0; end 
        OP_ADDI : begin ALUOP = 4'b0000; WE3 = 1; DSTREG = 0; ALUSRC = 0; MWE = 0; MEMREG = 0; Branch = 0; JMP = 0; end 
        OP_JMP  : begin ALUOP = 4'b0000; WE3 = 0; DSTREG = 0; ALUSRC = 0; MWE = 0; MEMREG = 0; Branch = 0; JMP = 1; end 
        default : begin ALUOP = 4'b0000; WE3 = 0; DSTREG = 0; ALUSRC = 0; MWE = 0; MEMREG = 0; Branch = 0; JMP = 0; end 
    endcase        
endmodule
