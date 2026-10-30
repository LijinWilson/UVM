`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_sequence_item;

// Constructor
function new(string name = "transaction");
	super.new(name);
endfunction

	// random input
	rand bit rst;
	rand bit j;
	rand bit k;
	
	//output
	bit q;
	bit q_bar;

// Factory Registeration
	`uvm_object_utils_begin(transaction)
	`uvm_field_int(j, UVM_ALL_ON | UVM_DEC)
	`uvm_field_int(k, UVM_ALL_ON | UVM_DEC)
	`uvm_field_int(rst, UVM_ALL_ON | UVM_DEC)
	`uvm_field_int(q, UVM_ALL_ON | UVM_DEC)
	`uvm_field_int(q_bar, UVM_ALL_ON | UVM_DEC)
	`uvm_object_utils_end

endclass
	