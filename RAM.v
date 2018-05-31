`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: AD
// Module Name: ram
// Project Name: ECE3570 Lab3b
//////////////////////////////////////////////////////////////////////////////////


module RAM(
    input [9:0] alu_out, 
    input [9:0] t1,    
    input [1:0] ldst_en,
    input clk,
    output reg [9:0] ram_out
    );
    
   
    reg [9:0] memory [1023:0];
    reg [10:0] i;
    
    initial begin

// for Bubble Sort simulation    
    memory[45] = 10'h0;
    memory[46] = 10'h14;
    memory[47] = 10'h10;
    memory[48] = 10'h6a;
    memory[49] = 10'h55;
    memory[50] = 10'h55;
    memory[51] = 10'h1a2;
    memory[52] = 10'h63;
    memory[53] = 10'h14d;
    memory[54] = 10'h300;
    memory[55] = 10'hf;
    memory[56] = 10'ha1;
    memory[57] = 10'h8;
    memory[58] = 10'h1;
    
    
    memory[0] = 10'h0af;
    memory[1] = 10'h012;
    memory[2] = 10'h03d;
    memory[3] = 10'h000;
    
// for unit simulation
//    i = 11'd0;
//    while (i<1024) begin
//     memory[i] = 0;
//     i = i+1;
//    end  

    end 
        
    
//    always@ (clk) begin
//    ram_out = alu_out;
    
//        case (ldst_en)
//            3:  memory[alu_out] = t1;
//            2:  ram_out = memory[alu_out];
//        endcase
//    end

//    always@ (ldst_en,t1) begin  
//        if (ldst_en == 3)
//            memory[alu_out] = t1;
//    end 
    
    always@ (negedge clk) begin  
        if (ldst_en == 3)
            memory[alu_out] = t1;
        else
            memory[alu_out] = memory[alu_out];
    end 
    
    always@ (alu_out, ldst_en) begin
    if (ldst_en == 2)
        ram_out = memory[alu_out];
    else
        ram_out = alu_out;
    end
        
    
endmodule
