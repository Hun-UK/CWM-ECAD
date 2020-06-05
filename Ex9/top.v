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
	
	

	reg [20:0] count;
	reg [2:0] d1,d0;
	reg d2;
	
	always @( posedge clk or rst_n ) begin
		if (rst_n) begin
			d0 <= 3'd1;
			d1 <= 3'd3;
			d2 <= 2'd1;
			count <= 0;
			led_0 <= 0;
			led_1 <= 0;
			led_2 <= 0;
		end else begin
			if (&count) begin
				led_2 <= button && d2;
				led_1 <= button && d1[1];
				led_0 <= button && d0[1];

				d0[2:1] <= d0[1:0];
				d0[0] <= d0[2];	

				d1[2:1] <= d1[1:0];
				d1[0] <= d1[2];
				
				d2 <= ~d2;
			end
			count <= count + 1;
		end		
		
	end

endmodule
