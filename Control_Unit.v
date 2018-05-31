`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: AD
// Module Name: comtrol_unit
// Project Name: ECE3570 Lab3b
//////////////////////////////////////////////////////////////////////////////////


module Control_Unit(
    input [9:0] instr, 
    output reg done, 
    output reg [1:0] writeval_op,
    output reg [9:0] imm_val,
    output reg [1:0] fetch_op, 
    output reg [1:0] alu_op, 
    output reg wr_en, 
    output reg [9:0] jmp_addr, 
    output reg [2:0] read_reg1, 
    output reg [2:0] read_reg2, 
    output reg [2:0] wr_reg,
    output reg [1:0] ldst_en,
    output reg jump_control);
        
        initial begin
               done = 0;
        end
        
        always @(instr) begin
        ldst_en = 2'h0;
        wr_en = 0;
        writeval_op = 2'b00;
        done = 0;
        fetch_op = 2'd0;
        alu_op = 2'b00;
        jump_control = 0;
        
        case(instr[9:8])
        
        0: begin
              case (instr[7:6])
                0: begin 
                    wr_reg = 3'd4; 
                    alu_op = 2'd0;
                    wr_en = 1;
                   end
                1: begin 
                    wr_reg = 3'd4; 
                    alu_op = 2'd1;
                    wr_en = 1;
                   end
                2: begin 
                    wr_reg = 3'd4; 
                    alu_op = 2'd2;
                    wr_en = 1;
                   end
                3: begin 
                    wr_reg = 3'd4; 
                    alu_op = 2'd3;
                    wr_en = 1;
                   end
               endcase
           end
        
        1: begin 
              case (instr[7:6])
                0: begin 
                    wr_reg = instr[5:3]; //$rs
                    wr_en = 1;
                    writeval_op = 2'b11;
                   end
                1: begin 
                    wr_reg = 3'd5;   //$t1
                    wr_en = 1;
                    ldst_en = 2'b10;
                   end
                2: begin 
                    ldst_en = 2'b11;
                    alu_op = 0;
                   end
                3: fetch_op = 2'd2;
              endcase
           end
        
        2: begin 
            writeval_op = 2'b10;
            imm_val = {instr[7], instr[7], instr[7:0]};
            wr_reg = 3'd5;
            wr_en = 1;
           end
            
        3: begin
            case (instr[7:6])
                0: begin fetch_op = 3'd1; jump_control = 1; end
                1: fetch_op = 3'd1;
                2: begin 
                    jump_control = 1;
                    fetch_op = 3'd1;
                    wr_reg = 3'd6; //$ra
                    wr_en = 1;
                    writeval_op = 2'b01;
                   end
                3: begin 
                    fetch_op = 2'd3;
                    done = 1;
                   end
            endcase
           end
        
        default : begin 
                    wr_en = 0;
                    alu_op = 2'd0;
                    wr_reg = 3'd5;
                  end
        endcase
        end
        
        always @(instr) begin
        read_reg1 = instr[5:3];
        read_reg2 = instr[2:0];
        jmp_addr = {instr[5], instr[5], instr[5], instr[5], instr[5:0]};
        end
                

        
endmodule
