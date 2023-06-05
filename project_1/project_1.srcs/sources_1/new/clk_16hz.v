`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 22:05:31
// Design Name: 
// Module Name: clk_16hz
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


module clk_16hz (
    clk_16hz, clk, rst
);
    input clk, rst;
    output clk_16hz;
    reg clk_16hz;
    reg [21:0] count;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                count <= 22'd0;
                clk_16hz <= 1'b0;
            end
        else if (count == 22'd3125000)
            begin
                count <= 22'd0;
                clk_16hz <= ~clk_16hz;
            end
        else
            begin
                count <= count + 22'd1;
                clk_16hz <= clk_16hz;
            end
    end
    
endmodule
