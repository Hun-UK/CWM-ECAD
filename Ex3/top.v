//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:
// Date: 
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
	output [7:0] counter_out;

  
    //Todo: add registers and wires, if needed

	reg [7:0] counter;
	
	initial begin
	counter = 8'h0;
end


    //Todo: add user logic

	always @( posedge clk ) begin
		if enable begin
			if dir begin
				counter <= counter + 1;
			else
				counter <= counter - 1;
			end
		end
	end

	always @( posedge clk or posedge rst )
		if rst begin
			counter = 8'h0;
		end
	end

	assign counter_out = counter;

      
endmodule
