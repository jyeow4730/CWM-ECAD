//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Julie Yeow
// Date: 14/06/21
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD= 10;	// clock period set to 10 sim ticks

//Todo: Registers and wires
reg clk, rst, change, on_off;
wire [7:0] counter_out;

//Todo: Clock generation

//Todo: User logic
    
//Todo: Finish test, check for success

//Todo: Instantiate counter module
mymodule top(.clk(clk), .rst(rst),.change(change), .on_off(on_off), .counter_out(counter_out));
 
endmodule 
