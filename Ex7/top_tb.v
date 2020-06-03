//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name: Ben Kaye
// Date: 2020-06-02
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module test();

	parameter CLK_PRD = 10;
	
	reg [2:0] a, b;
	reg clk, read, err;

	wire [4:0] result;

	initial begin
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
    
	mplier multiply(
		.a(a),
		.b(b),
		.clk(clk),
		.read(read),
		.result(result)
	);


endmodule
