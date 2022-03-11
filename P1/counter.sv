/*
Rahul Seth
17302557
*/

// simple counter for fsm
// up and down counter
// has to be made for 15 spaces -> 4 bit counter 


module counter(

    input clk,
    input reset,
    input inc,
    input dec,
    output [3:0] count
    );
    
    reg [3:0] counter;
    
    
    always @ (posedge clk)
    begin
        
        if(reset)
            counter <= 4'b0000;
        else
            if(inc)
                counter <= counter + 4'b0001;
            else if(dec)
                counter <= counter - 4'b0001;
            else 
                counter <= counter;
    end
    
        assign count = counter;

endmodule
