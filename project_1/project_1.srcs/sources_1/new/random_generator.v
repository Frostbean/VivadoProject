`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/01 16:02:48
// Design Name: 
// Module Name: random_generator
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


module random_generator(
    clk,clk_quarter_hz,rst,enable,ran
    );
    input clk,clk_quarter_hz,rst,enable;
    output ran;
    reg[15:0]ran;
    reg[15:0] next_ran;

    always@(posedge clk or posedge rst)
    begin
        if (rst)
            next_ran <= 16'b0011001100110011;
        else
            next_ran <= next_ran + 1'b1;            
    end

    always@(posedge clk_quarter_hz or posedge rst)
    begin
        if (rst)
            ran<=16'b0011001100110011;
        else if(enable)
            ran<=ran;
        else
            ran<=next_ran;
    end
endmodule
