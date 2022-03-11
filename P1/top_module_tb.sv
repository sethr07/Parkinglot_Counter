`timescale 1ns / 1ps


module top_tb();
    
    reg clk;
    reg reset;
    reg A;
    reg B;
    wire [3:0] count;
    
    //isnantitate top
    top_module uut (.clk(clk), . reset(reset), .A(A), .B(B), .no_cars(count));
    
     initial
       begin
           clk = 0;
           forever #10 clk = ~clk;
       end
       
       initial
       begin
           {A,B} <= 2'b00;
         
           reset <= 1;
           #30;
           reset <= 0;
           #30;
           
   
           //Test vector 1
           {A,B} <= 2'b00;
           #30;
           {A,B} <= 2'b10;   
           #30;
           {A,B} <= 2'b11;
           #30;
          {A,B} <= 2'b01;
           #30;
           {A,B} <= 2'b00;
           #50;
           
           // no of cars in lot = 1

           
           // Test Vector 2
              {A,B} <= 2'b00;
               #30;
              {A,B} <= 2'b10;   
               #30;
              {A,B} <= 2'b11;
               #30;
              {A,B} <= 2'b01;
               #30;
               {A,B} <= 2'b00;
               #50;
               
                          // no of cars in lot = 2
                 
                       {A,B} <= 2'b00;
                 #30;
                 {A,B} <= 2'b01;   
                 #30;
                 {A,B} <= 2'b11;
                 #30;
                  {A,B} <= 2'b10;
                 #30;
                  {A,B} <= 2'b00;
                 #50;
                 
                            // no of cars in lot = 1
       end   
endmodule
