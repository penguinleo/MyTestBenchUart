// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : JvnTransaction.sv
// Create : 2020-06-27 16:35:05
// Revise : 2020-06-29 21:12:36
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
class JvnTransaction extends uvm_sequence_item;
	bit [3:0]	AddrBus;
	bit  		n_ChipSelect;
	bit  		n_rd;
	bit  		n_we;
	bit [7:0]	DataBusI;
	// bit [7:0]	DataBusO;
	bit  		p_IrqSig;
	bit [3:0]	acqurate_stamp;
	bit [11:0]	millisecond_stamp;
	bit [31:0]	second_stamp;
	bit  		Rx;
	// bit  		Tx;
	`uvm_object_utils(JvnTransaction)   // this regist operation is object regist!!!!! not component!
	function new (string name = "JvnTransaction");
		super.new(name);
	endfunction

	// extern function void DataGet(JvnTransaction tr);
endclass

	// function void JvnTransaction::DataGet(JvnTransaction tr);
	// 	AddrBus 			= tr.AddrBus;
	// 	n_ChipSelect 		= tr.n_ChipSelect;
	// 	n_rd 				= tr.n_rd;
	// 	n_we 				= tr.n_we;
	// 	DataBusI 			= tr.DataBusI;
	// 	DataBusO 			= tr.DataBusO;
	// 	p_IrqSig 			= tr.p_IrqSig;
	// 	acqurate_stamp 		= tr.acqurate_stamp;
	// 	millisecond_stamp 	= tr.millisecond_stamp;
	// 	second_stamp 		= tr.second_stamp;
	// 	Rx 					= tr.Rx;
	// 	Tx 					= tr.Tx;
	// endfunction : 