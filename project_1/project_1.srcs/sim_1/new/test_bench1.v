`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 20:24:53
// Design Name: 
// Module Name: test_bench1
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


module test_bench1(
    stop
    );
    output reg [3:0] stop;
    reg enable;
    
    initial
    begin
        #0 enable <= 0;
        #10 enable <= 1;
    end
    
    always@(posedge enable)
    begin
        #0 stop <= 4'd0;
        #1000000000 stop <= 4'd1;
        #1000000000 stop <= 4'd2;
        #1000000000 stop <= 4'd3;
        #1000000000 stop <= 4'd4;
        #1000000000 stop <= 4'd5;
        #1000000000 stop <= 4'd6;
        #1000000000 stop <= 4'd7;
        #1000000000 stop <= 4'd8;
    end
    
endmodule
