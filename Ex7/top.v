//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Julie Yeow
// Date: 17/06/21
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module lights_selector(
      input clk, sel, rst, button,
      output [23:0] light
      );

//registers and wires
wire [2:0] colour;
wire enable;
wire [23:0] rgb;
wire [23:0] white;

assign enable= ~rst;
assign white= 24'hFFFFFF;

// instantiate modules
lights LED_lights(.clk(clk), .rst(rst), .button(button), .colour(colour));

RGB rgb_converter(.clk(clk), .enable(enable), .colour(colour), .rgb(rgb));

mux multiplexer(.white(white), .rgb(rgb), .sel(sel), .light(light));

endmodule



