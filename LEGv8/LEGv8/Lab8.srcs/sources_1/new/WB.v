`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 14:09:08
// Design Name: 
// Module Name: WB
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


module WB(MemtoReg, ALUresult, rd_data, reg_wr_data);
    input MemtoReg;
    input [63:0] ALUresult, rd_data;
    output [63:0] reg_wr_data;

    Mux64 mux(.in1(ALUresult), .in2(rd_data), .switch(MemtoReg), .out(reg_wr_data));

endmodule
