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
reg clk, rst, change, on_off,err;
reg [7:0] counter_out_prev;
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
    counter_out_prev= 0;
    err=0;

# (CLK_PERIOD)

if (counter_out !=0)
begin 
  $display("Test failed!");
  err=1;
end

rst=0;

# (CLK_PERIOD)
if (counter_out !=0)
begin 
  $display("Test failed!");
  err=1;
end

change=1;

forever
begin

# (CLK_PERIOD)

counter_out_prev= on_off? counter_out_prev + 1: counter_out_prev -1;

if (counter_out_prev!= counter_out)
  begin
  $display("Test failed!");
  err=1;
  end

if (counter_out== 8'hf0)
    on_off = ~on_off;
end

end
    
//Todo: Finish test, check for success
initial
begin
    # (CLK_PERIOD*60);		//sim time 600ns
    if (err==0)
       $display("***TEST PASSED! :) ***");
    $finish;
end

//Todo: Instantiate counter module
monitor top(.clk(clk), .rst(rst),.change(change), .on_off(on_off), .counter_out(counter_out));
 
endmodule 
