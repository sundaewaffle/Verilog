`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 12:51:01
// Design Name: 
// Module Name: Control
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


module Control(OPcode, ALUOp, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch);
    input [10:0] OPcode;
    output reg [1:0] ALUOp;
    output reg Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    
    always @ (*)
    casez (OPcode)
    11'b11111000010: begin  // LDUR
        Reg2Loc <= 0;
        ALUSrc <= 1;
        MemtoReg <= 1;
        RegWrite <= 1;
        MemRead <= 1;
        MemWrite <= 0;
        Branch <= 0;
        ALUOp <= 2'b00;
    end
    11'b11111000000: begin  // STUR
        Reg2Loc <= 1;
        ALUSrc <= 1;
        MemtoReg <= 0;  // don't care
        RegWrite <= 0;
        MemRead <= 0;
        MemWrite <= 1;
        Branch <= 0;
        ALUOp <= 2'b00;
    end
    11'b10001011000, 11'b11001011000, 11'b10001010000, 11'b10101010000: begin // ADD SUB AND OR
        Reg2Loc <= 0;
        ALUSrc <= 0;
        MemtoReg <= 0;
        RegWrite <= 1;
        MemRead <= 0;
        MemWrite <= 0;
        Branch <= 0;
        ALUOp <= 2'b10;
    end
    11'b10110100zzz: begin  // CBZ
        Reg2Loc <= 1;
        ALUSrc <= 0;
        MemtoReg <= 0;  // don't care
        RegWrite <= 0;
        MemRead <= 0;
        MemWrite <= 0;
        Branch <= 1;
        ALUOp <= 2'b01;
    end
    endcase
    
endmodule
