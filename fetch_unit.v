`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: fetch_unit
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module fetch_unit(
    input clk,                  //clock
    input reset,                //reset
    input [1:0] fetch_control,  //fetch mode selection  
    input [9:0] ra_addr,        //return address
    input [7:0] jump_addr,      //jump address
    output [9:0] instr_rd_addr  //instruction memory read address
    );
    
    reg [9:0] add_a, add_b;  
    wire [9:0] add_output;
    
    //10bit adder
    adder_10bits addr(
    .a(add_a),
    .b(add_b),
    .cin(1'b0),
    .sum(add_output),
    .cout());
    
    //register
    reg_10bits pc(
    .d(add_output),
    .clk(clk),
    .rst(reset),
    .wen(1'b1),
    .q(instr_rd_addr));
    
    //fetch operation selection
     always @(fetch_control,instr_rd_addr,jump_addr,ra_addr) begin
          case (fetch_control)
             2'b00 : begin                     //Normal
                       add_a = instr_rd_addr;   
                       add_b = 10'd1;
                     end
             2'b01 : begin                     //Jump
                       add_a = instr_rd_addr;   
                       add_b = jump_addr;   
                     end
             2'b10 : begin                     //Return
                       add_a = ra_addr;        
                       add_b = 10'd0;  
                     end
             2'b11 : begin                     //(reserved)
                       add_a = instr_rd_addr;        
                       add_b = 10'd0;
                     end
             default : begin 
                         add_a = instr_rd_addr;        
                         add_b = 10'd0;
                     end
             endcase                                  
         end                          
    
                         
endmodule