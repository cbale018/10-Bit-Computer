`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: reg_10bits
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module reg_10bits(
    input [9:0] d,
    input clk,
    input rst,
    input wen,
    output [9:0] q
    );    
    
    reg_1bit reg0(d[0],clk,rst,wen,q[0]); 
    reg_1bit reg1(d[1],clk,rst,wen,q[1]);               
    reg_1bit reg2(d[2],clk,rst,wen,q[2]);
    reg_1bit reg3(d[3],clk,rst,wen,q[3]); 
    reg_1bit reg4(d[4],clk,rst,wen,q[4]);               
    reg_1bit reg5(d[5],clk,rst,wen,q[5]);
    reg_1bit reg6(d[6],clk,rst,wen,q[6]); 
    reg_1bit reg7(d[7],clk,rst,wen,q[7]);               
    reg_1bit reg8(d[8],clk,rst,wen,q[8]);
    reg_1bit reg9(d[9],clk,rst,wen,q[9]); 
        
endmodule
