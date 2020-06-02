//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Ben Kaye
// Date: 2020-06-02
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps


module test();
	
	parameter CLOCK_PRD = 10;
	
	reg clk, err,rst;

	wire red, amber, green;

	initial begin
		clk <= 0;
		err <= 0;	
		rst <= 1;
		#(0.5) rst = 0;

		forever begin 
			if (!(({red, amber, green} == 3'b100) ||
				({red, amber, green} == 3'b110) ||
				({red, amber, green} == 3'b001) || 
				({red, amber, green} == 3'b010))) 
				err = 1;
		
			#(CLOCK_PRD / 2) clk = ~clk;
		end
	end

	initial begin
		#50 begin
			if (err) 
				$display("##ERROR DETECTED##");
			else 
				$display("##SUCCESS##");
			$finish;
		end
	end


	light traffic(
	.clk(clk),
	.rst(rst),
	.red(red),
	.amber(amber),
	.green(green)
	);

endmodule
