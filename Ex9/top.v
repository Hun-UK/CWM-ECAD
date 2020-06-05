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

        wire clk_ibufds;

    	IBUFDS IBUFDS_sysclk (
		.I(clk_p),
		.IB(clk_n),
		.O(clk_ibufds)
	);

	wire clk;
        
     	BUFG bufg_clk (
		.I  (clk_ibufds),
		.O  (clk)
      	);
	
	

	reg [20:0] count;
	reg [3:0] d0;
	reg [2:0] d1;
	reg d2;
	
	always @( posedge clk or posedge rst_n ) begin
		if (~rst_n) begin
			d0 <= 4'd1;
			d1 <= 3'd1;
			d2 <= 2'd1;
			count <= 0;
		end else begin
			if (&count) begin
				d0 <= d0 << 1;
				d0[0] <= d0[3];	

				d1 <= d1 << 1;
				d1[0] <= d1[2];
				
				d2 <= ~d2;
			end
			count <= count + 1;
		end		
	end

	assign led_0 = ~rst_n && ~button && d0[0];
	assign led_1 = ~rst_n && ~button && d1[0];
	assign led_2 = ~rst_n && ~button && d2; 		  
		
endmodule
