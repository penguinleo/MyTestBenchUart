// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : JvnSquence.sv
// Create : 2020-06-27 17:17:36
// Revise : 2020-06-27 17:17:36
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to .....
// -----------------------------------------------------------------------------   
class JvnSquence extends  uvm_sequence #(JvnTransaction);
	JvnTransaction trans;
	function new (string name = "JvnSquence");
		super.new(JvnSquence);
	endfunction : 

	virtual task body();
		repeat(10) begin 
			`uvm_do(trans)
		end
		#1000;
	endtask

	`uvm_object_utils(JvnSquence)
endclass