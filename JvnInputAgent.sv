// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : JvnInputAgent.sv
// Create : 2020-06-27 16:28:50
// Revise : 2020-06-27 16:28:50
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to .....
// -----------------------------------------------------------------------------  
class JvnInputAgent extends uvm_agent;
	Driver0 drv;
	JvnMonitor mon;
	JvnSequencer sqr;
	
	uvm_analysis_port #(JvnTransaction) tr;
	
	function new( string name, uvm_component parent);
		super.new(name,parent);		
	endfunction

	extern virtual function void build_phase(uvm_phase phase);
	extern virtual function void connect_phase(uvm_phase phase);

	`uvm_component_utils(JvnInputAgent)
endclass

function void JvnInputAgent::build_phase (uvm_phase phase);
	super.build_phase(phase);
	if (is_active == UVM_ACTIVE) begin
		sqr = JvnSequencer::type_id::create("sqr",this);
		drv = Driver0::type_id::create("drv",this);
	end
	mon = JvnMonitor::type_id::create("mon",this);
endfunction

function void JvnInputAgent::connect_phase (uvm_phase phase);
	super.connect_phase(phase);
	if (is_active == UVM_ACTIVE) begin
		drv.seq_item_port.connect(sqr.seq_item_export);
	end
	// tr = mon.MonSig.JvnTr;
endfunction
