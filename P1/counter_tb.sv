`timescale 1ns / 1ps

module counter_tb();
    
    reg clk;
    reg inc;
    reg dec;
    wire [3:0] count;
    
    //Insantiate uut
    counter uut (.clk(clk), .inc(inc), .dec(dec), .count(count));
    
    //Clock Signal
    initial
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial
    begin
        //Test vector 1
        dec = 0;
        inc = 1;
        #300;
        
        //test vector 2
        inc = 0;
        dec = 1;
        #100;
        //Test vector 3
        
    end
endmodule 
