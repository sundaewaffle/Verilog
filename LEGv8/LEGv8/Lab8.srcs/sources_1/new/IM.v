`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 12:34:41
// Design Name: 
// Module Name: IM
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


module IM(PCout, InstructionOut);
    input [63:0] PCout;
    output reg [31:0] InstructionOut;
    reg [7:0] IM[0:255];
    integer i;
    
    always @ (*)
    begin
        InstructionOut[ 7: 0] = IM[PCout[7:0]];
        InstructionOut[15: 8] = IM[PCout[7:0]+1];
        InstructionOut[23:16] = IM[PCout[7:0]+2];
        InstructionOut[31:24] = IM[PCout[7:0]+3];
    end
    
    initial
    begin
        for(i=0; i<=255; i=i+1) IM[i] = 0;
        
        // LDUR X1, [X31, #8]   = 11111000 010/00000 1000/00/11 111/00001 = f8 40 83 e1
        IM[3] = 8'hf8;      IM[2] = 8'h40;      IM[1] = 8'h83;      IM[0] = 8'he1;
        // LDUR X2, [X31, #16]  = 11111000 010/00001 0000/00/11 111/00010 = f8 41 03 e2
        IM[7] = 8'hf8;      IM[6] = 8'h41;      IM[5] = 8'h03;      IM[4] = 8'he2;
        // LDUR X3, [X31, #24]  = 11111000 010/00001 1000/00/11 111/00011 = f8 41 83 e3
        IM[11] = 8'hf8;     IM[10] = 8'h41;     IM[9] = 8'h83;      IM[8] = 8'he3;
        // LDUR X4, [X31, #32]  = 11111000 010/00010 0000/00/11 111/00010 = f8 42 03 e4
        IM[15] = 8'hf8;     IM[14] = 8'h42;     IM[13] = 8'h03;     IM[12] = 8'he4;
        // LDUR X5, [X31, #40]  = 11111000 010/00010 1000/00/11 111/00101 = f8 42 83 e5
        IM[19] = 8'hf8;     IM[18] = 8'h42;     IM[17] = 8'h83;     IM[16] = 8'he5;
        // LDUR X6, [X31, #48]                                            = f8 43 03 e6
        IM[23] = 8'hf8;     IM[22] = 8'h43;     IM[21] = 8'h03;     IM[20] = 8'he6;
        // LDUR X7, [X31, #56]                                            = f8 43 83 e7
        IM[27] = 8'hf8;     IM[26] = 8'h43;     IM[25] = 8'h83;     IM[24] = 8'he7;
        // LDUR X8, [X31, #64]                                            = f8 44 03 e8
        IM[31] = 8'hf8;     IM[30] = 8'h44;     IM[29] = 8'h03;     IM[28] = 8'he8;
        // LDUR X9, [X31, #72]                                            = f8 44 83 e9
        IM[35] = 8'hf8;     IM[34] = 8'h44;     IM[33] = 8'h83;     IM[32] = 8'he9;
        // LDUR X10, [X31, #80]                                           = f8 45 03 ea
        IM[39] = 8'hf8;     IM[38] = 8'h45;     IM[37] = 8'h03;     IM[36] = 8'hea;
        // LDUR X11, [X31, #88]                                           = f8 45 83 eb
        IM[43] = 8'hf8;     IM[42] = 8'h45;     IM[41] = 8'h83;     IM[40] = 8'heb;
        // LDUR X12, [X31, #96]                                           = f8 46 03 ec
        IM[47] = 8'hf8;     IM[46] = 8'h46;     IM[45] = 8'h03;     IM[44] = 8'hec;
        
        // ADD X2, X1, X3       = 10001011 000/00011 /000000/00 001/00010 = 8b 03 00 22
        IM[51] = 8'h8b;     IM[50] = 8'h03;     IM[49] = 8'h00;     IM[48] = 8'h22;
        // SUB X6, X5, X4       = 11001011 000/00100 /000000/00 101/00110 = cb 04 00 a6
        IM[55] = 8'hcb;     IM[54] = 8'h04;     IM[53] = 8'h00;     IM[52] = 8'ha6;
        // OR X9, X7, X8        = 10101010 000/01000 /000000/00 111/01001 = aa 08 00 e9
        IM[59] = 8'haa;     IM[58] = 8'h08;     IM[57] = 8'h00;     IM[56] = 8'he9;
        // AND X12, X10, X11    = 10001010 000/01011 /000000/01 010/01100 = 8a 0b 01 4c
        IM[63] = 8'h8a;     IM[62] = 8'h0b;     IM[61] = 8'h01;     IM[60] = 8'h4c;
    end

endmodule
