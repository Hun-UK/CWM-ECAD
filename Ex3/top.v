//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name: Ben Kaye
// Date: 2020-06-01
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    //Todo: add ports
	clk, rst, enable, direction, counter_out

    );

	input clk, rst, enable, direction;
	output reg [7:0] counter_out;

  
    //Todo: add registers and wires, if needed
	
	initial begin
	counter_out = 8'h0;
end


    //Todo: add user logic

	always @( posedge clk or posedge rst ) begin
		if (rst)
			counter_out = 8'h0;
		if (enable) begin
			if (direction) 
				counter_out <= counter_out + 1;
			else
				counter_out <= counter_out - 1;
			
		end
		
	end
		      
endmodule
