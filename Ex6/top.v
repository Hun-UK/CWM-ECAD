//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: Ben Kaye
// Date: 2020-06-02
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mplex( rst, clk, button, sel, result);
	input rst, clk, button, sel;
	output [2:0] result;

	wire [2:0] tl_out;
	wire [2:0] throw_out;
	
	roll dice(
		.clk(clk),
		.button(button),
		.rst(rst),
		.throw(throw_out)
	);

	light traffic(
		.clk(clk),
		.red(tl_out[2]),
		.amber(tl_out[1]),
		.green(tl_out[0])		
	);


	mux multiplex(
		.a(throw_out),
		.b(tl_out),
		.sel(sel),
		.out(result)		
	);

	
endmodule

