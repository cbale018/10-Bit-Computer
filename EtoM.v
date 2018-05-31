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


module EtoM(
    input clk,
    input rst,
    input [1:0] ldst_en0,
    input wr_en0,
    input [9:0] alu_out0,
    input [2:0] wr_reg0,
    input [9:0] t10,
    output reg [1:0] ldst_en,
    output reg wr_en,
    output reg [9:0] alu_out,
    output reg [2:0] wr_reg,
    output reg [9:0] t1 
    );
    
    always@(posedge clk) begin
        if(rst == 1) begin
            ldst_en = 0;
            wr_en = 0;
            alu_out = 0;
            wr_reg = 0;
            t1 = 0;
        end
        else begin
            ldst_en = ldst_en0;
            wr_en = wr_en0;
            alu_out = alu_out0;
            wr_reg = wr_reg0;
            t1 = t10;      
        end
    end
endmodule
