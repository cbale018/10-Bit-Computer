`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: reg_1bit
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module reg_1bit(
    input d,
    input clk,
    input rst,
    input wen,
    output reg q
    );
    
    initial begin
        q = 1'b0;
    end
    
     always @(posedge clk) begin
        if(rst == 1)
            q = 0;
        else
            if(wen == 1)
                q = d;
            else 
                q = q;    
     end
     
endmodule
