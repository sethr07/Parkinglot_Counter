/*

FSM - Parking lot
Since, we have 4 states:
    Unlocked: 00
    Sensor A: 10
    Sesnor B: 01
    Blocked: 11
    
    4 staes -> 2 bit number 
    
   
*/

module fsm (
    
    input clk,
    input reset,
    input a,
    input b,
    output enter,
    output exit
 );
 

 
 localparam [1:0] s0 = 2'b00, //both sensors unblocked, idle state
                  s1 = 2'b01, //sensor B blocked
                  s2 = 2'b10, // sensor A blocked
                  s3 = 2'b11; // both A and B blocked
 

 
 //internal varibales
 reg en, ex;
 reg [1:0] current_state, next_state;
 
 // assiging output values
 assign enter = en;
 assign exit = ex;

 
 always @ (posedge clk, posedge reset)
 begin
    
    if(reset)
        current_state <= s0;
    else 
        current_state <= next_state;
 end
 
//next state logic
 always @ (current_state, a, b)
 begin   
    en = 1'b0;
    ex = 1'b0;
   
    case(current_state)
   
        //unblocked case
        s0:
        begin
            if(~a & b) // 01
                next_state = s1;   
            else if(a & ~b) // 10 
                next_state = s2;
            else
                next_state = s0; //default            
        end
        
         //sensor b 
         s1:
         begin
            if(~a & b) //01
                next_state = s1;
            else if (a & b) //11
                next_state = s3;
            else if (~a & ~b) //00
            begin
                next_state = s0;
                en = 1;
                ex = 0;
            end
            else 
                next_state = s0;
         end
         
         // sensor a
         s2:
         begin
         
            if(a & ~b) //10        
                next_state = s2;
            else if(a & b) // 11
                next_state = s3;
            else if (~a & ~b) //00
            begin
                next_state = s0;
                ex = 1;
                en = 0;
            end 
            else
                next_state = s0;
         end
         
         //blocked
         s3:
         begin
            if(~a & b) //01  
                next_state = s1;
            else if(a & ~b) //10
                next_state = s2; 
            else if (a & b) //11
                next_state = s3;
            else
                next_state = s0; 
         end    
    endcase
    end
endmodule 

/////// end of module //////
