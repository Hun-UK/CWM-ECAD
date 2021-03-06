//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Ben Kaye
// Date: 2020-06-02
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module test();
	parameter CLK_PRD = 10;
	
	reg clk, button, reset, sel;
	wire [2:0] mplx_out;


	initial begin
		clk <= 0;
		button <= 1;
		reset <= 1;
		sel <= 0;
		 #(0.5) reset = 0;
		forever #(CLK_PRD / 2) clk = ~clk;
	end
	
	initial begin
	#25 sel = 1;
		#50 $finish;
	end

	// DO SOME TEST
	
	mplex multiplex(
		.clk(clk),
		.button(button),
		.rst(reset),
		.sel(sel),
		.result(mplx_out)	
	);
	
	
endmodule

