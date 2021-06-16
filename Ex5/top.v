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
begin
    
  if (state== 2'b00)		// idle state 
      begin
       state = (temperature <= 5'b10010) ? 2'b10: 2'b00;	//turn on heating if T<=18
       state = (temperature >= 5'b10110) ? 2'b01: 2'b00;	// turn on cooling if T>= 22
      end

  else 
  if (state== 2'b01)		// cooling state
      begin
       state = (temperature <= 5'b10100) ? 2'b00: 2'b01;	//turn off cooling if T<= 20
      end

  else
  if (state== 2'b10)		// heating state
      begin
       state = (temperature >= 5'b10100) ? 2'b00: 2'b10;	//turn off heating if T>= 20
      end

  else
     begin   			// forbidden state
      state= 2'b00;
     end
end

assign heating= state[1];
assign cooling= state[0]; 

endmodule
 
