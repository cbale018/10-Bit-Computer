`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2018 04:18:10 AM
// Design Name: 
// Module Name: WtoF
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


module MtoW(
    input clk,
    input rst,
    input [9:0] wr_data0,
    input wr_en0,
    input [2:0] wr_reg0,
    output reg [9:0] wr_data,
    output reg wr_en,
    output reg [2:0] wr_reg
    );
    
    always@(posedge clk) begin
        if (rst == 1) begin
            wr_data = 0;
            wr_en = 0;
            wr_reg = 0;
        end
        else begin
            wr_data = wr_data0;
            wr_en = wr_en0;
            wr_reg = wr_reg0;
        end
    end
endmodule
