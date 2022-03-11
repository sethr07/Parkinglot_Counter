`timescale 1ns / 10ps

module scoreboard (
    input clk, //clock signal
    input reset, //reset signal
    input [3:0] count, //car count
    input inc_exp, //increase expected
    input dec_exp, //decrease expected
    output [5:0] desired_count,
    output reg [99:0] err_msg 

);

    integer log_file;

    //monitoring in tcl console
    initial
       begin
       
       $monitor("time = %t, reset = %b, count = %d, inc_exp = %d, dec_exp = %d, desired_count = %d, err = %s", $time, reset, count, inc_exp, dec_exp, desired_count, err_msg);
          
            
         log_file = $fopen("results.txt", "w");
         if(log_file == 0) begin
            $display("Failed to open log file.");
         end
         
         $fdisplay(log_file, "Simulation started.");
         
         $fdisplay(log_file, "time = %t, reset = %b, count = %d, inc_exp = %d, dec_exp = %d, desired_count = %d, err = %s", $time, reset, count, inc_exp, dec_exp, desired_count, err_msg);
                   
         $fdisplay(log_file, "Simulation Done.");
         #1000;
         $fclose(log_file);
       end
       
       
       
    
    //logic for error detection
    //this block runs a seperate counter to cross check with the actual count from stim gen
  reg [5:0] count_exp = 0;
  assign desired_count = count_exp;
        
        always @ (posedge clk)
        begin
            if(reset)
                count_exp <= 0;
                
             else
                if(inc_exp)
                    count_exp <= count_exp + 1;
                else if(dec_exp)
                    count_exp <= count_exp - 1;
                else
                    count_exp <= count_exp;
              
        end
        
        always @ (posedge clk)
        begin
                if(desired_count == count)
                    err_msg = " ";
                else 
                    err_msg = "failed.";
            end      
  
  endmodule
