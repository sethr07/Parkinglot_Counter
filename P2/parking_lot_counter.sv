`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Rahul Seth 
//
// Create Date: 16.02.2022 18:57:55
// Design Name: Parking lot counter 
// Module Name: parking lot counter
// Project Name: Practical_2: Comprehensive TB
// Description: Top level module for fsm and counter
//////////////////////////////////////////////////////////////////////////////////

module parking_lot_counter(
    input clk,
    input reset,
    input A,
    input B,
    output [3:0] no_cars
    );
    
    //internal variables
    wire inc, dec;
    
    //instantiating fsm
    fsm I1 (.clk(clk), .reset(reset), .a(A), .b(B), .enter(inc), .exit(dec));
    //instantiating counter
    counter I2 (.clk(clk), .reset(reset), .inc(inc), .dec(dec), .count(no_cars));
    
endmodule
