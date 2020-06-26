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
`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "SourceCode.h"
`include "TestBenche.h"
// `include "CPU_Sim.sv"
module Top_TestBench;
	reg clk;
	reg rst;
	InterfaceDef SigDef(UartModule.clk, rst);
	// reg   [3:0]    	AddrBus_r;
 //    reg            	n_ChipSelect_r;
 //    reg            	n_rd_r;        
 //    reg            	n_we_r;        
 //    reg   [7:0]    	DataBus_ir;     
 //    wire  [7:0]    	DataBus_ow;     
 //    wire           	p_IrqSig_w;  
 //    reg  [3:0]     	acqurate_stamp_r;
 //    reg  [11:0]    	millisecond_stamp_r;
 //    reg  [31:0]    	second_stamp_r;
 //    reg 			Rx_r;
 //    wire 			Tx_w;

	UartCore UartModule(
		.clk					(clk),
		.rst					(rst),
		.AddrBus_i				(SigDef.AddrBus ),
		.n_ChipSelect_i			(SigDef.n_ChipSelect ),
		.n_rd_i					(SigDef.n_rd ),
		.n_we_i					(SigDef.n_we ),
		.DataBus_i				(SigDef.DataBusI ),
		.DataBus_o				(SigDef.DataBusO ),
		.p_IrqSig_o				(SigDef.p_IrqSig ),
		.acqurate_stamp_i		(SigDef.acqurate_stamp ),
		.millisecond_stamp_i	(SigDef.millisecond_stamp ),
		.second_stamp_i			(SigDef.second_stamp ),
		.Rx_i					(SigDef.Rx ),
		.Tx_o					(SigDef.Tx )
		);
	
	initial begin : Driver
		`uvm_info("CPU_Sim","is going to be called",UVM_LOW);
		run_test("CPU_Sim");
	end

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

	initial begin
		uvm_config_db#(virtual InterfaceDef)::set(null, "uvm_test_top", "CpuSimInterface", SigDef);
	end


endmodule