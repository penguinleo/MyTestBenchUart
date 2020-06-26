// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : UartMonitor.sv
// Create : 2020-06-26 15:24:16
// Revise : 2020-06-26 15:24:16
// Editor : sublime text3, tab size (4)
// Comment: This is the Monitor module for the simulation  
// Note:  
// 
// -----------------------------------------------------------------------------   
class UartMonitor extends uvm_monitor;
	`uvm_component_utils(UartMonitor)
	virtual InterfaceDef SigDef;	
	function new (string name = "UartMonitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction : 
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual InterfaceDef)::get(this, "", "SigDef", SigDef);) begin
			`uvm_fatal("UartMonitor","virtual interface must be set for SigDef!!!")
		end
	endfunction
	extern virtual task main_phase(uvm_phase phase);
	extern virtual task ISA_monitor();
endclass

task UartMonitor::ISA_monitor();
	
endtask
