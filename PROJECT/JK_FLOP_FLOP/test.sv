`include "uvm_macros.svh"
import uvm_pkg::*;

class test extends uvm_test;
	
	`uvm_component_utils(test) // factory registeration
	
	env ev; // handles for env class
	
	// Declaring the handles for different sequence
	valid_jk jk_valid;
	rst_check reset;
	random_check rand_jk;
	
	// Constructor
	function new(string name = "test", uvm_component parent);
		super.new(name, parent);
		
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		// instantiating env class
		ev = env::type_id::create("ev", this);
		
		// instantiating different sequence classes
		jk_valid = valid_jk::type_id::create("jk_valid");
		reset = rst_check::type_id::create("reset");
		rand_jk = random_check::type_id::create("rand_jk");
		
	endfunction
		
	task run_phase(uvm_phase phase);
	
		super.run_phase(phase);
		
		// running all sequence at a time
		phase.raise_objection(this);
		jk_valid.start(ev.agt.seqr); // Sequence - 1
		reset.start(ev.agt.seqr); // Sequence - 2
		rand_jk.start(ev.agt.seqr); // Sequence - 3
		phase.drop_objection(this);
	
	endtask
	
	
endclass
		
		