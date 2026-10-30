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
			@(inf.mon_cb);
			get_from_DUT();
		end
	endtask

	task get_from_DUT();
		txn = transaction::type_id::create("txn");
		txn.j = inf.mon_cb.j;
		txn.k = inf.mon_cb.k;
		txn.rst = inf.mon_cb.rst;
		txn.q = inf.mon_cb.q;
		txn.q_bar = inf.mon_cb.q_bar;
		// @(posedge inf.clk);
		send.write(txn);
	endtask

endclass
