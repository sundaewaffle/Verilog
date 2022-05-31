`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 12:55:20
// Design Name: 
// Module Name: ID
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


module ID(clk, reset, RegWriteIn, Instruction, wr_addr_in, wr_data, PCin, ALUSrc, MemtoReg, RegWrite,
          MemRead, MemWrite, Branch, ALUOp, rd_1, rd_2, ExtendOut, PCout, Opcode, wr_addr_out);
    input clk, reset, RegWriteIn;
    input [31:0] Instruction;
    input [4:0] wr_addr_in;
    input [63:0] wr_data, PCin;
    output ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    output [1:0] ALUOp;
    output [63:0] rd_1, rd_2, ExtendOut;
    output reg [63:0] PCout;
    output reg [10:0] Opcode;
    output reg [4:0] wr_addr_out;
    wire Reg2Loc;
    wire [4:0] rd_addr_2;
    
    RF RegFile(.clk(clk), .reset(reset), .wr_en(RegWriteIn), .rd_addr_1(Instruction[9:5]),
               .rd_addr_2(rd_addr_2), .wr_addr(wr_addr_in), .d_in(wr_data), .d_out_1(rd_1), .d_out_2(rd_2));
    Control control(.OPcode(Instruction[31:21]), .ALUOp(ALUOp), .Reg2Loc(Reg2Loc), .ALUSrc(ALUSrc), 
                    .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite),
                    .Branch(Branch));
    Extend extend(.in(Instruction), .out(ExtendOut));
    Mux5 mux(.in1(Instruction[20:16]), .in2(Instruction[4:0]), .switch(Reg2Loc), .out(rd_addr_2));
    
    always @ (*) begin
        PCout <= PCin;
        Opcode <= Instruction[31:21];
        wr_addr_out <= Instruction[4:0];
    end
    
endmodule
