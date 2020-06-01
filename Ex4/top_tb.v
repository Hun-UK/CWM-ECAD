//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Ben Kaye
// Date: 2020-06-01
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps
module test() 
	
	//Params
	parameter CLOCK_PRD = 10;

	//Declare
	reg clk, reset, button;
	wire [2:0] throw_out;
	
	//Init and clock
	initial begin 
		clk = 0;
		reset = 0;
		button = 0;
		forever
			#(CLOCK_PRD / 2) clk = ~clk;
		
	end

	//Test functionality
	initial begin
		
		#50 $finish;
	end	
	
	//Instantiate	
	roll dice(
	.clk(clk),
	.button(button),
	.rst(reset),
	.throw(throw_out)
	);
	
endmodule

