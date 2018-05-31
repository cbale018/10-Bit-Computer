`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: AD
// Module Name: cpu10bits
// Project Name: ECE3570 Lab3b
//////////////////////////////////////////////////////////////////////////////////


module CPU10Bits(input clk, input reset, output donebit, output reg [9:0]inst_value);
    wire pcval_en, wr_en, jump_control;
    wire [1:0] fetch_op, alu_op, writeval_op, ldst_en;
    wire [2:0] read_reg1, read_reg2, wr_reg;
    wire [9:0] jmp_addr, ra, t0, pcval, alu_out, reg1_out, reg2_out, imm_val, t1;
    wire [9:0] instr_rd_addr, instr, ram_out;
    
    reg value_out_en;
    
    
    fetch_unit f0(clk, reset, fetch_op, ra, jmp_addr, t0, jump_control, instr_rd_addr, pcval);
    
    Instr_ROM  rom0(instr_rd_addr, instr);
    
    Control_Unit C0(instr, donebit, writeval_op, imm_val, fetch_op, alu_op, wr_en, jmp_addr, read_reg1, read_reg2, wr_reg, ldst_en, jump_control);
    
    register_file r0(read_reg1, read_reg2, wr_reg, ram_out, wr_en, clk, reset, ldst_en[1], reg1_out, reg2_out, t0, ra, t1);
    
    alu a0(reg1_out, reg2_out, alu_op, pcval, imm_val, writeval_op, alu_out);  
    
    RAM ram0(alu_out, t1, ldst_en, clk, ram_out);
   
  always @(wr_en, ram_out) begin
    if (wr_en == 1)
        inst_value = ram_out;
   else
        inst_value = 10'bXXXXXXXXXX;
    end
    
endmodule
