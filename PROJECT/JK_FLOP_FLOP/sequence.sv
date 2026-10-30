import uvm_pkg::*;

// ==================================================================================
// /////////////////////////// SEQUENCE - 1 ///////////////////////////
// sequence for valid J and K values making RESET as 1(design we are using asynchronous low RESET)
// ==================================================================================
class valid_jk extends uvm_sequence #(transaction);

	// factory register
	`uvm_object_utils(valid_jk);

	transaction txn;

	// constructor
	function new(string name = "valid_jk");
		super.new(name);
	endfunction

	task body();
		repeat(5)
			begin
				txn = transaction::type_id::create("txn");
				start_item(txn); // uvm_fatal will terminate the simulation if randomization is not happened
				assert(txn.randomize() with {rst==1;}) else `uvm_fatal(get_type_name(), "Transaction not randomized");
				finish_item(txn);
				
				txn.print(); // it will print all the values mentioned inside `uvm_field_int macros
			end
	endtask
endclass

// ==================================================================================
// /////////////////////////// SEQUENCE - 2 ///////////////////////////
// Checking RESET Case working, flip flop is in reset state forever irrespective of J and K values.
// ==================================================================================
class rst_check extends uvm_sequence #(transaction);
	`uvm_object_utils(rst_check); //factory registering

	transaction txn; // declaring the transaction handle

	function new(string name = "rst_check");
		super.new(name);
	endfunction

	task body();
		repeat(5)
			begin
				txn = transaction::type_id::create("txn");
				start_item(txn);
				assert(txn.randomize() with {rst == 0;}) else `uvm_fatal(get_type_name(), "Transaction Randomization Failed");
				finish_item(txn);
				txn.print();
			end
	endtask
endclass
		
// ==================================================================================
// /////////////////////////// SEQUENCE - 3 ///////////////////////////
// Random Check, random value for reset, J , K
// ==================================================================================
class random_check extends uvm_sequence #(transaction);

	`uvm_object_utils(random_check); // factory registeration

	transaction txn;
	
	function new(string name = "random_check");
		super.new(name);
	endfunction

	task body();
		repeat(5)
			begin
				txn = transaction::type_id::create("txn");
				start_item(txn);
				assert(txn.randomize()) else `uvm_fatal(get_type_name(), "Transaction Randomization failed");
				finish_item(txn);

				txn.print();
			end
	endtask

endclass
	
