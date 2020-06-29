// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : Driver0.sv
// Create : 2020-06-24 21:03:01
// Revise : 2020-06-24 21:03:01
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to generate the cpu isa driver signal
// Note:  
// 
// -----------------------------------------------------------------------------   
class Driver0 extends uvm_driver#(JvnTransaction);
	
	virtual InterfaceDef DvrSigDef;
	`uvm_component_utils(Driver0)
	// `uvm_info("CPU_Sim","new is called",UVM_LOW);
	function new(string name = "Driver0", uvm_component parent = null);
		super.new(name,parent);
		`uvm_info("Driver0","new is called",UVM_LOW);
	endfunction 

	virtual function void buid_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("Driver0","build phase is called",UVM_LOW);
		if (!uvm_config_db#(virtual InterfaceDef)::get(this, "", "SigDef", DvrSigDef)) begin
			`uvm_fatal("Driver0","virtual interface must be set for SigDef!!")
		end
	endfunction

	extern virtual task main_phase(uvm_phase phase);
	extern virtual task BusReadOutput(JvnTransaction tr);
endclass

task Driver0::main_phase(uvm_phase phase);
	JvnTransaction tr;
	phase.raise_objection(this);
	`uvm_info("Driver0","main_phase is called",UVM_LOW);
	// @(posedge DvrSigDef.clk);
	tr.AddrBus = 4'd0;
	tr.n_ChipSelect = 1'b1;
	tr.n_rd = 1'b1;
	tr.n_we = 1'b1;
	tr.DataBusI = 8'd0;
	tr.Rx = 1'b1;
	BusReadOutput(tr);
	phase.drop_objection(this);
endtask

task Driver0::BusReadOutput(JvnTransaction tr);
	// super.bus_read(phase);
	// phase.raise_objection(this);
	`uvm_info("Driver0","The bus read opperation is called",UVM_LOW)
	DvrSigDef.AddrBus 		= tr.AddrBus;
	DvrSigDef.n_ChipSelect 	= tr.n_ChipSelect;
	DvrSigDef.n_rd 			= tr.n_rd;
	DvrSigDef.n_we 			= tr.n_we;
	DvrSigDef.DataBusI 		= tr.DataBusI;
	DvrSigDef.acqurate_stamp= tr.acqurate_stamp;
	DvrSigDef.millisecond_stamp = tr.millisecond_stamp;
	DvrSigDef.second_stamp 	= tr.second_stamp;
	// phase.drop_objection(this);
endtask
