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
reg rst, clk, button;
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

    # (CLK_PERIOD*5) rst=0;

end

// finish test
initial
begin
    # (CLK_PERIOD*60);		//sim time 600ns
    $finish;
end

// instantiate lights module

lights top(.clk(clk), .rst(rst), .button(button), .colour(colour));

endmodule 
