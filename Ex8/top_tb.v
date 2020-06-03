//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name: Ben Kaye
// Date: 2020-06-03
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

//MIGHT HAVE TO CHANGE THE TIME SCALE
`timescale 1ns / 100ps

module test();
	//MAY NEED TO MOD
	parameter CLK_PRD = 4;
	
	reg clk, rst, read, err;
	reg [2:0] a, b;
	wire [5:0] rslt; 

	initial begin
		clk = 0;
		rst = 0;
		read = 0;
		err = 0;
		
		forever #(CLK_PRD/2) clk = ~clk;
	end

	initial begin
		#30 $finish();
	end

	axi_multiplier mplier(
		.clk(clk),
		.rst(rst),
		.read(read),
		.a(a),
		.b(b),
		.result(rslt)		
	);
endmodule
