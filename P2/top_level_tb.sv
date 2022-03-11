`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Rahul Seth 
//
// Create Date: 16.02.2022 18:57:55
// Design Name: Top level testbench
// Module Name: counter
// Project Name: Practical_2: Comprehensive TB
// Description: Top level test bench work stimulus generator, monitor & parking lot counter
//////////////////////////////////////////////////////////////////////////////////

module top_level_tb();

    wire clk, reset, sensor_A, sensor_B;
    wire [3:0] car_count;
    wire inc_exp, dec_exp;
    wire [5:0] exp_count;
    wire [99:0] err_msg;
    
    //===================================================================//
    //Insantiations
   //===================================================================// 
    stim_gen gen_unit (.clk(clk), .reset(reset), .sensor_A(sensor_A), .sensor_B(sensor_B), .inc_exp(inc_exp), .dec_exp(dec_exp));
    parking_lot_counter dut (.clk(clk), .reset(reset), .A(sensor_A), .B(sensor_B), .no_cars(car_count));
    scoreboard mon_unit (.clk(clk), .reset(reset), .inc_exp(inc_exp), .dec_exp(dec_exp), .count(car_count), .desired_count(exp_count), .err_msg(err_msg));
endmodule