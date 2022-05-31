`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 13:29:31
// Design Name: 
// Module Name: ALU
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


module ALU(ALU_operation, A, B, ALU_result, Zero);
    input [3:0] ALU_operation;
    input [63:0] A;
    input [63:0] B;
    output reg [63:0] ALU_result;
    output Zero;

    always @(ALU_operation, A, B, ALU_result, Zero)
    case (ALU_operation)
        0:  ALU_result <= A & B;
        1:  ALU_result <= A | B;
        2:  ALU_result <= A + B;
        6:  ALU_result <= A - B;
        7:  ALU_result <= B;
        12: ALU_result <= ~(A | B);
    endcase
    
    assign Zero = (ALU_result==0)? 1: 0;
    
endmodule
