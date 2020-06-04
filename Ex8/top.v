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
	reg master_ready;
	wire [31:0] full_result;
	wire data_available, slave_ready, addr_stable;

	//addr_stable = assert property(posedge clk) $stable(a));

	always @(posedge read) begin
		addr <= a << 3 + b;
		/*@(posedge addr_stable)*/ #1 begin
			master_ready <= 1; 
			if (data_available && slave_ready) begin
				result <= full_result[5:0];
				master_ready <= 0;
			end
		end
	end


	//Only connect wires we care about for single port ROM. IE ignore B and ignore write.
	dp_multiplier_mem dp_ram (
	  //.rsta_busy(rsta_busy),          // output wire rsta_busy
	  //.rstb_busy(rstb_busy),          // output wire rstb_busy
	  .s_aclk(clk),                // input wire s_aclk
	  .s_aresetn(rst),          // input wire s_aresetn
	  //.s_axi_awaddr(s_axi_awaddr),    // input wire [31 : 0] s_axi_awaddr
	  //.s_axi_awvalid(s_axi_awvalid),  // input wire s_axi_awvalid
	  //.s_axi_awready(s_axi_awready),  // output wire s_axi_awready
	  //.s_axi_wdata(s_axi_wdata),      // input wire [31 : 0] s_axi_wdata
	  //.s_axi_wstrb(s_axi_wstrb),      // input wire [3 : 0] s_axi_wstrb
	  //.s_axi_wvalid(s_axi_wvalid),    // input wire s_axi_wvalid
	  //.s_axi_wready(s_axi_wready),    // output wire s_axi_wready
	  //.s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
	  //.s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
	  //.s_axi_bready(s_axi_bready),    // input wire s_axi_bready
	  .s_axi_araddr(addr),    // input wire [31 : 0] s_axi_araddr
	  .s_axi_arvalid(addr_stable),  // input wire s_axi_arvalid
	  .s_axi_arready(slave_ready),  // output wire s_axi_arready
	  .s_axi_rdata(full_result),      // output wire [31 : 0] s_axi_rdata
	  //.s_axi_rresp(s_axi_rresp),      // output wire [1 : 0] s_axi_rresp don't care
	  .s_axi_rvalid(data_available),    // output wire s_axi_rvalid
	  .s_axi_rready(master_ready)    // input wire s_axi_rready
	);
endmodule
