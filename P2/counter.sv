`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Rahul Seth 
//
// Create Date: 16.02.2022 18:57:55
// Design Name: 4 bit counter
// Module Name: counter
// Project Name: Practical_2: Comprehensive TB
// Description: 4 bit counter that is used in combination with the fsm 
//////////////////////////////////////////////////////////////////////////////////
module counter(

    input clk, //clock signal
    input reset, //reset signal
    input inc, // increment
    input dec, // decrement
    output [3:0] count
    );
    
    reg [3:0] counter; //internal wire
    
    always @ (posedge clk)
    begin
        //if reset assert, set value back to 0    
        if(reset)
            counter <= 4'b0000;
        else
            if(inc) //if inc assert, add 1
                counter <= counter + 4'b0001;
            else if(dec) //if dec asserted, subtract 1
                counter <= counter - 4'b0001; 
            else //error handling
                counter <= counter; 
    end
        assign count = counter; 

endmodule