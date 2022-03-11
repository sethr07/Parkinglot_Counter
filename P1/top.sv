`timescale 1ns / 1ps

/*

Rahul Seth 
Practical 1 -> Parking lot occupany counter


*/


module top_module(
    input clk,
    input reset,
    input A,
    input B,
    //output [3:0] no_cars
    output [3:0] an,
    output [6:0] seg
    );
    

    //for simulation purposes
    /*
    fsm I1 (.clk(clk), .reset(reset), .a(A), .b(B), .enter(inc), .exit(dec));
    counter I2 (.clk(clk), .inc(inc), .dec(dec), .count(no_cars));
    */
    
    //for board testing
   
    wire sw_A, sw_B; //push button for input A and B to the fsm
    wire [3:0] car_count; // for counter
    
    //debouncer module for enabling inputs from push buttons 
    debouncer B1 (.clk(clk), .reset(reset), .button(A), .button_db(sw_A));
    debouncer B2 (.clk(clk), .reset(reset), .button(B), .button_db(sw_B));
    
    //FSM 
    fsm I1 (.clk(clk), .reset(reset), .a(sw_A), .b(sw_B), .enter(enter), .exit(exit)); 
    //counter
    counter I2 (.clk(clk), .reset(reset), .inc(enter), .dec(exit), .count(car_count));
    // 7 seg
      
    seven_seg_ctrl I3 (.clk(clk), .reset(reset), .number(car_count[3:0]), .led_out(seg), .anode_activate(an));
         
endmodule





    
