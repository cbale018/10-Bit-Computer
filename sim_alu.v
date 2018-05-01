`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: JF
// Module Name: sim_alu
// Project Name: ECE3570 Lab2
//////////////////////////////////////////////////////////////////////////////////

module sim_alu;

    reg [9:0] datain_a;
    reg [9:0] datain_b;
    reg [1:0] alu_operation;
    wire [9:0] dataout;

    alu uut(datain_a, datain_b, alu_operation, dataout);

    initial begin
        #1  begin
            alu_operation = 2'd0;
            datain_a = 10'h3F0;
            datain_b = 10'h00F;
            end
        #10 begin
            datain_a = 10'h3F0;
            datain_b = 10'h0FF;
            end
        #10 begin 
            datain_a = 10'h3FF;
            datain_b = 10'h3FF;
            end
        #10  alu_operation = 2'd1;
        #10 begin 
            datain_a = 10'h3FF;
            datain_b = 10'h0FF;
            end      
        #10 begin 
            datain_a = 10'h1FF;
            datain_b = 10'h00F;
            end    
        #10 begin 
            datain_a = 10'h000;
            datain_b = 10'h00F;
            end                           
        #10  alu_operation = 2'd2;
        #10 begin
            datain_a = 10'h3FF;
            datain_b = 10'h3FF;
            end        
        #10  alu_operation = 2'd3;
        #10 begin
            datain_a = 10'h3FF;
            datain_b = 10'h0FF;
            end  
        #10 begin
            datain_a = 10'h000;
            datain_b = 10'h200;
            end
   end
   
    

endmodule
