`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 20:44:46
// Design Name: 
// Module Name: clk_4hz
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

module clk_4hz (
    clk_4hz, clk, rst
);
    input clk, rst;
    output clk_4hz;
    reg clk_4hz;
    reg [23:0] count;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            begin
                count <= 24'd0;
                clk_4hz <= 1'b0;
            end
        else if (count == 24'd12500000)
            begin
                count <= 24'd0;
                clk_4hz <= ~clk_4hz;
            end
        else
            begin
                count <= count + 24'd1;
                clk_4hz <= clk_4hz;
            end
    end
    
endmodule

