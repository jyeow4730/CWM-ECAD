//////////////////////////////////////////////////////////////////////////////////
//Dynamic LED lights
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
