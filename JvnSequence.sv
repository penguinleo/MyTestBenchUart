// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : JvnSequence.sv
// Create : 2020-06-27 17:17:36
// Revise : 2020-06-27 17:17:36
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to .....
// -----------------------------------------------------------------------------   
class JvnSequence extends uvm_sequence #(JvnTransaction);
	JvnTransaction trans;
	function new (string name = "JvnSequence");
		super.new(name);
	endfunction
	virtual task body();
		repeat(10) begin 
			`uvm_do(trans)
		end
		#1000;
	endtask

	`uvm_object_utils(JvnSequence)
endclass