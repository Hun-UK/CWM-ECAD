//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters

parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires

reg clk;
reg err;
reg rst;
reg dir;


//Todo: Clock generation

initial begin 
	clk = 1'b0;
	forever begin
		#(CLK_PERIOD / 2) clk = ~clk;
	end
end

//Todo: User logic
    
//Todo: Finish test, check for success

//Todo: Instantiate counter module
 
endmodule 
