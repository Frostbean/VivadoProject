`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 02:10:45
// Design Name: 
// Module Name: clk_1hz
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


module clk_1hz (
    clk_1hz, clk, rst
);
    input clk, rst;
    output clk_1hz;
    reg clk_1hz;
    reg [15:0] count;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                count <= 16'd0;
                clk_1hz <= 1'b0;
            end
        else if (count == 16'd50000)
            begin
                count <= 16'd0;
                clk_1hz <= ~clk_1hz;
            end
        else
            begin
                count <= count + 16'd1;
                clk_1hz <= clk_1hz;
            end
    end
    
endmodule

