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
    clk,clk_16hz,rst,enable,ran
    );
    input clk,clk_16hz,rst,enable;
    output ran;
    wire [3:0] enable;
    reg[15:0]ran;
    reg[15:0] next_ran;
    reg [3:0] stop;
    reg [16:0] final_result;
    reg [3:0] number1;
    reg [3:0] number2;
    reg [3:0] number3;
    reg [3:0] number4;
    reg win;

    always@(posedge clk or posedge rst)
    begin
        if (rst)
            next_ran <= 16'b0011001100110011;
        else
            next_ran <= next_ran + 1'b1;            
    end
    
//    always@(rst)
//    begin
//        win <= 0;
//    end

    always@(posedge clk_16hz)
    begin
        if (!enable[3])
            ran[15:12] <= next_ran[15:12];
        else
            number1 <= ran[15:12];
    end
    
    always@(posedge clk_16hz)
    begin
        if (!enable[2])
            ran[11:8] <= next_ran[11:8];
        else
            number2 <= ran[11:8];
    end
    
    always@(posedge clk_16hz)
    begin
        if (!enable[1])
            ran[7:4] <= next_ran[7:4];
        else
            number3 <= ran[7:4];
    end
    
    always@(posedge clk_16hz)
    begin
        if (!enable[0])
            ran[3:0] <= next_ran[3:0];
        else
            number4 <= ran[3:0];
    end
    
//    always@(posedge clk_16hz)
//    begin
//        if (enable == 4'b1111 && (number1 % 6 == number2 % 6) && (number2 % 6 == number3 % 6) && (number3 % 6 == number4 % 6))
//            win <= 1;
//    end

endmodule
