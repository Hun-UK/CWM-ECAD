//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name: Ben Kaye
// Date: 2020-06-01
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module roll(clk, rst, button, throw)
	input clk, rst, button;
	output reg [2:0] throw;
	
	initial
		throw = 3'd0;
	
	always @ ( posedge clk or rst )
		if (rst) 
			throw = 3'd0;
		else
			if (button || &(~throw) || &throw)
				throw <= throw + 1;
		
	
endmodule



