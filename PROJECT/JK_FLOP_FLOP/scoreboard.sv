`include "uvm_macros.svh"
import uvm_pkg::*;

class scoreboard extends uvm_component;

	`uvm_component_utils(scoreboard)

	// defining analysis implementation port
	uvm_analysis_imp #(transaction, scoreboard) receiver;
	
	bit sc_q;

// Constructor 
	function new(string name = "scoreboard", uvm_component parent);
		super.new(name, parent);
		
		sc_q = 0; // initializing
		
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		receiver = new("receiver", this);
		
	endfunction
	
	
	function void write(transaction txn);
		if(txn.rst == 1'b0)
			begin
				sc_q = 1'b0;
				if(txn.q == sc_q) begin
					`uvm_info(get_type_name(), "SCOREBOARD - Reset Check Passed", UVM_LOW);
				end 
				else begin
					`uvm_error(get_type_name(), $sformatf("FAIL on RESET: Expected Q=0, Actual Q=%0b", txn.q));
				end
			end 
		else if(txn.rst == 1'b1) begin
			case({txn.j, txn.k})
				2'b00: sc_q = sc_q;
				2'b01: sc_q = 0;
				2'b10: sc_q = 1;
				2'b11: sc_q = ~sc_q;
			endcase
			
			if(txn.q == sc_q) begin
				`uvm_info(get_type_name(), $sformatf("PASS Q = %0b", txn.q), UVM_LOW);
			end 
			else begin
				`uvm_error(get_type_name(), $sformatf("FAIL Q = %0b", txn.q));
			end
		end
	endfunction
	
endclass
			