`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: adder_10bits
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////


module adder_10bits(
    input [9:0] a,b, 
    input cin,
    output [9:0] sum,
    output cout
    );
    wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
    
    full_adder f1(a[0],b[0],cin,sum[0],w1);      
    full_adder f2(a[1],b[1],w1,sum[1],w2);        
    full_adder f3(a[2],b[2],w2,sum[2],w3);  
    full_adder f4(a[3],b[3],w3,sum[3],w4);      
    full_adder f5(a[4],b[4],w4,sum[4],w5);            
    full_adder f6(a[5],b[5],w5,sum[5],w6);      
    full_adder f7(a[6],b[6],w6,sum[6],w7);      
    full_adder f8(a[7],b[7],w7,sum[7],w8);         
    full_adder f9(a[8],b[8],w8,sum[8],w9);                          
    full_adder f10(a[9],b[9],w9,sum[9],cout) ;     
    
endmodule
