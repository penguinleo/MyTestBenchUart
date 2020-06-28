// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Javen   penguinleo@163.com
// File   : InterfaceDef.sv
// Create : 2020-06-26 13:35:50
// Revise : 2020-06-26 13:35:50
// Editor : sublime text3, tab size (4)
// Comment: this module is designed to define the interface signal in the Simulation system
//  		especilly the interface signal between the driver and the DUT
// Note:  
// 
// -----------------------------------------------------------------------------   

interface InterfaceDef (input clk, input rst);
	logic  [3:0]    	AddrBus;
    logic            	n_ChipSelect;
    logic            	n_rd;        
    logic            	n_we;        
    logic  [7:0]    	DataBusI;     
    logic  [7:0]    	DataBusO;     
    logic           	p_IrqSig;  
    logic  [3:0]     	acqurate_stamp;
    logic  [11:0]    	millisecond_stamp;
    logic  [31:0]    	second_stamp;
    logic 				Rx;
    logic 				Tx;
    // JvnTransaction      JvnTr;
    modport CPU_Sim(
        // input   JvnTr,
    	output 	AddrBus,
    	output 	n_ChipSelect,
    	output 	n_rd,
    	output 	n_we,
    	output 	DataBusI,
    	input 	DataBusO,
    	input 	p_IrqSig,
    	output 	acqurate_stamp,
    	output 	millisecond_stamp,
    	output 	second_stamp
    	);
    modport UartMonitor(
        // output  JvnTr,
        input   AddrBus,
        input   n_ChipSelect, 
        input   n_rd, 
        input   n_we, 
        input   DataBusI, 
        input   DataBusO, 
        input   p_IrqSig, 
        input   acqurate_stamp,
        input   millisecond_stamp,
        input   second_stamp,
        input   Rx,
        input   Tx
        );
endinterface