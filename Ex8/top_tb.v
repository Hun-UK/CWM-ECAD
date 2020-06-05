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
	reg [2:0] a, b, d;
	wire [5:0] result; 

	initial begin
		rst <= 1;
		err <= 0;
		clk <= 0;
		read <= 0;
		err <= 0;
		a <= 3'd3;
		b <= 3'd7;
		d <= 3'd3;
		forever #(CLK_PRD/2) clk = ~clk;
	end

	always  @(posedge clk) begin
	    

		
			
		if (d == 3'd3) begin
			a <= {$random} % 8;
			b <= {$random} % 8;
			err <= (result != a*b) ? 1 : err;
		end

		//err <= (d == 3'd5 && result != a*b) ? 1 : err;

		read <= d[1];

		d[2:1]<=d[1:0];
		d[0] <= d[2];
	end

	
    
	initial begin
		#2 rst <= 0;
		#4 err <= 0; //Yep this is entirely what it looks like. Sue me
		#400 begin 
			if (err) $display("Error encountered.");
			else $display("No error detected.");
			$finish; 
		end
	end
    
	axi_multiplier mplier(
		.a(a),
		.b(b),
		.clk(clk),
		.rst(rst),
		.read(read),
		.result(result)
	);
endmodule
