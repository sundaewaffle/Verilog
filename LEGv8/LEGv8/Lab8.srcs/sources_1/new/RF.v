`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 12:49:14
// Design Name: 
// Module Name: RF
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


module RF(clk, reset, wr_en, rd_addr_1, rd_addr_2,
               wr_addr, d_in, d_out_1, d_out_2);

    input clk, reset, wr_en;
    input [4:0] rd_addr_1, rd_addr_2, wr_addr;
    input [63:0] d_in;
    output reg [63:0] d_out_1, d_out_2;
    reg [63:0] RF[0:31];
    integer i;
    
    always @(*) begin
        if (reset == 1'b1) begin
            for (i=0; i<64; i=i+1) RF[i] <= 64'h0000000000000000;
        end
        else if (wr_en == 1'b1)
            RF[wr_addr] <= d_in;
    end
    
    always @(*) begin
        d_out_1 <= RF[rd_addr_1];
        d_out_2 <= RF[rd_addr_2];
    end
    
    initial
    begin
        for (i=0; i<64; i=i+1) RF[i] <= 64'h0000000000000000;
    end
    
endmodule
