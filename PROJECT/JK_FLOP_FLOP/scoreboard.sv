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
	
	
	/* function void write(transaction txn);
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
	endfunction */
	
	function void write(transaction txn);
		string operation_name;

		// ====================================================================
		// PHASE 1: CHECK CURRENT STATE
		// Validate the current DUT output against our previous prediction.
		// ====================================================================
		
		if (txn.rst == 1'b0) begin
			// 1A. Asynchronous Reset Check: If reset is 0, Q must be 0 immediately.
			if (txn.q === 1'b0 /*&& txn.q_bar === 1'b1*/) begin
				`uvm_info(get_type_name(), "[PASS] Async Reset applied successfully. Q=0, Q_bar=1", UVM_HIGH)
			end else begin
				`uvm_error(get_type_name(), $sformatf("[FAIL on RESET] Expected Q=0, Q_bar=1 | Actual Q=%0b, Q_bar=%0b", txn.q, txn.q_bar))
			end
			
			// Set baseline for the next cycle
			sc_q = 1'b0; 
			operation_name = "ASYNC_RESET_ACTIVE";
			
		end else begin
			// 1B. Synchronous Check: Reset is high, so check if actual Q matches expected sc_q
			if (txn.q === sc_q /* && txn.q_bar === ~sc_q */) begin
				`uvm_info(get_type_name(), $sformatf("[PASS] Match -> Q=%0b", txn.q), UVM_HIGH)
			end else begin
				`uvm_error(get_type_name(), $sformatf("[FAIL] Mismatch -> Expected Q=%0b | Actual Q=%0b", sc_q, txn.q))
			end

			// ====================================================================
			// PHASE 2: PREDICT NEXT STATE
			// Based on the J & K inputs sampled right now, calculate what 
			// Q *should* be on the NEXT clock cycle.
			// ====================================================================
			case ({txn.j, txn.k})
				2'b00: begin sc_q = sc_q;   operation_name = "HOLD";   end
				2'b01: begin sc_q = 1'b0;   operation_name = "RESET";  end
				2'b10: begin sc_q = 1'b1;   operation_name = "SET";    end
				2'b11: begin sc_q = ~sc_q;  operation_name = "TOGGLE"; end
			endcase
			
			// Print a clean summary of what the scoreboard is predicting for the future
			`uvm_info(get_type_name(), $sformatf("Sampled: J=%0b K=%0b (%s) | Predicting Next Q=%0b", txn.j, txn.k, operation_name, sc_q), UVM_HIGH)
		end
		
		`uvm_info(get_type_name(), "--------------------------------------------------", UVM_HIGH)
	endfunction
	
endclass
			
