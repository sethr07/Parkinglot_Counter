`timescale 1ns / 1ps


module fsm_tb();
    
    reg clk;
    reg reset;
    reg a;
    reg b;
    wire enter;
    wire exit;
    
    fsm uut (.clk(clk), .reset(reset), .a(a), .b(b), .enter(enter), .exit(exit));
    
    initial
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial
    begin
       
        reset <= 1;
        #30;
        reset <= 0;
        #30;
        //
        
        //Test vector 1 - car enters 
        {a,b} <= 2'b00;
        #30;
        {a,b} <= 2'b10;   
        #30;
        {a,b} <= 2'b11;
        #30;
        {a,b} <= 2'b01;
        #30;
        {a,b} <= 2'b00;
        #50;
        
        //Reset FSM
        reset <= 1;
        #30;
        reset <= 0;
        #30;
        
        // Test Vector 2 - car enters 
       {a,b} <= 2'b00;
        #30;
        {a,b} <= 2'b10;   
        #30;
        {a,b} <= 2'b11;
        #30;
        {a,b} <= 2'b01;
        #30;
        {a,b} <= 2'b00;
        #50;
            
        // Test Vector 3 - car exits
        {a,b} <= 2'b00;
        #30;
        {a,b} <= 2'b01;   
        #30;
        {a,b} <= 2'b11;
        #30;
        {a,b} <= 2'b10;
        #30;
        {a,b} <= 2'b00;
        #50;
      
       
    end
endmodule
