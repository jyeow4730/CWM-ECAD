//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name: Julie Yeow
// Date: 18/06/21
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD=10; // clock period set to 10 sim ticks

// registers and wires
reg clk_p, err, dir;
reg [2:0] state;
//reg temperature_0, temperature_1, temperature_2, temperature_3, temperature_4;
reg [4:0] temperature;
wire heating, cooling; 

wire clk_n;
assign clk_n = ~clk_p;

// clock generation
initial 
begin 
  clk_p=0;
  forever
  # (CLK_PERIOD/2) clk_p= ~clk_p;
end 

//user logic
initial 
begin
  state= 2'b00;			// idle state
  temperature= 5'b10100;	//20 degrees
  err= 0;			//error
  dir= 1;			//counting in the upwards direction

forever
  begin

  # (CLK_PERIOD)

  if ((temperature==25) || (temperature==15))
    begin
    dir= ~dir;
    end

  temperature= (dir) ? temperature+1 : temperature-1;		// incrementing temperature from 20-->25-->15-->25 etc

  if ((heating==1) && (cooling==1))		//test for forbidden state
    begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end

# (CLK_PERIOD)

  if ((dir) && (temperature>=22)&& (cooling!=1))
    begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end

  if ((dir) && (temperature<=19)&& (heating!=1))
    begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end

  if ((dir) && ((temperature==20)|| (temperature==21)) && (cooling==1) && (heating==1))
    begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end

    if ((dir==0) && (temperature>=21)&& (cooling!=1))
    begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end

  if ((dir==0) && (temperature<=18)&& (heating!=1))
    begin
      $display("***TEST FAILED!:( ***");
      err=1;
    end

  if ((dir==0) && ((temperature==19)|| (temperature==20)) && (cooling==1) && (heating==1))
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

// instantiate top module
top top_0(.clk_p(clk_p), .clk_n(clk_n), .temperature_0(temperature_0), .temperature_1(temperature_1),
          .temperature_2(temperature_2), .temperature_3(temperature_3), .temperature_4(temperature_4));
  

endmodule
