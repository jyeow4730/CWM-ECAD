//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Julie Yeow
// Date: 16/06/21
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD=10; // clock period set to 10 sim ticks

//regsiters and wires
reg clk, err, dir;
reg [1:0] state;
reg [4:0] temperature;
wire heating, cooling;

//clock generation
initial
begin 
    clk= 1;
    forever
      # (CLK_PERIOD/2) clk=~clk;
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

  if ((temperature==22)&& (cooling!=1))
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

//instantiate airconditioning module
airconditioning top(.clk(clk), .temperature(temperature), .heating(heating), .cooling(cooling));

endmodule 

