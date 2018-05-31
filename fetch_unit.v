`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: fetch_unit
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module fetch_unit(
    input clk,                  //clock
    input reset,                //reset
    input [1:0] ldst_bit,
    input [9:0] prev_addr,
    input [1:0] fetch_control,  //fetch mode selection  
    input [9:0] ra_addr,        //return address
    input [9:0] jump_addr,      //jump address
    input [9:0] comp_control,             //compare inst
    input jump_control,
    output [9:0] instr_rd_addr,  //instruction memory read address
    output reg [9:0] pcval             //program counter
    );
    
    reg [9:0] add_a, add_b;  
    reg [9:0] realjmp_addr;
    wire [9:0] add_output;
    
    initial begin
        add_a = 10'h00;
        add_b = 10'h000;
        realjmp_addr = 10'h000;
    end
    
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
     always @(clk) begin
              if(jump_control == 0) begin
         if(comp_control == 0) begin
             realjmp_addr = 10'h001;
             end
         else begin
             realjmp_addr = jump_addr;
             end
         end
         else
         begin
         realjmp_addr = jump_addr;
         end
          case (fetch_control)
             2'b00 : begin                     //Normal
                    if(ldst_bit == 2'b10) begin
                       add_a = prev_addr;
                       add_b = 10'b1;
                       end
                       else begin
                       add_a = instr_rd_addr; 
                       add_b = 10'd1;
                       end  
                     end
             2'b01 : begin                     //Jump
                       add_a = prev_addr;   
                       add_b = realjmp_addr;   
                     end
             2'b10 : begin                     //Return
                       add_a = ra_addr;        
                       add_b = 10'd1;  
                     end
             2'b11 : begin                     //halt
                       add_a = prev_addr;        
                       add_b = 10'b0;
                     end
             endcase
           
           pcval = instr_rd_addr;
           
           if (reset==1) begin
            pcval = 0;
            add_a = 0;
            add_b = 0;
            realjmp_addr = 0;
           end
           end                               
endmodule
