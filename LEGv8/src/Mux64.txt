`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 12:10:21
// Design Name: 
// Module Name: Mux64
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


module Mux64(in1, in2, switch, out);
    input [63:0] in1, in2;
    input switch;
    output reg [63:0] out;
    
    always @(*)
    case(switch)
        0:  out <= in1;
        1:  out <= in2;
    endcase
    
endmodule
