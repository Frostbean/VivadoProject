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
    clk,clk_quarter_hz,rst,enable,ran,led
    );
    input clk,clk_quarter_hz,rst,enable;
    output ran,led;
    reg[15:0]ran;
    reg[15:0] next_ran;
    reg[7:0] led;

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
    
    always@(posedge clk_quarter_hz or posedge rst)
    begin
        if (rst)
            led <= 8'b11100000;
        else if (led == 8'b00000000)
            led <= 8'b10000000;
        else if (led == 8'b10000000)
            led <= 8'b11000000;
        else if (led == 8'b11000000)
            led <= 8'b11100000;
        else if (!enable)
            led <= (led>>1);
        else
            led <= led;
    end
    
endmodule
