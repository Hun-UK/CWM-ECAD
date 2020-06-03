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

module mplier( clk, a, b, read, result );

	input clk, read;
	input [2:0] a, b;
	output [5:0] result;
	
	reg [5:0] addr;
	
	// LSR by 3, then add b (equiv of a*8)
	always @(a or b) addr = (a << 3) + b;
	
	
	multiplier_memory(
	.clka(clk),
	.ena(read),
	.addra(addr),
	.douta(result)
	);
	
	
endmodule

