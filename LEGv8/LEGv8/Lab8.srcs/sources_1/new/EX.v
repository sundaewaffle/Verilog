`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng_Hung Hung
// 
// Create Date: 2020/12/03 13:32:09
// Design Name: 
// Module Name: EX
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


module EX(ALUSrc, MemtoReg_in, RegWrite_in, MemRead_in, MemWrite_in, Branch_in, ALUOp, ALUin1,
          rd_2_in, ExtendOut, PC, Opcode, wr_addr_in, MemtoReg_out, RegWrite_out, MemRead_out,
          MemWrite_out, Branch_out, Zero, ALUresult, BranchPC, rd_2_out, wr_addr_out);
    input ALUSrc, MemtoReg_in, RegWrite_in, MemRead_in, MemWrite_in, Branch_in;
    input [1:0] ALUOp;
    input [63:0] ALUin1, rd_2_in, ExtendOut, PC;
    input [10:0] Opcode;
    input [4:0] wr_addr_in;
    output reg MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out;
    output Zero;
    output [63:0] ALUresult, BranchPC;
    output reg [63:0] rd_2_out;
    output reg [4:0] wr_addr_out;
    wire [63:0] ALUin2;
    wire [3:0] ALU_operation;

    ALU ALU(.ALU_operation(ALU_operation), .A(ALUin1), .B(ALUin2), .ALU_result(ALUresult), .Zero(Zero));
    ALUControl ALUctrl(.Opcode(Opcode), .ALUOp(ALUOp), .ALU_operation(ALU_operation));
    Adder adder(.in1(PC), .in2(ExtendOut), .out(BranchPC));
    Mux64 mux(.in1(rd_2_in), .in2(ExtendOut), .switch(ALUSrc), .out(ALUin2));
    
    always @ (*) begin
        MemtoReg_out <= MemtoReg_in;
        RegWrite_out <= RegWrite_in;
        MemRead_out <= MemRead_in;
        MemWrite_out <= MemWrite_in;
        Branch_out <= Branch_in;
        rd_2_out <= rd_2_in;
        wr_addr_out <= wr_addr_in;
    end

endmodule
