`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Rahul Seth 
//
// Create Date: 16.02.2022 18:57:55
// Design Name: Parking lot counter 
// Module Name: counter
// Project Name: Practical_2: Comprehensive TB
// Description: Top level module for fsm and counter
//////////////////////////////////////////////////////////////////////////////////

module stim_gen(
    output reg clk,
    output reg reset,
    output reg sensor_A,
    output reg sensor_B,
    output reg inc_exp,
    output reg dec_exp
    );
    
    integer i;
  
    //clock running forver
    initial
    begin
        clk = 1'b0;
        forever #10 clk = ~ clk;
    end
    
    initial 
    begin
        generate_stim();
    end
    
    //===================================================================//
    //Task definations
   //===================================================================// 
    //task 1: combined all tasks into 1.
    task generate_stim();
    begin
        initialise(); 
        //9 cars enter - to test fsm
        for(i=0; i < 9; i = i+1) begin  
            car_enters();
         end
         //3 exit - to test fsm
         for(i=0; i < 3; i = i + 1) begin
          car_exits();
         end
         car_enters_half_in();
         car_enters();
         car_exits_half_out();
         //reset to 0
         initialise();
         //18 cars enter - to test counter overload as our counter capacity is 15.
         for(i=0; i<18; i = i+1) begin
            car_enters();
         end
    end
    endtask
      
    //lets use some tasks here
    //task 2
    task initialise();
    begin
        inc_exp = 0;
        dec_exp = 0;
        {sensor_A, sensor_B} = 2'b00;
        reset = 1'b0;
        #20;
        reset = 1'b1;
        #20;
        reset = 1'b0;
        #20;
     end
     endtask
     
     //task 3: car eters the lot
     task car_enters();
     begin
     @(negedge clk);
            {sensor_A, sensor_B} = 2'b00;
            #20;
            {sensor_A, sensor_B} = 2'b10;
            #20;
            {sensor_A, sensor_B} = 2'b11;
            #20;
            {sensor_A, sensor_B} = 2'b01;
            #20;
            {sensor_A, sensor_B} = 2'b00;
            @(posedge clk);
                dec_exp = 1'b0;
                inc_exp = 1'b1;
                #20;
                inc_exp = 1'b0;
                dec_exp = 1'b0;
     end
     endtask
     
     //task 4: scar exits the lot
     task car_exits();
     begin
     @(negedge clk);
        {sensor_A, sensor_B} = 2'b00;
        #20;
        {sensor_A, sensor_B} = 2'b01;
        #20;
        {sensor_A, sensor_B} = 2'b11;
        #20;
        {sensor_A, sensor_B} = 2'b10;
        #20;
        {sensor_A, sensor_B} = 2'b00;
        @(posedge clk);
            inc_exp = 1'b0;
            dec_exp = 1'b1;
            #20;
            inc_exp = 1'b0;
            dec_exp = 1'b0;
    end
    endtask
    
    
    //task 5: for car half was in but then backs off (this task is a bug introucted as my fsm does not detect edge cases)
    task car_enters_half_in();
    begin
    @(negedge clk);
        {sensor_A, sensor_B} = 2'b00;
        #20;
        {sensor_A, sensor_B} = 2'b10;
        #20;
        {sensor_A, sensor_B} = 2'b11;
        #20;
        {sensor_A, sensor_B} = 2'b10;
        #20;
        {sensor_A, sensor_B} = 2'b00;
        @(posedge clk);
            inc_exp = 1'b0;
            dec_exp = 1'b0;
            #20;
            inc_exp = 1'b0;
            dec_exp = 1'b0;   
   end
   endtask
   
   //task 6: similarly, another task for car exits halfway
   task car_exits_half_out();
   begin
   @(negedge clk);
        {sensor_A, sensor_B} = 2'b00;
        #20;
        {sensor_A, sensor_B} = 2'b01;
        #20;
        {sensor_A, sensor_B} = 2'b11;
        #20;
        {sensor_A, sensor_B} = 2'b01;
        #20;
        {sensor_A, sensor_B} = 2'b00;
        @(posedge clk);
            inc_exp = 1'b0;
            dec_exp = 1'b0;
            #20;
            inc_exp = 1'b0;
            dec_exp = 1'b0;   
  end
  endtask
endmodule