//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Julie Yeow
// Date: 17/06/21
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD=10; // clock period set to 10 sim ticks

// registers and wires
reg clk, rst, sel, button, err;
wire [23:0] light;

// clock generation
initial
begin 
    clk= 1;
    forever
      # (CLK_PERIOD/2) clk=~clk;
end 

// user logic
initial
begin
  sel=0;
  rst=1;
  button=0;
  err=0;

// check for white light (sel=0)
  # (CLK_PERIOD)
  if (light!= 24'hFFFFFF)
  begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end

# (CLK_PERIOD*2)
  sel=1;	//switch to RGB mode

// test reset (rst=1)
  if (light!= 24'h0000FF)
  begin
      $display("***TEST FAILED!:( ***");
      err=1;
   end



end


// finish test and check for success
initial
begin
    # (CLK_PERIOD*60);		//sim time 600ns
    if (err==0)
       $display("***TEST PASSED! :) ***");
    $finish;
end

// instantiate lights selector module
lights_selector top(.clk(clk), .sel(sel), .rst(rst), .button(button), .light(light));

endmodule
