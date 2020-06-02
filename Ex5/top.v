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

module light(clk, rst, red, amber, green);
	input clk, rst;
	output reg red, amber, green;

	//initial {red, amber, green} = 3'b100; IS IT ALLOWED TO INITIALISE??

	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			red <= 1;
			amber <= 0;
			green <= 0;
		end else begin
			//Using karnaugh map of state transition
			red <= (red && !amber && !green) || (!red && amber && !green);
			amber <= !amber;
			green <= (red && amber);
		end			
		
	end
endmodule
