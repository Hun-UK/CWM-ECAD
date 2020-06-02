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
	output reg out;

	always @(a or b or sel)
	   #5 out = sel ? b : a;
      
endmodule
