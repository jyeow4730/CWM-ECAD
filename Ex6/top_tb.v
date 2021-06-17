//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name: Julie Yeow
// Date: 17/06/21
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD=10; // clock period set to 10 sim ticks

// registers and wires
reg clk, enable, err;
reg [2:0] colour;
reg [2:0] colour_check;
wire [23:0] rgb;

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
  err=0;
  enable=0;
  colour= 3'b000;
  colour_check= 3'b000;

# (CLK_PERIOD*2) enable=1;

forever
begin
  # (CLK_PERIOD*2)		//memory reading takes 2 clock periods

  colour= (colour== 3'b110)? 3'b001: colour+1;
  # (CLK_PERIOD) colour_check= colour;

# (CLK_PERIOD)
  if (
     ((colour_check==1) && (rgb!=255)) ||
     ((colour_check==2)&&(rgb!=65280)) ||
     ((colour_check==3)&&(rgb!=65535)) ||
     ((colour_check==4)&&(rgb!=16711680)) ||
     ((colour_check==5)&&(rgb!=16711935)) ||
     ((colour_check==6)&&(rgb!=16776960)) 
     )  
  begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end
 
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

// instantiate RGB module
RGB top(.clk(clk), .enable(enable), .colour(colour), .rgb(rgb));

endmodule 

