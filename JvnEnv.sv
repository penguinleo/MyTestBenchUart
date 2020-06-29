// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : MyEnv.sv
// Create : 2020-06-27 11:31:28
// Revise : 2020-06-27 11:31:28
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to establish the simulation environment
// Note:  
// 
// -----------------------------------------------------------------------------   
class JvnEnv extends uvm_env;
	// CPU_Sim drv;   		// driver  instantiation in the env
	
	// UartMonitor mon; 	// monitor instantiation in the env
	JvnInputAgent agt;
	`uvm_component_utils(JvnEnv)
	function new(string name = "JvnEnv", uvm_component parent);
		super.new(name, parent);
	endfunction

	extern virtual task main_phase(uvm_phase phase); 
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		// drv = CPU_Sim::type_id::create("drv",this); 
		// mon = UartMonitor::type_id::create("mon",this);
		agt = JvnInputAgent::type_id::create("agt",this);
		agt.is_active = UVM_ACTIVE;
	endfunction
	
endclass
	
	task JvnEnv::main_phase (uvm_phase phase);
		JvnSequence seq;
		phase.raise_objection(this);
		seq = JvnSequence::type_id::create("seq");
		seq.start(agt.sqr);
		phase.drop_objection(this);
	endtask
