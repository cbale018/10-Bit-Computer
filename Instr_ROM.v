`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: AD
// Module Name: rom
// Project Name: ECE3570 Lab3b
//////////////////////////////////////////////////////////////////////////////////


module Instr_ROM(
    input [9:0] instr_rd_addr, 
    output reg [9:0] instr,
    output reg [2:0] read_reg1,
    output reg [2:0] read_reg2,
    output reg [9:0] jmp_addr,
    output reg [9:0] imm_val);

reg [9:0] memory[45:0];
reg [10:0] i;

    initial begin
//        memory[0] = 10'b1000000001;  //ldi 1
//        memory[1] = 10'b0100111101;  //mov s3,t1
//        memory[2] = 10'b1000000000;  //ldi 0
//        memory[3] = 10'b0100010101;  //mov s2,t1
//        memory[4] = {2'b10, 8'h000}; //ldi 0
//        memory[5] = 10'b0100000101;  //mov s0,t1
//        memory[6] = {2'b10, 8'h00a}; //ldi 10
//        memory[7] = 10'b0100001101;  //mov s1,t1
//        memory[8] = 10'b0101000000;  //ld  0(s0)
//        memory[9] = 10'b0110001000;  //str 0(s1)
//        memory[10] = 10'b0000000011; //add s0,s3
//        memory[11] = 10'b0100000100; //mov s0,t0
//        memory[12] = 10'b0000001011; //add s1,t1
//        memory[13] = 10'b0100001100; //mov s1,t0
//        memory[14] = 10'b0010101010; //cmp t1,s2
//        memory[15] = 10'b1101000010; //je  2
//        memory[16] = 10'b1100000011; //j   -8
//        memory[17] = 10'b1000001010; //ldi 10
//        memory[18] = 10'b0100000101; //mov s0,t1
//        memory[19] = 10'b1111000000; //halt

          
          
          
      //Moving Memory Program
//        memory[0] = 10'b1000000001; //ldi   1
//        memory[1] = 10'b0100011101; //mov   s3,t1
//        memory[2] = 10'b1000000000; //ldi   0
//        memory[3] = 10'b0100010101; //mov   s2,t1
//        memory[4] = {2'b10, 8'h000};//ldi   Starting Base Address
//        memory[5] = 10'b0100000101;;//mov   s0,t1
//        memory[6] = {2'b10, 8'h00a};//ldi   Target Base Address
//        memory[7] = 10'b0100001101; //mov   s1,t1
//        //begin:
//        memory[8] = 10'b0101000000; //load  0(s0)
//        memory[9] = 10'b0110001000; //str   0(s1)
//        memory[10] = 10'b0000000011;//add   s0,s3
//        memory[11] = 10'b0100000100;//mov   s0,t0
//        memory[12] = 10'b0000001011;//add   s1,s3
//        memory[13] = 10'b0100001100;//mov   s1,t0
//        memory[14] = 10'b0010101010;//cmp   t1,s2
//        memory[15] = 10'b1101000010;//je    end
//        memory[16] = 10'b1100111000;//j     begin
//        //end
//        memory[17] = 10'b1000001010;//ldi   10
//        memory[18] = 10'b0100000101;//mov   s0,t1
//        memory[19] = 10'b1111000000;//halt
        
        //f=x*y-4 Program                                            //LINE
        memory[0] = {2'b10, 8'b11111101};         //ldi x                     0
        memory[1] = 10'b0100000101;        //mov $s0, $t1              1
        memory[2] = {2'b10, 8'b11111011};         //ldi y                     2
        memory[3] = 10'b0100001101;        //mov $s1, $t1              3
        memory[4] = 10'b1000000000;        //ldi 0                     4
    //check if x = 0
        memory[5] = 10'b0010000101;        //cmp $s0, $t1              5
        memory[6] = {4'b1101,6'd26};       //je  end                   6
    //check if y = 0
        memory[7] = 10'b0010001101;        //cmp $s1, $t1              7
        memory[8] = {4'b1101,6'd24};       //je  end                   8
    //check if x > 0 
        memory[9] = 10'b0011101000;        //slt $t1, $s0              9
        memory[10] = {4'b1101,6'd13};       //je  positiveX             10
        memory[11] = 10'b0001101000;        //sub $t1, $s0              11
        memory[12] = 10'b0100000100;        //mov $s0, $t0              12
    //check if y > 0
        memory[13] = 10'b0011101001;        //slt $t1, $s1              13
        memory[14] = {4'b1101, 6'd5};       //je  positiveY1            14
        memory[15] = 10'b0001101001;        //sub $t1, $s1              15
        memory[16] = 10'b0100001100;        //mov $s1, $t0              16
        memory[17] = {4'b1110,6'd19};       //jal mul                   17
        memory[18] = {4'b1100,6'd14};       //j   end                   18
    //positiveY1:
        memory[19] = {4'b1110,6'd17};       //jal mul                   19
        memory[20] = 10'b0001101010;        //sub $t1, $s2              20
        memory[21] = 10'b0100010100;        //mov $s2, $t1              21
        memory[22] = {4'b1100,6'd10};       //j   end                   22
    //positiveX:
        memory[23] = 10'b0011101001;        //slt $t1, $s1              23
        memory[24] = {4'b1101,6'd7};       //je  positiveY2            24

        memory[25] = 10'b0001101001;        //sub $t1, $s1              25
        memory[26] = 10'b0100001100;        //mov $s1, $t0              26
        memory[27] = {4'b1110,6'd9};        //jal mul                   27
        memory[28] = 10'b0001101010;        //sub $t1, $s2              28
        memory[29] = 10'b0100010100;        //mov $s2, $t1              29
        memory[30] = {4'b1100,6'd2};        //j   end                   30       
    //positiveY2:
        memory[31] = {4'b1110,6'd5};        //jal mul                   31
    //end
        memory[32] = 10'b1000000100;        //ldi 4                     32
        memory[33] = 10'b0001010101;        //sub $s2, $t1              33
        memory[34] = 10'b0100010100;        //mov $s2, $t0              34
        memory[35] = 10'b1111000000;        //halt                      35
    //mul
        memory[36] = 10'b1000000000;        //ldi 0                     36
        memory[37] = 10'b0011101000;        //slt $t1, $s0              37
        memory[38] = {4'b1101,6'd2};        //je loop                   38
        memory[39] = 10'b0111000000;        //ret                       39
    //loop
        memory[40] = 10'b0000010001;        //add $s2, $s1              40
        memory[41] = 10'b0100010100;        //mov $s2, $t0              41
        memory[42] = 10'b1000000001;        //ldi 1                     42
        memory[43] = 10'b0001000101;        //sub $s0, $t1              43
        memory[44] = 10'b0100000100;        //mov $s0, $t0              44
        memory[45] = 10'b1100110111;        //j   mul                   45


//        Bubble Sort Program                                           //line
//        memory[0] = {2'b10, 8'd6};          //ldi   n-1                     0
//        memory[1] = 10'b0100000101;         //mov   $s0, $s1                1
//        memory[2] = {2'b10, 8'hfff};        //ldi   3ff                     2
//        memory[3] = 10'b0100111101;         //mov   $sp, $t1                3
//        memory[4] = {2'b10, 8'd46};         //ldi   base address            4
//        memory[5] = 10'b0110111000;         //str   0($sp)                  5
//        //begin 
//        memory[6] = 10'b1000000000;         //ldi   0                       6
//        memory[7] = 10'b0011000101;         //slt   $t1, $s0                7
//        memory[8] = {4'b1101, 6'd27};       //je end                        8
//        memory[9] = 10'b0100001101;         //mov   $s1, $t1                9
//        //inner
//        memory[10] = 10'b0011001000;         //slt   $s1, $s0               10
//        memory[11] = 10'b1101000101;         //je    ifst                   11
//        memory[12] = 10'b1000000001;         //ldi   1                      12
//        memory[13] = 10'b0001000101;         //sub   $s0, $t1               13
//        memory[14] = 10'b0100000100;         //mov   $s0, $t0               14
//        memory[15] = 10'b1100110111;         //j     begin                  15
//        //ifst
//        memory[16] = 10'b0101111000;        //load  0($sp)                  16
//        memory[17] = 10'b0000101001;        //add   $t1, $s1                17
//        memory[18] = 10'b0101100000;        //load  0($t0)                  18
//        memory[19] = 10'b0100010101;        //mov   $s2, $t1                19
//        memory[20] = 10'b0101100001;        //load  1($t0)                  20
//        memory[21] = 10'b0100011101;        //mov   $s3, $t1                21
//        memory[22] = 10'b0011010011;        //slt   $s2, $s3                22
//        memory[23] = 10'b1101000101;        //je    swap                    23
//        //incj
//        memory[24] = 10'b1000000001;        //ldi   1                       24
//        memory[25] = 10'b0000001101;        //add   $s1, $t1                25
//        memory[26] = 10'b0100001100;        //mov   $s1, $t0                26
//        memory[27] = {4'b1100, 6'h2f};      //j inner                       27
//        //swap
//        memory[28] = 10'b0101111000;        //load  0($sp)                  28
//        memory[29] = 10'b0000101001;        //add   $t1, $s1                29
//        memory[30] = 10'b0100101011;        //mov   $t1, $s3                30
//        memory[31] = 10'b0110100000;        //str   0($t0)                  31
//        memory[32] = 10'b0100101010;        //mov   $t1, $s2                32
//        memory[33] = 10'b0110100001;        //str   1($t0)                  33
//        memory[34] = {4'b1100, 6'h36};      //j incj                        34
//        //end
//        memory[35] = 10'b1111000000;        //halt                          35

//    // for simulation    
//    i = 11'd0;
//    while (i<1024) begin
//     memory[i] = i;
//     i = i + 1;
//    end        
    
    end

    always@(instr_rd_addr) begin
        instr = memory[instr_rd_addr];
    end
    
    always@(instr) begin
            read_reg1 = instr[5:3];
            read_reg2 = instr[2:0];
            jmp_addr = {instr[5], instr[5], instr[5], instr[5], instr[5:0]};
            imm_val = {instr[7], instr[7], instr[7:0]};
    end
    
  

endmodule
