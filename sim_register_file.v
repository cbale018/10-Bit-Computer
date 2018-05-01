`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: sim_register_file
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module sim_register_file;

    reg [2:0] read_reg1;
    reg [2:0] read_reg2;
    reg [2:0] write_reg;
    reg [9:0] write_data;
    reg reg_write_en;
    reg clk;
    reg reset;
    wire [9:0] reg1_out;
    wire [9:0] reg2_out;

    register_file uut(read_reg1,read_reg2,write_reg,write_data,reg_write_en,clk,reset,reg1_out,reg2_out);

   initial begin
        clk = 0;
        reset = 1;
        read_reg1 = 3'd0;
        read_reg2 = 3'd0;
        write_reg = 3'd0;
        write_data = 10'd0;
        reg_write_en = 0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        #10 reset = 0;
        
        #10 begin
            reg_write_en = 1;
            write_reg = 3'd0;
            write_data = 10'd1;
            end
        #10 begin
            reg_write_en = 0;
            write_reg = 3'd1;
            end
        #10 begin
            reg_write_en = 1;
            write_reg = 3'd1;
            write_data = 10'd2;
            end
        #10 begin
            reg_write_en = 0;   
            write_reg = 3'd2;
            end 
        #10 begin
            reg_write_en = 1;
            write_reg = 3'd2;
            write_data = 10'd4;
            end
        #10 begin
            reg_write_en = 0;  
            write_reg = 3'd3;
            end    
        #10 begin
            reg_write_en = 1;
            write_reg = 3'd3;
            write_data = 10'd8;
            end
        #10 begin
            reg_write_en = 0;
            write_reg = 3'd4;
            end 
        #10 begin
            reg_write_en = 1;
            write_reg = 3'd4;
            write_data = 10'd16;
            end
        #10 begin
            reg_write_en = 0; 
            write_reg = 3'd5;
            end     
        #10 begin
            reg_write_en = 1;
            write_reg = 3'd5;
            write_data = 10'd32;
            end
        #10 begin
            reg_write_en = 0;         
            write_reg =  3'd6;
            end
        #10 begin
            reg_write_en = 1;
            write_reg = 3'd6;
            write_data = 10'd64;
            end
        #10 begin
            reg_write_en = 0;  
            write_reg =  3'd7;
            end
        #10 begin
            reg_write_en = 1;
            write_reg = 3'd7;
            write_data = 10'd128;
            end
        #10 reg_write_en = 0;          
        
        #10 read_reg1 = 3'd0;
        #10 read_reg2 = 3'd1;      
        #10 read_reg1 = 3'd2;
        #10 read_reg2 = 3'd3;   
        #10 read_reg1 = 3'd4;
        #10 read_reg2 = 3'd5;      
        #10 read_reg1 = 3'd6;
        #10 read_reg2 = 3'd7;                    
                
   end    

endmodule
