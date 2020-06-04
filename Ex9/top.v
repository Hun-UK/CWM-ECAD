//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 
// Student Name: Ben Kaye
// Date: 2020-06-04
//
//  Description: In this exercise, you need to design a module that lights leds
//  at different frequencies
//
//  inputs:
//           rst_n, clk_n, clk_p, button
//
//  outputs:
//           led_0, led_1, led_2
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top(rst_n, clk_n, clk_p, button, led_0, led_1, led_2);
	input rst_n, clk_n, clk_p, button;
	output led_0, led_1, led_2;

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    	IBUFDS IBUFDS_sysclk (
		.I(clk_p),
		.IB(clk_n),
		.O(clk_ibufds)
	);

	wire clk; //use this signal as a clock for your design
        
     	BUFG bufg_clk (
		.I  (clk_ibufds),
		.O  (clk)
      	);
	
	forever @( posedge clk ) begin
		if (button) led_0 = 0;
		else led_0 = 1;
		repeat (2 000 000) begin @( posedge clk ) end
	end

	forever @( posedge clk ) begin
		if (button) led_1 = 0;
		else led_1 = 1;
		repeat (4 000 000) begin @( posedge clk ) end
	end	

	forever @( posedge clk ) begin
		if (button) led_2 = 0;
		else led_2 = 1;
		repeat (6 000 000) begin @( posedge clk ) end
	end

endmodule
