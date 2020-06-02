//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name: Ben Kaye
// Date: 2020-06-02
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mplier(clk, a, b, read, result);

	input clk, read, [2:0]a, [2:0]b;
	output [4:0] result;
	
endmodule

