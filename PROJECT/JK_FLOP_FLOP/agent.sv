`include "uvm_macros.svh"
import uvm_pkg::*;

// Here we want to include Monitor, Driver, Sequencer
// Connect Driver with Sequencer

class agent extends uvm_agent;
	// factory registeration
	`uvm_component_utils(agent)
	
	// creating handles for Monitor, Driver, Sequencer.
	sequencer seqr;
	driver drv;
	monitor mon;
	config_jk agent_config;
	
	// constructor
	function new(string name = "agent", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		// instantiating Monitor
		mon = monitor::type_id::create("mon", this);
		
		// getting the AGENT type through DB
		if(!uvm_config_db #(config_jk)::get(this, "", "agent_config", agent_config))
			begin
				`uvm_fatal(get_type_name(), "AGENT - Unable to receive agent type through DB");
			end
		// instantiating driver and sequencer based on agent is active or not;
		if(agent_config.is_active == UVM_ACTIVE)
			begin
				seqr = sequencer::type_id::create("seqr", this);
				drv = driver::type_id::create("drv", this);
			end
	endfunction
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		
		if(agent_config.is_active == UVM_ACTIVE)
			begin
				drv.seq_item_port.connect(seqr.seq_item_export);
			end
		
	endfunction

endclass