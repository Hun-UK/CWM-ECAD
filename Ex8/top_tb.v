//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name: Ben Kaye
// Date: 2020-06-03
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

//MIGHT HAVE TO CHANGE THE TIME SCALE
`timescale 1ns / 100ps

module test();
	//MAY NEED TO MOD
	parameter CLK_PRD = 4;
	
	reg clk, rst, read, err;
	reg [2:0] a, b;
	wire [5:0] rslt; 

	initial begin
		rst <= 1;
		err <= 0;
		clk <= 0;
		read <= 0;
		a <= 3'd3;
		b <= 3'd7;
		forever #(CLK_PRD/2) clk = ~clk;
	end

	initial begin

		#10 @(posedge clk) begin
		    read = 1;
		    #(2*CLK_PRD) read = 0;
		end

		#15 if (result != 5'd21) begin
			err = 1;
			$display("Value retrieved from memory incorrect");
		end


		#30 begin 
			if (err) $display("Error encountered.");
			else $display("No error detected.");
			$finish; 
		end
	end
    
	axi_multiplier mplier(
		.a(a),
		.b(b),
		.clk(clk),
		.rst(1'd1),
		.read(read),
		.result(result)
	);
endmodule
