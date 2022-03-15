Building on from practical 1 to build a robust and a comprehensive testbench. This project contains the following compenents:

1. Stimulus Generator: to generate input vectors for the parking lot counter.
2. Parking lot counter: Contains; A. FSM & B. 4 bit counter. 
3. Monitor unit: Monitors input, output and compares the expected values with observed values giving a pass/fail criterion.

The stimulus generator feeds into the parking lot counter. The outputs from the parking lot counter and the outputs on the stim gen goes into the 
monitor module which tells us how our code is working vs how it should be working.
