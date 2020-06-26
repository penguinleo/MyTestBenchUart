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
	virtual InterfaceDef DvrSigDef;
	// `uvm_info("CPU_Sim","new is called",UVM_LOW);
	function new(string name = "CPU_Sim", uvm_component parent = null);
		super.new(name,parent);
		`uvm_info("CPU_Sim","new is called",UVM_LOW);
	endfunction 

	virtual function void buid_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("CPU_Sim","build phase is called",UVM_LOW);
		if (!uvm_config_db#(virtual InterfaceDef)::get(this, "", "CpuSimInterface", DvrSigDef)) begin
			`uvm_fatal("CPU_Sim","virtual interface must be set for SigDef!!")
		end
	endfunction

	extern virtual task main_phase(uvm_phase phase);
	extern virtual task bus_read(bit [9:0] read_addr);
endclass

task CPU_Sim::main_phase(uvm_phase phase);
	phase.raise_objection(this);
	`uvm_info("CPU_Sim","main_phase is called",UVM_LOW);
	// @(posedge DvrSigDef.clk);
	phase.drop_objection(this);
endtask

task CPU_Sim::bus_read(bit [9:0] read_addr);
	// super.bus_read(phase);
	// phase.raise_objection(this);
	`uvm_info("CPU_Sim","The bus read opperation is called",UVM_LOW)
	DvrSigDef.AddrBus 		= 4'b0000;
	DvrSigDef.n_ChipSelect 	= 1'b1;
	DvrSigDef.n_rd 			= 1'b1;
	DvrSigDef.n_we 			= 1'b1;
	DvrSigDef.DataBusI 		= 8'hzz;
	DvrSigDef.acqurate_stamp= 4'd0;
	DvrSigDef.millisecond_stamp = 12'd0;
	DvrSigDef.second_stamp 	= 32'd0;
	#250
	DvrSigDef.AddrBus 		= read_addr;
	DvrSigDef.n_ChipSelect 	= 1'b1;
	DvrSigDef.n_rd 			= 1'b1;
	DvrSigDef.n_we 			= 1'b1;
	DvrSigDef.DataBusI 		= 8'hzz;
	DvrSigDef.acqurate_stamp= 4'd0;
	DvrSigDef.millisecond_stamp = 12'd0;
	DvrSigDef.second_stamp 	= 32'd0;
	#250
	DvrSigDef.AddrBus 		= read_addr;
	DvrSigDef.n_ChipSelect 	= 1'b0;
	DvrSigDef.n_rd 			= 1'b0;
	DvrSigDef.n_we 			= 1'b1;
	DvrSigDef.DataBusI 		= 8'hzz;
	DvrSigDef.acqurate_stamp= 4'd0;
	DvrSigDef.millisecond_stamp = 12'd0;
	DvrSigDef.second_stamp 	= 32'd0;
	#2500
	DvrSigDef.AddrBus 		= read_addr;
	DvrSigDef.n_ChipSelect 	= 1'b1;
	DvrSigDef.n_rd 			= 1'b1;
	DvrSigDef.n_we 			= 1'b1;
	DvrSigDef.DataBusI 		= 8'hzz;
	DvrSigDef.acqurate_stamp= 4'd0;
	DvrSigDef.millisecond_stamp = 12'd0;
	DvrSigDef.second_stamp 	= 32'd0;
	#250
	DvrSigDef.AddrBus 		= 4'b0000;
	DvrSigDef.n_ChipSelect 	= 1'b1;
	DvrSigDef.n_rd 			= 1'b1;
	DvrSigDef.n_we 			= 1'b1;
	DvrSigDef.DataBusI 		= 8'hzz;
	DvrSigDef.acqurate_stamp= 4'd0;
	DvrSigDef.millisecond_stamp = 12'd0;
	DvrSigDef.second_stamp 	= 32'd0;
	// phase.drop_objection(this);
endtask
