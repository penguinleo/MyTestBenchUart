// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : Top_TestBench.sv
// Create : 2020-06-24 20:52:34
// Revise : 2020-06-24 20:52:34
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to test the uart module 
// Note:  
// 
// -----------------------------------------------------------------------------   `timescale 1ns/1ps
`include "uvm_macros.svh"

import uvm_pkg::*;
`include "CPU_Sim.sv"
module Top_TestBench;
	reg clk;
	reg rst;

	reg   [3:0]    	AddrBus_r,     
    reg            	n_ChipSelect_r,
    reg            	n_rd_r,        
    reg            	n_we_r,        
    reg   [7:0]    	DataBus_ir,     
    wire  [7:0]    	DataBus_ow,     
    wire           	p_IrqSig_w,  
    reg  [3:0]     	acqurate_stamp_r,
    reg  [11:0]    	millisecond_stamp_r,
    reg  [31:0]    	second_stamp_r,
    reg 			Rx_r;
    wire 			Tx_w;

	UartCore UartModule(
		.clk(clk),
		.rst(rst),
		.AddrBus_i(AddrBus_r),
		.n_ChipSelect_i(n_ChipSelect_r),
		.n_rd_i(n_rd_r),
		.n_we_i(n_we_r),
		.DataBus_i(DataBus_ir),
		.DataBus_o(DataBus_ow),
		.p_IrqSig_o(p_IrqSig_w),
		.acqurate_stamp_i(acqurate_stamp_r),
		.millisecond_stamp_i(,millisecond_stamp_r),
		.second_stamp_i(second_stamp_r),
		.Rx_i(Rx_r),
		.Tx_o(Tx_w)
		);

	initial begin : ClockSigGen
		clk = 1'b0;
		forever begin
			#12.5 clk = ~clk;
		end
	end

	initial begin : RstSigGen
		rst = 1'b0;
		#1500;
		rst = 1'b1;
	end



endmodule