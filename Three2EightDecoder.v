`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2018 05:35:12 PM
// Design Name: 
// Module Name: Three2EightDecoder
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


module Three2EightDecoder(input [2:0] selector, input reg_write_enable, output reg [7:0] selected);
        
        always @(selector, reg_write_enable) begin
         selected[0] = ~selector[2] & ~selector[1] & ~selector[0] & reg_write_enable;
         selected[1] = ~selector[2] & ~selector[1] & selector[0] & reg_write_enable;
         selected[2] = ~selector[2] & selector[1] & ~selector[0] & reg_write_enable;
         selected[3] = ~selector[2] & selector[1] & selector[0] & reg_write_enable;
         selected[4] = selector[2] & ~selector[1] & ~selector[0] & reg_write_enable;
         selected[5] = selector[2] & ~selector[1] & selector[0] & reg_write_enable;
         selected[6] = selector[2] & selector[1] & ~selector[0] & reg_write_enable;
         selected[7] = selector[2] & selector[1] & selector[0] & reg_write_enable;
        end
        
endmodule
