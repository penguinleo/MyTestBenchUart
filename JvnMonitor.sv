// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : JvnMonitor.sv
// Create : 2020-06-27 16:29:55
// Revise : 2020-06-27 16:30:17
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to .....
//          Up module:
//              .....
//          Sub module:
//              .....
// Input Signal List:
//      1   |   clk                     :   clock signal
//      2   |   rst                     :   reset signal, negative enable.
//      3   |   
// Output Signal List:
//      1   |   
// Note:  
// 
// -----------------------------------------------------------------------------   
class JvnMonitor extends uvm_monitor;
	`uvm_component_utils(JvnMonitor)
	virtual InterfaceDef MonSig;
	function new (string name = "JvnMonitor", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("JvnMonitor","new is called",UVM_LOW);		
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("JvnMonitor","build phase is called",UVM_LOW);	
		if (!uvm_config_db#(virtual InterfaceDef)::get(this, "", "SigMon", MonSig)) begin
			`uvm_fatal("JvnMonitor","virtual interface must be set for SigDef!!!")
		end
	endfunction
	extern virtual task main_phase(uvm_phase phase);
	extern virtual task ISA_monitor();

endclass

task JvnMonitor::main_phase(uvm_phase phase);
	`uvm_info("JvnMonitor","Ready and Go~",UVM_LOW);
	while(1) begin
		ISA_monitor();
	end
endtask

task JvnMonitor::ISA_monitor();
	if (MonSig.n_ChipSelect == 1'b0) begin
		/* code */
		if (MonSig.n_rd == 1'b0) begin
			/* code */
			`uvm_info("JvnMonitor","Read Operation Occur",UVM_LOW);
		end
		else if (MonSig.n_we == 1'b0) begin
			`uvm_info("JvnMonitor","Read Operation Occur",UVM_LOW);
		end			
	end

endtask
