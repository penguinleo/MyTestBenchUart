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
// 		Top_testbench contain the DUT(module to be verified), the env( instantiation of the drivers)
//  	The TestBench should contain: 
// 									Top_testbench 	:
// 									Env 			: 	Container for the drivers; 
//  								Interface 		: 	Or named virtual interface. The interface between the DUT and the TestBenchs
//  													Avoid spending massive working time on the interface updating when proj migration
//  								Tansaction 		:  	
//									Driver 			: 	The driver signal for the DUT
//									Monitor 		: 	Monitor the important signals in the DUT and the testbench
//									 
// 		1, All drivers should be instantiated in the Env!
// 		2, UVM is a huge set of class, all verification function should be established upon the Class defined in UVM.
//  	3, Factory is a Macro definition denoted  as `uvm_component_utils, we use this macro difinition in instantiation of a "Class" and 
// 			call the funtion and task defined in the Class 
// -----------------------------------------------------------------------------   `timescale 1ns/1ps
`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "SourceCode.h"   // Source code include file
`include "TestBenche.h"   // Test bench code include file
// `include "CPU_Sim.sv"  JvnTransaction
module Top_TestBench;
	reg clk;
	reg rst;
	// The interface definition call, for migration, updating the InterfaceDef.sv 
	InterfaceDef SigDef(UartModule.clk, rst);
	// JvnEnv TestEnviron;
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
	initial begin : StartEnv  
		`uvm_info("JvnEvn","is going to be called",UVM_LOW);
		run_test("JvnEnv");   
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

	initial begin : DataBindDescription
		`uvm_info("Top_TestBench","SigDef is going to be called",UVM_LOW);
		uvm_config_db#(virtual InterfaceDef)::set(null, "uvm_test_top.agt.drv", "SigDef", SigDef);
		uvm_config_db#(virtual InterfaceDef)::set(null, "uvm_test_top.agt.mon", "SigDef", SigDef);
	end


endmodule