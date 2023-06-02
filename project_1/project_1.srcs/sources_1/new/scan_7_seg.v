`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/01 16:04:26
// Design Name: 
// Module Name: scan_7_seg
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


module scan_7_seg (
    seg_code, scan, clk, rst, enable
);
    input clk, rst, enable;
    output seg_code;
    output [3:0] scan;
    wire [15:0] result;
    wire [7:0] seg_code;
    wire [3:0] scan;
    wire clk_1khz, clk_quarter_hz;
    reg [3:0] temp;
    reg [3:0] in;

    random_generator m1(.enable(enable), .clk(clk), .clk_quarter_hz(clk_quarter_hz), .ran(result), .rst(rst));
    scan m2(.scan(scan), .clk(clk_1khz), .rst(rst));
    led_decoder m3(.seg_code(seg_code), .in(in), .clk(clk), .rst(rst));
    clk_1khz m4(.clk_1khz(clk_1khz), .clk(clk), .rst(rst));
    clk_quarter_hz m5(.clk_quarter_hz(clk_quarter_hz), .clk(clk), .rst(rst));

    initial
    begin
        temp <= 4'd0;
    end

    always @(posedge clk_1khz or posedge rst)
    begin
        if (rst)
            temp <= 4'd0;
        else if (temp == 4'd3)
            temp <= 4'd0;
        else
            temp <= temp + 1'b1;
    end

    always @(*)
    begin
        if (temp == 4'd0)
            in <= result[15:12];
        else if (temp == 4'd1)
            in <= result[11:8];
        else if (temp == 4'd2)
            in <= result[7:4];
        else
            in <= result[3:0];
    end
    
endmodule
