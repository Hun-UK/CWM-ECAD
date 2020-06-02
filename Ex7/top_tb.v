//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name: Ben Kaye
// Date: 2020-06-02
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module test();

	parameter CLK_PRD = 10;

	reg [2:0] a, [2:0] b, clk, read;

	wire [4:0] result;

	mplier multiply(
		.a(a),
		.b(b),
		.clk(clk),
		.read(read),
		.result(result)
	);


endmodule
