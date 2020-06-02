//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Ben Kaye
// Date: 2020-06-01
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module light(clk, red, amber, green);
	input clk;
	output reg red, amber, green;

	initial {red, amber, green} = 3'b100;

	always @ (posedge clk) begin
		//Using karnaugh map of state transition
		red <= (amber && green) || (!red && amber);
		amber <= (red && !amber);
		green <= (red && amber);			
		
	end
endmodule
