`include "uvm_macros.svh"
import uvm_pkg::*;

class config_jk extends uvm_object;
	`uvm_object_utils(config_jk); // factory registeration
	
	uvm_active_passive_enum is_active = UVM_ACTIVE; // Making agent as active agent;
	
	// Constructor
	function new(string name = "config_jk");
		super.new(name);
	endfunction
	
endclass
	