//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Julie Yeow
// Date: 16/06/21
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module airconditioning(
       input clk,
       input [4:0] temperature,
       output heating, cooling
       );

reg [1:0] state;
wire heating, cooling;

always @ (posedge clk)

  state= {heating, cooling};
  
  if (state== 2'b00)		// idle state
      assign heating = (temperature <= 5'b10010) ? 1: 0;
      assign cooling = (temperature >= 5'b10110) ? 1: 0;

  if (state== 2'b01)		// cooling state
      assign heating = 0;
      assign cooling = (temperature <= 5'b10100) ? 1: 0;

  if (state== 2'b10)		// heating state
      assign heating = (temperature >= 5'b10100) ? 1: 0;
      assign cooling=0;

  else   			// forbidden state
     assign heating=0;
     assign cooling=0;

endmodule
 
