//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name: Ben Kaye
// Date: 2020-06-03
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////

//MIGHT HAVE TO CHANGE THE TIME SCALE
`timescale 1ns / 100ps

module axi_multiplier(clk, rst, a, b, read, result);
	input clk, rst, read;
	input [2:0] a, b;
	output reg [5:0] result;
	
	reg [31:0] addr;
	reg master_ready, addr_stable;
	wire [31:0] full_result;
	wire data_available, slave_ready;

	//addr_stable = assert property(posedge clk) $stable(a));
	
	

	always @(posedge clk or rst) begin
		if (rst) begin
			master_ready <= 0;
			addr_stable <= 0;
			addr <= 0;
			result <= 0;

		//DELAY NEEDED FOR READ TO BE VALID ON CLOCK
		end else #1 if (read) begin

			if (!slave_ready) @ (posedge slave_ready);

			addr_stable <= 0;
			addr <= {24'd0, a, b, 2'd0};
			#1 addr_stable <= 1; //SURELY NOT ROBUST

			@(posedge clk) master_ready <= 1; 
			addr_stable <= 0;

			//if (data_available) result = full_result[5:0]; //STILL RISING ON CLK EDGE
			//result <= full_result[5:0]; ALSO  DOESN'T WORK
			//if (!data_available) @(posedge data_available);

			#1 result <= (data_available) ? full_result[5:0] : result; //SURELY THIS IS NOT ROBUST

			@(posedge clk) master_ready <=  (data_available) ? 0 : master_ready;

		end   
	end


	//Only connect wires we care about for single port ROM. IE ignore B and ignore write.
	dp_multiplier_mem dp_ram (
	  .rsta_busy(),          // output wire rsta_busy
	  .rstb_busy(),          // output wire rstb_busy
	  .s_aclk(clk),                // input wire s_aclk
	  .s_aresetn(~rst),          // input wire s_aresetn
	  .s_axi_awaddr(32'd0),    // input wire [31 : 0] s_axi_awaddr
	  .s_axi_awvalid(1'd0),  // input wire s_axi_awvalid
	  .s_axi_awready(),  // output wire s_axi_awready
	  .s_axi_wdata(32'd0),      // input wire [31 : 0] s_axi_wdata
	  .s_axi_wstrb(4'd0),      // input wire [3 : 0] s_axi_wstrb
	  .s_axi_wvalid(1'd0),    // input wire s_axi_wvalid
	  .s_axi_wready(),    // output wire s_axi_wready
	  .s_axi_bresp(),      // output wire [1 : 0] s_axi_bresp
	  .s_axi_bvalid(),    // output wire s_axi_bvalid
	  .s_axi_bready(1'd0),    // input wire s_axi_bready
	  .s_axi_araddr(addr),    // input wire [31 : 0] s_axi_araddr
	  .s_axi_arvalid(addr_stable),  // input wire s_axi_arvalid
	  .s_axi_arready(slave_ready),  // output wire s_axi_arready
	  .s_axi_rdata(full_result),      // output wire [31 : 0] s_axi_rdata
	  .s_axi_rresp(),      // output wire [1 : 0] s_axi_rresp don't care
	  .s_axi_rvalid(data_available),    // output wire s_axi_rvalid
	  .s_axi_rready(master_ready)    // input wire s_axi_rready
	);
endmodule
