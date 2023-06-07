`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/01 16:03:32
// Design Name: 
// Module Name: led_decoder
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


module led_decoder (
    seg_code, in, clk, rst
);
    input clk,rst;
    input [3:0] in;
    output [7:0] seg_code;
    reg [7:0] seg_code;

    parameter _1 = 8'h06, _3 = 8'h4f, _5 = 8'h6d, _7 = 8'h07, _9 = 8'h6f, __ = 8'h40;

    always @(posedge clk)
    begin
        if (rst)
            seg_code <= __;
        else
        begin
            case (in)
                4'h0: seg_code <= _1;
                4'h1: seg_code <= _3;
                4'h2: seg_code <= _5;
                4'h3: seg_code <= _7;
                4'h4: seg_code <= _9;
                4'h5: seg_code <= __;
                4'h7: seg_code <= _1;
                4'h8: seg_code <= _3;
                4'h9: seg_code <= _5;
                4'hA: seg_code <= _7;
                4'hB: seg_code <= _9;
                4'hC: seg_code <= __;
                4'hD: seg_code <= _1;
                4'hE: seg_code <= _3;
                4'hF: seg_code <= _5;
                default: seg_code <= __;
            endcase
        end
    end
    
endmodule
