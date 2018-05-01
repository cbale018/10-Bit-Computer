`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: register_file
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module register_file(
    input [2:0] read_reg1,      //read address1
    input [2:0] read_reg2,      //read address2
    input [2:0] write_reg,      //wrie address
    input [9:0] write_data,     //write data
    input reg_write_en,         //write enable
    input clk,                  //clock
    input reset,                //reset
    output reg [9:0] reg1_out,  //read data1
    output reg [9:0] reg2_out   //read data2
    );
    
    wire [9:0] reg_s0, reg_s1,reg_s2, reg_s3, reg_t0, reg_t1, reg_ra, reg_sp;
    reg reg_s0_wr_en,reg_s1_wr_en,reg_s2_wr_en,reg_s3_wr_en,
         reg_t0_wr_en,reg_t1_wr_en,reg_ra_wr_en,reg_sp_wr_en;
    
    //10bit register units
    reg_10bits s0(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_s0_wr_en),
    .q(reg_s0));
    
    reg_10bits s1(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_s1_wr_en),
    .q(reg_s1));    
    
     reg_10bits s2(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_s2_wr_en),
    .q(reg_s2));
    
    reg_10bits s3(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_s3_wr_en),
    .q(reg_s3));    
 
     reg_10bits t0(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_t0_wr_en),
    .q(reg_t0));
    
    reg_10bits t1(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_t1_wr_en),
    .q(reg_t1));    
    
     reg_10bits ra(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_ra_wr_en),
    .q(reg_ra));
    
    reg_10bits sp(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_sp_wr_en),
    .q(reg_sp));       
   
   //generate write enable signals 
   always @(write_reg,reg_write_en) begin
        reg_s0_wr_en = 0;
        reg_s1_wr_en = 0;
        reg_s2_wr_en = 0;
        reg_s3_wr_en = 0;
        reg_t0_wr_en = 0;
        reg_t1_wr_en = 0;
        reg_ra_wr_en = 0;
        reg_sp_wr_en = 0; 
       case (write_reg)                  
        0:   reg_s0_wr_en = reg_write_en;      
        1:   reg_s1_wr_en = reg_write_en;      
        2:   reg_s2_wr_en = reg_write_en;      
        3:   reg_s3_wr_en = reg_write_en;      
        4:   reg_t0_wr_en = reg_write_en;      
        5:   reg_t1_wr_en = reg_write_en;         
        6:   reg_ra_wr_en = reg_write_en;         
        7:   reg_sp_wr_en = reg_write_en;         
       default : ;                     
     endcase    
   end
    
   //output1 selection  
   always @(read_reg1,reg_s0, reg_s1,reg_s2, reg_s3, reg_t0, reg_t1, reg_ra, reg_sp) begin
       case (read_reg1)                  
           0:   reg1_out = reg_s0;      
           1:   reg1_out = reg_s1;      
           2:   reg1_out = reg_s2;      
           3:   reg1_out = reg_s3;      
           4:   reg1_out = reg_t0;      
           5:   reg1_out = reg_t1;         
           6:   reg1_out = reg_ra;         
           7:   reg1_out = reg_sp;         
          default : reg1_out = 10'd0;                     
        endcase                                       
    end      
     
     //output2 selection  
     always @(read_reg2,reg_s0, reg_s1,reg_s2, reg_s3, reg_t0, reg_t1, reg_ra, reg_sp) begin
        case (read_reg2)                      
            0:   reg2_out = reg_s0;          
            1:   reg2_out = reg_s1;          
            2:   reg2_out = reg_s2;          
            3:   reg2_out = reg_s3;          
            4:   reg2_out = reg_t0;          
            5:   reg2_out = reg_t1;             
            6:   reg2_out = reg_ra;             
            7:   reg2_out = reg_sp;             
            default : reg2_out = 10'd0 ;                       
        endcase                                           
      end            
 
endmodule
