// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : JvnSequencer.sv
// Create : 2020-06-28 22:32:31
// Revise : 2020-06-28 22:32:31
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to establish the sequencer of the Uvm
// -----------------------------------------------------------------------------   
class JvnSequencer extends  uvm_sequencer#(JvnTransaction);
	`uvm_component_utils(JvnSequencer)
	function new (string name, uvm_component parent);
		super.new(name,parent);		
	endfunction

	
endclass : JvnSequencer