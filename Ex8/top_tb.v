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
	wire [5:0] result; 

	initial begin
		rst <= 0;
		err <= 0;
		clk <= 0;
		read <= 0;
		a <= 3'd3;
		b <= 3'd7;
		forever #(CLK_PRD/2) clk = ~clk;
	end

    initial begin
        @(posedge clk) rst <= 1;
        @(posedge clk) rst <= 0;
        forever #10 begin
            a <= {$random} % 8;
            b <= {$random} % 8;
            @(posedge clk) read <= 1;
            @(posedge clk) read <= 0;
            @(posedge clk) if (result != (a*b)) begin
                err = 1;
                $display("Value retrieved from memory incorrect");
			end
                
        end
    end
    
	initial begin
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
