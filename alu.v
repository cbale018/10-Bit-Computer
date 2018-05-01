`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: alu
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module alu(
    input [9:0] datain_a,       //input data a
    input [9:0] datain_b,       //input data b
    input [1:0] alu_operation,  //alu operation selection
    output reg [9:0] dataout    //output data
    );
    
    reg [9:0] data_eq, data_lt;
    reg [10:0] data_a, data_b, data_out;
    reg add_subn,adder_cin;
    wire [10:0] data_adder;
    
    //11bit adder
    adder_11bits addr(
    .a(data_a),
    .b(data_b),
    .cin(adder_cin),
    .sum(data_adder),
    .cout());    
   
   //sign extension
    always @(datain_a) begin
        data_a = {datain_a[9],datain_a};
    end
    
    //alu operation selection
    always @(data_adder,data_eq,data_lt,alu_operation) begin
        case (alu_operation)
            2'b00 : begin                       //add
                    add_subn = 1;
                    dataout = data_adder[9:0];
                    end
            2'b01 : begin                       //subtract
                    add_subn = 0;
                    dataout = data_adder[9:0];
                    end
            2'b10 : begin                       //equal
                    add_subn = 0;
                    dataout = data_eq;
                    end
            2'b11 : begin                       //less than
                    add_subn = 0;
                    dataout = data_lt;
                    end
            default : ;
        endcase        
    end   
    
    //add and subtract selection
    always @(add_subn,datain_b) begin
      if (add_subn == 1) begin              //add
         adder_cin = 0;                     
         data_b = {datain_b[9],datain_b};   
      end                     
      else begin                            //subtract
         adder_cin = 1;       
         data_b = {~datain_b[9],~datain_b};  
      end                     
    end
      
    //equal operation
    always @(data_adder) begin
        if (data_adder == 10'd0) begin    
           data_eq = 10'd1;               
        end                          
        else begin                   
           data_eq = 10'd0;       
        end                          
    end    
    
    //less than operation
    always @(data_adder) begin
        if (data_adder[10] == 1'b1) begin     
           data_lt = 10'd1;               
        end                          
        else begin                   
           data_lt = 10'd0;       
        end                          
    end   
    
endmodule