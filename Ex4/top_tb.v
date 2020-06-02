//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Ben Kaye
// Date: 2020-06-01
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps
module test();
	
	//Params
	parameter CLOCK_PRD = 10;

	//Declare
	reg clk, reset, button, err;
	wire [2:0] throw_out;
	
	//Init and clock
	initial begin 
		clk = 0;
		reset = 0;
		button = 1;
		err = 0;
		forever begin
			if (throw_out == 3'd7)
				err = 1;
			#(CLOCK_PRD / 2) clk = ~clk;
		end
		
	end

	//Test functionality
	initial begin
    
        #30 button = 0;
        #40 reset = 1;
		
		#50 begin
			if (err) $display("##ERROR DETECTED##");
			else $display("##SUCCESS##");
			$finish;
		end
	end	
	
	//Instantiate	
	roll dice(
	.clk(clk),
	.button(button),
	.rst(reset),
	.throw(throw_out)
	);
	
endmodule

