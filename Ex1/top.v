//////////////////////////////////////////////////////////////////////////////////
// Exercise #1 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a logical unit, where the  
//  output acts according to the following truth table:
//
//  a | b | out
// -----------------
//  0 | 0 | func[0]
//  0 | 1 | func [1]
//  1 | 0 | func [2]
//  1 | 1 | func [3]
//
//  inputs:
//           a, b, func[3:0]
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module logicalunit(
    input a,
    input b,
    input [3:0] func,
    output out
    );
    
    wire   out;
	
    assign out = !(a && b) ? : func[0] :
			!a && b ? : func[1] :
			a && !b ? : func[2] :
			func[3];
         
      //Todo: add you logic here

endmodule
