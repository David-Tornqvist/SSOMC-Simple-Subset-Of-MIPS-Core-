`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2021 20:25:21
// Design Name: 
// Module Name: processor
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

module processor(   input CLK,RST,
                    output [31:0]   IOWriteData,
                    output [31:0]    IOAddr,
                    output          IOWriteEn,
                    input [31:0]    IOReadData);

    //PC wires
    wire [31:0] nPC, PC, PCINC;
    wire [31:0] instruction;
    wire [31:0] JMPAdress = instruction [25:0];
    
    //CU wires
    wire [5:0] Funct = instruction [5:0];
    wire [31:26] OP = instruction [31:26];
    wire [25:21] RS = instruction [26:21];
    wire [20:16] RT = instruction [20:16];
    wire [15:11] RD = instruction [15:11];
    wire [15:0] immediate = instruction [15:0];
    wire [25:0] JMPImmediate = instruction [25:0];

   
    //ALU wires
    wire [31:0] A, B, Result;
    wire [3:0] ALUOP;
    wire [31:0] RSD1, RTD2, WD3;
    wire [5:0] A1, A2, A3;
    
    //dataMemory wires
    
    wire [31:0] memData;
    wire [31:0] memAdress;
    
    //datapath wires:
    wire [31:0] signextim;
    wire isIO = (memAdress >= 32'h00007FF0 & memAdress <= 32'h00007fff);
    
    assign PCINC = PC + 4;
    assign JMPAdress [31:28] = PCINC [31:28];
    assign JMPAdress [27:0] = JMPImmediate << 2; 
    
    
    assign nPC = Branch & Zero ? PCINC + (signextim << 2) : 
                 JMP ? JMPAdress : PCINC;
    //inte klart
    
    PC i_PC(.CLK(CLK),.RST(RST),.nPC(nPC),.PC(PC));
    
    
    
    IM i_instructionMemory(.adress(PC[5:0]),.data(instruction));
    
    

    CU  i_controlUnit(.OP(OP),.Funct(Funct),.ALUOP(ALUOP),.WE3(WE3),.DSTREG(DSTREG),.ALUSRC(ALUSRC),.MWE(MWE),.MEMREG(MEMREG),.Branch(Branch),.JMP(JMP));
  
   
    
    

    SE i_signExtend(.immediate(immediate),.signextim(signextim));



    assign A1 = RS;
    assign A2 =  RT;
    assign A3 = DSTREG ? RD : RT;
    assign WD3 = MEMREG ? memData : 
                 isIO ? IOReadData : Result;
    
      //if DSTREG = 1 A3 = RD otherwise RT
    RF i_registerFile(.A1(A1),.A2(A2),.RD1(RSD1),.RD2(RTD2),.A3(A3),.WD3(WD3),.WE3(WE3),.CLK(CLK));
    


    assign A = RSD1;
    assign B = ALUSRC ? RTD2 : signextim;
    
    
 //if ALUSRC = 0 B = signextim otherwise RTD2
    ALU i_ALU (.A(A),.B(B),.ALUOP(ALUOP),.Result(Result),.Zero(Zero));
    
    
    
    assign memAdress = Result;
    

    DM i_dataMemory(.CLK(CLK),.WE(MWE),.adress(memAdress),.writeData(RTD2),.outData(memData));
    

    assign IOWriteData = RTD2;
    assign IOWriteAdress = memAdress[31:0];
    assign IOWriteEn = MWE;
    

endmodule