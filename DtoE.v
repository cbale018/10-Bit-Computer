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


module DtoE(
    input clk,
    input rst,
    input [2:0] read_reg10,
    input [2:0] read_reg20,
    input [1:0] ALU_op0,
    input [1:0] ldst_en0,
    input wr_en0,
    input [2:0] wr_reg0,
    input [1:0] write_val_op0,
    input [9:0] reg1_out0,
    input [9:0] reg2_out0,
    input [9:0] t1_out0,
    input [9:0] pcval0,
    input [9:0] imm_val0,
    output reg [2:0] read_reg1,
    output reg [2:0] read_reg2,
    output reg [1:0] ALU_op,
    output reg [1:0] ldst_en,
    output reg wr_en,
    output reg [2:0] wr_reg,
    output reg [1:0] write_val_op,
    output reg [9:0] reg1_out,
    output reg [9:0] reg2_out,
    output reg [9:0] t1_out,  
    output reg [9:0] pcval,
    output reg [9:0] imm_val
    );
    
    always@(posedge clk) begin
        if(rst == 1) begin
            read_reg1 = 0;
            read_reg2 = 0;
            ALU_op = 0;
            ldst_en = 0;
            wr_en = 0;
            wr_reg = 0;
            write_val_op = 0;
            reg1_out = 0;
            reg2_out = 0;
            t1_out = 0;
            pcval = 0;
            imm_val = 0;
        end
        else begin
            read_reg1 = read_reg10;
            read_reg2 = read_reg20;
            ALU_op = ALU_op0;
            ldst_en = ldst_en0;
            wr_en = wr_en0;
            wr_reg = wr_reg0;
            write_val_op = write_val_op0;
            reg1_out = reg1_out0;
            reg2_out = reg2_out0;
            t1_out = t1_out0;
            pcval = pcval0;
            imm_val = imm_val0;
        end
    end
endmodule
