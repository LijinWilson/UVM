`include "uvm_macros.svh"
import uvm_pkg::*;

class sequencer extends uvm_sequencer #(transaction);

//	transaction txn;

	`uvm_component_utils(sequencer); //factory register

	// constructor
	function new(string name = "sequencer", uvm_component parent);
		super.new(name, parent);
	endfunction

endclass