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
initial
begin 
    clk= 0;
    forever
      # (CLK_PERIOD/2) clk=~clk;
end 

//Todo: User logic
initial
begin
    rst=1;
    change=0;
    on_off=0;

    # (CLK_PERIOD*4) rst=0;

    # (CLK_PERIOD*5) change=1;

    # (CLK_PERIOD*5) on_off=1;

    # (CLK_PERIOD*10) on_off=0;

    # (CLK_PERIOD*20) on_off=1;

    # (CLK_PERIOD*10) rst=1;
end
    
//Todo: Finish test, check for success
initial
begin
    # (CLK_PERIOD*60);		//sim time 600ns
    $finish;
end

//Todo: Instantiate counter module
monitor top(.clk(clk), .rst(rst),.change(change), .on_off(on_off), .counter_out(counter_out));
 
endmodule 
