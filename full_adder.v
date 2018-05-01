`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: full_adder
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
    wire w1,w2,w3;
    
    xor x1(w1,a,b);
    xor x2(sum,w1,cin);
    and a1(w2,a,b);
    and a2(w3,w1,cin);
    or o1(cout,w2,w3);
    
endmodule
