`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2018 04:18:10 AM
// Design Name: 
// Module Name: WtoF
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


module FtoD(
        input clk,
        input rst,
        input [9:0] comp_contr,
        input jmp_control,
        input [1:0] ldst,
        input [1:0] fetch_op,
        input [9:0] instr_addr0,
        input [9:0] imm_val0,
        input [9:0] instr0,
        input [9:0] jmp_addr0,
        input [2:0] read_reg10,
        input [2:0] read_reg20,
        input [9:0] pc_val0,
        output reg [9:0] instr_addr,
        output reg [9:0] imm_val,
        output reg [9:0] instr,
        output reg [9:0] jmp_addr,
        output reg [2:0] read_reg1,
        output reg [2:0] read_reg2,
        output reg [9:0] pc_val
    );
    
    always@(posedge clk) begin
    if (rst == 1 || ldst == 2'b10)begin
            imm_val = 0;
            instr = 10'b0100000000;;  
            jmp_addr = 0;
            read_reg1 = 0;
            read_reg2 = 0;
            pc_val = 0;
            instr_addr = 0;
    end
    else begin
        case (fetch_op)
            2'b00: begin
                instr_addr = instr_addr0;
                imm_val = imm_val0;
                instr = instr0;
                jmp_addr = jmp_addr0;
                read_reg1 = read_reg10;
                read_reg2 = read_reg20;
                pc_val = pc_val0;
            end
            2'b01: begin
                if(jmp_control == 1 || comp_contr == 1) begin
                    imm_val = 0;
                    instr = 10'b0100000000;
                    jmp_addr = 0;
                    read_reg1 = 0;
                    read_reg2 = 0;
                    pc_val = 0;
                end
                else begin
                    instr_addr = instr_addr0;
                    imm_val = imm_val0;
                    instr = instr0;
                    jmp_addr = jmp_addr0;
                    read_reg1 = read_reg10;
                    read_reg2 = read_reg20;
                    pc_val = pc_val0;
                end
            end
            2'b10: begin
                imm_val = 0;
                instr = 10'b0100000000;;
                jmp_addr = 0;
                read_reg1 = 0;
                read_reg2 = 0;
                pc_val = 0;           
            end
            2'b11: begin
                imm_val = 0;
                instr = 10'b1111000000;
                jmp_addr = 0;
                read_reg1 = 0;
                read_reg2 = 0;
                pc_val = 0;            
            end
        endcase
    end    
    end
        
    
endmodule
