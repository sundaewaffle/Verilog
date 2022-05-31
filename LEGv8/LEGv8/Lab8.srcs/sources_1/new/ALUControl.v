`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng_Hung Hung
// 
// Create Date: 2020/12/03 13:30:32
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(Opcode, ALUOp, ALU_operation);
    input [1:0] ALUOp;
    input [10:0] Opcode;
    output reg [3:0] ALU_operation;

    always @(ALU_operation, Opcode, ALUOp)
    case(ALUOp)
        2'b01:  ALU_operation <= 4'b0111;
        2'b00:  ALU_operation <= 4'b0010;
        2'b10:
            begin
                case ({Opcode[9], Opcode[8], Opcode[3]})
                    3'b001: ALU_operation <= 4'b0010;
                    3'b101: ALU_operation <= 4'b0110;
                    3'b000: ALU_operation <= 4'b0000;
                    3'b010: ALU_operation <= 4'b0001;
                endcase
            end
    endcase

endmodule
