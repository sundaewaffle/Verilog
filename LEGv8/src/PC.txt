`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 12:08:11
// Design Name: 
// Module Name: PC
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


module PC(clk, PCin, PCout);
    input clk;
    input [63:0] PCin;
    output reg [63:0] PCout;
    
    initial
        PCout = 0;
    
    always @ (posedge clk)
        PCout <= PCin;
    
endmodule
