//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Julie Yeow
// Date: 15/06/21
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD=10; // clock period set to 10 sim ticks

// registers and wires
reg rst, clk, button, err;
reg [2:0] colour_prev;
wire [2:0] colour;

// clock generation
initial
begin 
    clk= 0;
    forever
      # (CLK_PERIOD/2) clk=~clk;
end 

// user logic
initial
begin
    rst=1;
    button=1;
    colour_prev=3'b001;
    err=0;

 # (CLK_PERIOD)
if (colour!=3'b001)	// test reset
    begin
      $display("***TEST FAILED! :( ***");
      err=1;
    end

# (CLK_PERIOD)
rst=0;		// test button (hold colour)
button=0;

if (colour!= colour_prev)
    begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end

# (CLK_PERIOD) button=1;
	
forever		//test button
  begin
  # (CLK_PERIOD)
  colour_prev= (colour_prev==3'b110)? 3'b001: colour_prev + 1;

  if ((colour== 3'b000)||(colour==3'b111))		//test for unused states
    begin
    $display("***TEST FAILED! Unused state:( ***");
    err=1;
    end

  if (colour!= colour_prev)
    begin
    $display("***TEST FAILED!:( ***");
    err=1;
    end

end

end

// finish test
initial
begin
    # (CLK_PERIOD*60);		//sim time 600ns
    if (err==0)
       $display("***TEST PASSED! :) ***");
    $finish;
end

// instantiate lights module

lights top(.clk(clk), .rst(rst), .button(button), .colour(colour));

endmodule 
