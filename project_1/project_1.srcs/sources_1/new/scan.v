`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/01 16:03:46
// Design Name: 
// Module Name: scan
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


//輸出scan，用來決定使用的七段顯示器
//scan為0001,0010,0100,1000(1,2,4,8)

module scan (
    scan, clk, rst
);
    input clk, rst;
    output [3:0] scan;
    reg [3:0] scan;

//    always @(*)
//    begin
//        if (rst)
//            scan <= 4'b1;
//        else if (scan == 4'd2)
//            scan <= 4'd4;
//        else if (scan == 4'd4)
//            scan <= 4'd8;
//        else
//            scan <= 4'd1;
//    end

    always @(posedge clk or posedge rst)
    begin
        if (rst)
            scan <= 4'b1;
        else if (scan == 4'd8)
            scan <= 4'd1;
        else
            // 邏輯左移
            scan <= (scan<<1);
    end
    
endmodule
