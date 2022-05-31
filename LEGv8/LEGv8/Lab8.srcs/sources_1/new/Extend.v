`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 12:54:27
// Design Name: 
// Module Name: Extend
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


module Extend(in, out);
    input [31:0] in;
    output reg [63:0] out;
    
    always @(*)
    casez (in[31:21])
    11'b10110100zzz: begin  // CBZ
        out = {{45{in[23]}}, in[23:5]};
    end
    default: begin          // D-type
        out = {{55{in[20]}}, in[20:12]};
    end
    endcase
    
endmodule
