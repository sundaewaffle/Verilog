`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 12:36:23
// Design Name: 
// Module Name: IF
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


module IF(clk, PCSrc, BranchPC, Instruction, PCout);
    input clk, PCSrc;
    input [63:0] BranchPC;
    output [31:0] Instruction;
    output [63:0] PCout;
    wire [63:0] nextPC, PCout, PC_4;
    
    PC pc(.clk(clk), .PCin(nextPC), .PCout(PCout));
    IM InsMem(.PCout(PCout), .InstructionOut(Instruction));
    Mux64 mux(.in1(PC_4), .in2(BranchPC), .switch(PCSrc), .out(nextPC));
    Adder adder(.in1(PCout), .in2(4), .out(PC_4));
    
endmodule
