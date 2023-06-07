`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/07 16:18:29
// Design Name: 
// Module Name: test_bench_1
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


module test_bench_1(
    led
    );
    output [7:0] led;
    reg [7:0] led;
    reg clk, rst,enable;
    
    initial
    begin
        #0 clk = 0; rst = 1; enable = 0;
        #10 clk = ~clk;
        #10 clk = ~clk; rst = 0;
        #10 clk = ~clk;
        #10 clk = ~clk;
        #10 clk = ~clk; enable = 1;
        #10 clk = ~clk;
        #10 clk = ~clk;
        #10 clk = ~clk;
        #10 clk = ~clk;
        #10 clk = ~clk;
        #10 $stop;
    end
    
    always@(posedge clk)
    begin
        if (rst)
            led <= 8'b00000111;
        else if (enable)
            led <= (led<<1);
        else
            led <= led;
    end
endmodule
