//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Julie Yeow
// Date: 15/06/21
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module lights (
    input clk,
    input rst,
    input button,
    output reg [2:0] colour
    );

always @ (posedge clk)

if (rst)
    colour= 3'b001;

else

    if (button)
    case (colour)
	3'b001: colour= 3'b010 ;
	3'b010: colour= 3'b011 ;     
        3'b011: colour= 3'b100 ;
	3'b100: colour= 3'b101 ;
	3'b101: colour= 3'b110 ;
	default: colour= 3'b001 ;
    endcase

    else
    case (colour)
        3'b000: colour= 3'b001;
        3'b111: colour= 3'b001 ;
        default: colour= colour; 
    endcase

endmodule
