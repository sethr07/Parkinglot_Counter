`timescale 1ns / 1ps


module top_module_tb();
    
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
            initialise();
            car_enters();
            car_enters();
            car_exits();
       
       end
       
        
         task initialise ();
          begin
              reset = 1'b1;
              #10;
              reset = 1'b0;
              #10;
          end
         endtask
         
         task delay();
         begin
            #100;
         end
         endtask
       
       
        task car_enters ();
          begin
              @ (posedge clk);
              
                   {A,B} = 2'b00;
                   #10;
                   {A,B} = 2'b10;
                   #10;
                   {A,B} = 2'b11;
                   #10;
                   {A,B} = 2'b01;
                   #10;
                   {A,B} = 2'b00;
                   #10;
                   
                end
        endtask
        
         //task for car entering for stimulus
         //Exit Sequence: 00->01->11->10->00
        task car_exits ();
          begin
              @ (posedge clk);
                  {A,B} = 2'b00;
                  #10;
                  {A,B} = 2'b01;
                  #10;
                  {A,B} = 2'b11;
                  #10;
                  {A,B} = 2'b10;
                  #10;
                  {A,B} = 2'b00;
                  #10;
          end
        endtask
        
endmodule
