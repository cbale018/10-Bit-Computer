`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: AD
// Module Name: cpu10bits
// Project Name: ECE3570 Lab3b
//////////////////////////////////////////////////////////////////////////////////


module CPU10Bits(input clk, input reset, output donebit, output reg [9:0]inst_value);

    //Fetch Cycle Wires
    wire [9:0] jmp_addr1, pcval1, instr1, instr_rd_addr1, imm_val1;
    wire [2:0] read_reg11, read_reg21;

    //Decode Cycle Wires
    wire [9:0] ra2, imm_val2, t12, reg1_out2, reg2_out2, jmp_addr2, instr2, pcval2;
    wire [2:0] read_reg12, read_reg22, wr_reg2;
    wire [1:0] alu_op2, fetch_op2, writeval_op2, ldst_en2;
    wire jump_control2, wr_en2;
    
    //Execute Cycle Wires
    wire [9:0] alu_out3, t13, imm_val3, reg1_out3, pcval3, reg2_out3;
    wire [2:0] wr_reg3;
    wire [1:0] alu_op3, writeval_op3, ldst_en3;
    wire wr_en3;
    
    //Memory Cycle Wires
    wire [9:0] t14, ram_out4, alu_out4;
    wire [2:0] wr_reg4, read_reg13, read_reg23;
    wire [1:0] ldst_en4;
    wire wr_en4;
    
    //Write Back Cycle Wires
    wire [9:0] ram_out5;
    wire [2:0] wr_reg5;
    wire wr_en5;
    
    //forwarding wires
    wire [9:0] branch_instr_addr, fwd_t1;
    wire [9:0] fwd_reg1, fwd_reg2;
   

    
    
    fetch_unit f0(clk, reset, ldst_en2, branch_instr_addr, fetch_op2, ra2, jmp_addr2, alu_out3, jump_control2, instr_rd_addr1, pcval1);
    Instr_ROM  rom0(instr_rd_addr1, instr1, read_reg11, read_reg21, jmp_addr1, imm_val1);
    
    
    
    FtoD f2d(clk, reset, alu_out3, jump_control2, ldst_en2, fetch_op2, instr_rd_addr1, imm_val1, instr1, jmp_addr1, read_reg11, read_reg21, pcval1, branch_instr_addr, imm_val2, instr2, jmp_addr2, read_reg12, read_reg22, pcval2);
    
    
    
    Control_Unit C0(instr2, donebit, writeval_op2, fetch_op2, alu_op2, wr_en2, wr_reg2, ldst_en2, jump_control2);
    register_file r0(read_reg12, read_reg22, wr_reg4, ram_out4, wr_en4, clk, reset, ldst_en2[1], reg1_out2, reg2_out2, ra2, t12);
    
    
    
    DtoE d2e(clk, reset, read_reg12, read_reg22, alu_op2, ldst_en2, wr_en2, wr_reg2, writeval_op2, reg1_out2, reg2_out2, t12, pcval2, imm_val2,
            read_reg13, read_reg23, alu_op3, ldst_en3, wr_en3, wr_reg3, writeval_op3, reg1_out3, reg2_out3,t13, pcval3, imm_val3);
    
    forwarding_unit fwd0(ldst_en3, reg1_out3, reg2_out3, t13, read_reg13, read_reg23, wr_en4, wr_reg4, wr_en5, wr_reg5, alu_out3, ram_out5, fwd_reg1, fwd_reg2, fwd_t1);
    
    alu a0(fwd_reg1, fwd_reg2, alu_op3, pcval3, imm_val3, writeval_op3, alu_out3);  
    
    
    
    EtoM e2m(clk, reset, ldst_en3, wr_en3, alu_out3, wr_reg3, fwd_t1,
            ldst_en4, wr_en4, alu_out4, wr_reg4, t14);
            
    
    
    RAM ram0(alu_out4, t14, ldst_en4, clk, ram_out4);
   
   
   
    MtoW m2w(clk, reset, ram_out4, wr_en4, wr_reg4,
        ram_out5, wr_en5, wr_reg5);
        
   
  always @(wr_en4, ram_out4) begin
    if (wr_en4 == 1)
        inst_value = ram_out4;
   else
        inst_value = 10'bXXXXXXXXXX;
    end
    
endmodule
