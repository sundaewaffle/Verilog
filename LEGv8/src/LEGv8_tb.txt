`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530
// Engineer: Sheng-Hung Hung
// 
// Create Date: 2020/12/03 16:35:22
// Design Name: 
// Module Name: LEGv8_tb
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


module LEGv8_tb(

    );
    
    // input(reg), output(wire)
    reg clk, reset;
        
    // Instantiate Unit Under Test (UUT)
    LEGv8 uut(.clk(clk), .reset(reset));
        
    // clock cycle = 50
    always
        #25 clk = !clk;
            
    // start testing
    initial
    begin
        clk = 0;
        reset = 0;
    end

endmodule
