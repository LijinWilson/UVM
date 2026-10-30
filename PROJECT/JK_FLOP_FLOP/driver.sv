`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver #(transaction);

	`uvm_component_utils(driver) // factory register

	transaction txn;
	virtual intf inf;
	
	// Constructor
	function new(string name = "driver", uvm_component parent);
		super.new(name, parent);
	endfunction

// BUILD PHASE
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		// Getting Interface through UVM CONFIG DB
		if(!uvm_config_db #(virtual intf)::get(this, "", "inf", inf))
			begin
				`uvm_fatal(get_type_name(), "Unable to GET config DB Interface");
			end
	endfunction

// RUN PHASE
	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_type_name(), "Starting UVM Driver RUN PHASE", UVM_LOW);	
		
		forever
			begin
//				txn = transaction::type_id::create("txn");
				seq_item_port.get_next_item(txn);
				send_to_dut(txn); // sending the transaction inside interface
				seq_item_port.item_done();
			end
	endtask

	task send_to_dut(transaction txn);
		@(posedge inf.DRIVER.clk);
		inf.DRIVER.drv_cb.j <= txn.j;
		inf.DRIVER.drv_cb.k <= txn.k;
		inf.DRIVER.drv_cb.rst <= txn.rst;

		`uvm_info(get_type_name(), $sformatf("Driven values to DUT: J=%0b | K=%0b | RST=%0b", txn.j, txn.k, txn.rst), UVM_LOW);
	endtask

endclass
