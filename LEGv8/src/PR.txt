`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 14:18:29
// Design Name: 
// Module Name: PR
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


module PR(clk, in, out);
    input clk;
    input [300:0] in;
    output reg [300:0] out;
    
    always @ (posedge clk)
        out <= in;
    
    initial begin
        out <= 0;
    end
    
endmodule
