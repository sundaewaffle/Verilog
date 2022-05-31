`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 14:21:17
// Design Name: 
// Module Name: LEGv8
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


module LEGv8(clk, reset);
    input clk, reset;
    wire [95:0] IF_ID_in;
    wire [279:0] ID_EX_in;
    wire [202:0] EX_MEM_in;
    wire [134:0] MEM_WB_in;
    wire [300:0] IF_ID_out, ID_EX_out, EX_MEM_out, MEM_WB_out;
    wire PCSrc;
    wire [63:0] reg_write_data;
    
    IF IF(.clk(clk),
          .PCSrc(PCSrc), .BranchPC(EX_MEM_out[133:70]),                             // input
          .Instruction(IF_ID_in[31:0]), .PCout(IF_ID_in[95:32]));                   // output
    
    PR IF_ID(.clk(clk), .in({{205{1'b0}}, IF_ID_in}), .out(IF_ID_out));
    
    ID ID(.clk(clk), .reset(reset),
          .RegWriteIn(MEM_WB_out[1]), .Instruction(IF_ID_out[31:0]),                // input
          .wr_addr_in(MEM_WB_out[134:130]), .wr_data(reg_write_data),               // input
          .PCin(IF_ID_out[95:32]),                                                  // input
          .ALUSrc(ID_EX_in[0]), .MemtoReg(ID_EX_in[1]), .RegWrite(ID_EX_in[2]),     // output
          .MemRead(ID_EX_in[3]), .MemWrite(ID_EX_in[4]), .Branch(ID_EX_in[5]),      // output
          .ALUOp(ID_EX_in[7:6]), .rd_1(ID_EX_in[71:8]), .rd_2(ID_EX_in[135:72]),    // output
          .ExtendOut(ID_EX_in[199:136]), .PCout(ID_EX_in[263:200]),                 // output
          .Opcode(ID_EX_in[274:264]), .wr_addr_out(ID_EX_in[279:275]));             // output
          
    PR ID_EX(.clk(clk), .in({{21{1'b0}}, ID_EX_in}), .out(ID_EX_out));
    
    EX EX(.ALUSrc(ID_EX_out[0]), .MemtoReg_in(ID_EX_out[1]),                        // input
          .RegWrite_in(ID_EX_out[2]), .MemRead_in(ID_EX_out[3]),                    // input
          .MemWrite_in(ID_EX_out[4]), .Branch_in(ID_EX_out[5]),                     // input
          .ALUOp(ID_EX_out[7:6]), .ALUin1(ID_EX_out[71:8]),                         // input
          .rd_2_in(ID_EX_out[135:72]), .ExtendOut(ID_EX_out[199:136]),              // input
          .PC(ID_EX_out[263:200]), .Opcode(ID_EX_out[274:264]),                     // input
          .wr_addr_in(ID_EX_out[279:275]),                                          // input
          .MemtoReg_out(EX_MEM_in[0]), .RegWrite_out(EX_MEM_in[1]),                 // output
          .MemRead_out(EX_MEM_in[2]), .MemWrite_out(EX_MEM_in[3]),                  // output
          .Branch_out(EX_MEM_in[4]), .Zero(EX_MEM_in[5]),                           // output
          .ALUresult(EX_MEM_in[69:6]), .BranchPC(EX_MEM_in[133:70]),                // output
          .rd_2_out(EX_MEM_in[197:134]), .wr_addr_out(EX_MEM_in[202:198]));         // output
    
    PR EX_MEM(.clk(clk), .in({{98{1'b0}}, EX_MEM_in}), .out(EX_MEM_out));
    
    MEM MEM(.clk(clk),
            .MemtoReg_in(EX_MEM_out[0]), .RegWrite_in(EX_MEM_out[1]),               // input
            .MemRead(EX_MEM_out[2]), .MemWrite(EX_MEM_out[3]),                      // input
            .Branch(EX_MEM_out[4]), .Zero(EX_MEM_out[5]),                           // input
            .ALUresult_in(EX_MEM_out[69:6]), .wr_data(EX_MEM_out[197:134]),         // input
            .addr(EX_MEM_out[13:6]), .wr_addr_in(EX_MEM_out[202:198]),              // input
            .PCSrc(PCSrc), .MemtoReg_out(MEM_WB_in[0]),                             // output
            .RegWrite_out(MEM_WB_in[1]), .rd_data(MEM_WB_in[65:2]),                 // output
            .ALUresult_out(MEM_WB_in[129:66]), .wr_addr_out(MEM_WB_in[134:130]));   // output
    
    PR MEM_WB(.clk(clk), .in({{166{1'b0}}, MEM_WB_in}), .out(MEM_WB_out));
    
    WB WB(.MemtoReg(MEM_WB_out[0]), .ALUresult(MEM_WB_out[129:66]),
          .rd_data(MEM_WB_out[65:2]), .reg_wr_data(reg_write_data));

endmodule
