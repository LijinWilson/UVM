package jk_pkg;

	`include "uvm_macros.svh"
	import uvm_pkg::*;

	// 1. Base UVM Objects
	`include "transaction_item.sv"
	`include "agent_config.sv"

	// 2. Sequences
	`include "sequence.sv"

	// 3. Lower-level UVM Components
	`include "sequencer.sv"
	`include "driver.sv"
	`include "monitor.sv"
	`include "scoreboard.sv"

	// 4. Higher-level UVM Components
	`include "agent.sv"
	`include "env.sv"

	// 5. UVM Test
	`include "test.sv"

endpackage