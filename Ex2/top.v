//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name: Ben Kaye
// Date: 2020-06-01
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    //Todo: define inputs here	
	a, b, sel, out
    );
	input a, b, sel;
	output  out;

    	//reg [1:0] ba;

    //Todo: define registers and wires here
	/*always begin
		 ba <= {b,a};
	end*/	

    //Todo: define your logic here
	/* How I want to do it. however no clock
	assign ba = {b,a};
	assign out = ba[sel];*/

	//NOTE I have a fear of IF statements thanks to debacle in ex1 lol
	always #5 out = sel ? b : a;
      
endmodule
