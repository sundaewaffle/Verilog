`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng_Hung Hung
// 
// Create Date: 2020/12/03 14:00:54
// Design Name: 
// Module Name: MEM
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


module MEM(clk, MemtoReg_in, RegWrite_in, MemWrite, MemRead, Branch, Zero, ALUresult_in, wr_data,
           addr, wr_addr_in, PCSrc, MemtoReg_out, RegWrite_out, rd_data, ALUresult_out, wr_addr_out);
    input clk, MemtoReg_in, RegWrite_in, MemRead, MemWrite, Branch, Zero;
    input [63:0] ALUresult_in, wr_data;
    input [7:0] addr;
    input [4:0] wr_addr_in;
    output reg PCSrc, MemtoReg_out, RegWrite_out;
    output [63:0] rd_data;
    output reg [63:0] ALUresult_out;
    output reg [4:0] wr_addr_out;

    DM DataMemory(.clk(clk), .mem_wr(MemWrite), .mem_rd(MemRead), .addr(addr), .wr_data(wr_data), .rd_data(rd_data));

    always @ (*) begin
        PCSrc <= Branch & Zero;
        MemtoReg_out <= MemtoReg_in;
        RegWrite_out <= RegWrite_in;
        ALUresult_out <= ALUresult_in;
        wr_addr_out <= wr_addr_in;
    end

endmodule
