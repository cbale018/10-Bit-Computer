`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2018 07:36:10 AM
// Design Name: 
// Module Name: sim_fetch_unit
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


module sim_fetch_unit;
    //input
    reg clk,reset;
//    reg clk,reset,return_en,jump_en;
    reg [1:0] fetch_control;
    reg [9:0]ra_addr;
    reg [7:0]jump_addr;
    wire [9:0] instr_rd_addr;

    fetch_unit uut(clk,reset,fetch_control, ra_addr,jump_addr,instr_rd_addr);
//    fetch_unit uut(clk,reset, ra_addr,return_en,jump_addr,jump_en,instr_rd_addr);
    
    initial begin
        clk = 0;
        reset = 1;
        fetch_control = 2'd0;
        ra_addr = 10'd0;
//        return_en = 0;
        jump_addr = 8'd0;
//        jump_en = 0;
    end
     
    always #5 clk = ~clk;
    initial begin
        #10 reset = 0;
//        #30 return_en = 1;
        #30 fetch_control = 2'b10;
        #1 ra_addr = 10'h3FC;
//        #9 return_en =0;
        #9 fetch_control = 2'b00;
//        #50 jump_en =1;
        #50 fetch_control = 2'b01;
        #1 jump_addr = 8'ha5;
        #9 fetch_control = 2'b11;
        #30 fetch_control = 2'b00;
//        #9 jump_en =0;
   end
   
endmodule
