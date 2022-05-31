`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng_Hung Hung
// 
// Create Date: 2020/12/03 13:57:48
// Design Name: 
// Module Name: DM
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


module DM(clk, mem_wr, mem_rd, addr, wr_data, rd_data);
    input clk, mem_wr, mem_rd;
    input [7:0] addr;
    input [63:0] wr_data;
    output reg [63:0] rd_data;
    reg [7:0] DM[0:255];
    integer i, j, v;
    
    always @ (posedge clk) begin
        if (mem_wr == 1'b1) begin
            DM[addr]   = wr_data[ 7: 0];
            DM[addr+1] = wr_data[15: 8];
            DM[addr+2] = wr_data[23:16];
            DM[addr+3] = wr_data[31:24];
            DM[addr+4] = wr_data[39:32];
            DM[addr+5] = wr_data[47:40];
            DM[addr+6] = wr_data[55:48];
            DM[addr+7] = wr_data[63:56];
        end
    end
    
    always @ (*) begin
        if (mem_rd == 1'b1) begin
            rd_data[ 7: 0] = DM[addr];
            rd_data[15: 8] = DM[addr+1];
            rd_data[23:16] = DM[addr+2];
            rd_data[31:24] = DM[addr+3];
            rd_data[39:32] = DM[addr+4];
            rd_data[47:40] = DM[addr+5];
            rd_data[55:48] = DM[addr+6];
            rd_data[63:56] = DM[addr+7];
        end else begin
            rd_data = 64'bz;
        end
    end
    
    initial begin
        for (i=0; i<255; i=i+1) DM[i] = 8'h00;
    end
    
    initial begin
        v = 0;
        for (j=0; j<104; j=j+8) begin
            for (i=0; i<8; i=i+1) DM[j+i] = v;
            v = v + 17;
        end
    end
    
endmodule
