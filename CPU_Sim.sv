// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : CPU_Sim.sv
// Create : 2020-06-24 21:03:01
// Revise : 2020-06-24 21:03:01
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to generate the cpu isa driver signal
// Note:  
// 
// -----------------------------------------------------------------------------   
class CPU_Sim extends  uvm_driver;
	`uvm_component_utils(CPU_Sim)
	function new(string name = "CPU_Sim", uvm_component parent = null);
		super.new(name,parent);
		`uvm_info("CPU_Sim","new is called",UVM_LOW);
	endfunction 
	extern virtual task main_phase(uvm_phase phase);
endclass

task CPU_Sim::main_phase(uvm_phase,phase);
	Top_TestBench.AddrBus_r 			= 4'b0000;
	Top_TestBench.n_ChipSelect_r 		= 1'b1;
	Top_TestBench.n_rd_r 				= 1'b1;
	Top_TestBench.n_we_r 				= 1'b1;
	Top_TestBench.DataBus_ir 			= 8'h00;
	Top_TestBench.acqurate_stamp_r 		= 4'd0; 
	Top_TestBench.millisecond_stamp_r 	= 12'd0; 
	Top_TestBench.second_stamp_r 		= 32'd0; 
	Top_TestBench.Rx_r 					= 1'b1;	
endtask