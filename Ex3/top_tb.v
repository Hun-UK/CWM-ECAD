//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Ben Kaye
// Date: 2020-06-01
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

parameter CLK_PERIOD = 5;

//Todo: Regitsers and wires

reg clk;
reg err;
reg rst;
reg dir;
reg enable;
reg [7:0] maxCount;


//Todo: Clock generation

initial begin 
	clk = 1'b0;
	forever begin
		#(CLK_PERIOD / 2) clk = ~clk;
	end
end

//Todo: User logic
initial begin
	err = 0;
	rst = 0;	
	dir = 1;
	enable = 1;

	#30
	maxCount <= counter_out
	dir <= 0; // count down
	
	#40
	if maxCount < counter_out
		err = 1;
	enable = 0;
	#45
	rst = 1;
	
end

initial begin
	#50
	if (!err)
		$display("No errors recorded");
    
	$finish; //finish after 50 ticks
end 


counter count(
	.clk(clk),
	.rst(rst),
	.direction(dir),
	.enable(enable)
	);

 
endmodule 
