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
    input [9:0] write_data,     //write 
    input reg_write_en,         //write enable
    input clk,                  //clock
    input reset,                //reset
    input ldst_en,
    output reg [9:0] reg1_out,  //read data1
    output reg [9:0] reg2_out,   //read data2
    output reg [9:0] ra_out,      //return address
    output reg [9:0] t1out      //t1out
    );
    
    wire [9:0] reg_s0, reg_s1,reg_s2, reg_s3, reg_t0, reg_t1, reg_ra, reg_sp;
    wire [7:0] reg_en;
    
    initial begin
        reg1_out = 0;
        reg2_out = 0;
        ra_out  = 0;
        t1out = 0;
    end
    
    //10bit register units
    reg_10bits s0(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_en[0]),
    .q(reg_s0));
    
    reg_10bits s1(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_en[1]),
    .q(reg_s1));    
    
     reg_10bits s2(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_en[2]),
    .q(reg_s2));
    
    reg_10bits s3(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_en[3]),
    .q(reg_s3));    
 
     reg_10bits t0(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_en[4]),
    .q(reg_t0));
    
    reg_10bits t1(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_en[5]),
    .q(reg_t1));    
    
     reg_10bits ra(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_en[6]),
    .q(reg_ra));
    
    reg_10bits sp(
    .d(write_data),
    .clk(clk),
    .rst(reset),
    .wen(reg_en[7]),
    .q(reg_sp));    
    
    always @(reg_ra, reg_t1) begin
        ra_out = reg_ra;
        t1out = reg_t1;
    end   
   
   
   //generate write enable signals 
   Three2EightDecoder D0(write_reg, reg_write_en, reg_en);

    
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
     always @(ldst_en, read_reg2,reg_s0, reg_s1,reg_s2, reg_s3, reg_t0, reg_t1, reg_ra, reg_sp) begin
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
        if (ldst_en == 1)begin
            reg2_out = read_reg2;
        end                                          
      end            
 
endmodule
