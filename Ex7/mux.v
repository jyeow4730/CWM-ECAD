///////////////////////////////////////////
//Multiplexer
//////////////////////////////////////////
`timescale 1ns / 100ps

module mux(
    input [23:0] white,
    input [23:0] rgb,
    input sel,
    output [23:0] light
    );
    
    // registers and wires
    wire [23:0] light;
    
   assign light= (sel) ? rgb : white;              
      
endmodule
