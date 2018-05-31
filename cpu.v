`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2018 04:58:46 AM
// Design Name: 
// Module Name: cpu
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


module cpu(input clk, input [9:0] instruction, input reset, output donebit);
    wire pcval_en, wr_en, ldst_en;
    wire [1:0] fetch_op, alu_op, writeval_op;
    wire [2:0] read_reg1, read_reg2, wr_reg;
    wire [9:0] jmp_addr, ra, t0, pcval, write_data, reg1_out, reg2_out, imm_val;
    wire [9:0] instr_rd_addr;
    
    fetch_unit f0(clk, reset, fetch_op, ra, jmp_addr, t0, instr_rd_addr, pcval);
    Control_Unit C0(instruction, donebit, writeval_op, imm_val, fetch_op, alu_op, wr_en, jmp_addr, read_reg1, read_reg2, wr_reg, ldst_en);
    register_file r0(read_reg1, read_reg2, wr_reg, write_data, wr_en, clk, reset, ldst_en, reg1_out, reg2_out, t0, ra);
    alu a0(reg1_out, reg2_out, alu_op, pcval, imm_val, writeval_op, write_data);  

endmodule
