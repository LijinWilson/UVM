`include "uvm_macros.svh"
import uvm_pkg::*;

class monitor extends uvm_monitor;
	
	`uvm_component_utils(monitor);

	uvm_analysis_port #(transaction) send;

	virtual intf inf;
	transaction txn;
	
	// constructor
	function new(string name = "monitor", uvm_component parent);
		super.new(name, parent);
		send = new("send", this);
	endfunction

//	BUILD PHASE
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

	if(!uvm_config_db #(virtual intf)::get(this, "", "inf", inf))
		begin
			`uvm_fatal(get_type_name(), "MONITOR - Unable to get the UVM config db interface");
		end

	endfunction

//	RUN PHASE
	task run_phase(uvm_phase phase);
		super.run_phase(phase);

		forever begin
			@(posedge inf.clk);
			get_from_DUT();
		end
	endtask

	task get_from_DUT();
		txn = transaction::type_id::create("txn");
		txn.j = inf.j;
		txn.k = inf.k;
		txn.rst = inf.rst;
		txn.q = inf.q;
		txn.q_bar = inf.q_bar;
		@(posedge inf.clk);
		send.write(txn);
	endtask

endclass