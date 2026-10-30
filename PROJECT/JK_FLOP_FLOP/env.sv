`include "uvm_macros.svh"
import uvm_pkg::*;

class env extends uvm_env;
	
	`uvm_component_utils(env);
	
	// Declaring the handles for scoreboard, agent, config_jk;
	scoreboard scb;
	agent agt;
	config_jk agent_config;
	
	function new(string name = "env", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		// Instantiating the scoreboard, agent, config_jk;
		scb = scoreboard::type_id::create("scb", this);
		agt = agent::type_id::create("agt", this);
		agent_config = config_jk::type_id::create("agent_config");
		
		// sending the agent configuration through UVM DB;
		uvm_config_db #(config_jk)::set(this, "*", "agent_config", agent_config);
	endfunction
	
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		
		// Connecting Monitor with Scoreboard
		agt.mon.send.connect(scb.receiver);
		
	endfunction
	
endclass