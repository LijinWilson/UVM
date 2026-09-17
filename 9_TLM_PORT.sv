// FLow
/*
  ->  Transfering the data from generator(initiator) to driver(target).
  ->  As generator is an initiator, so we need to have an UVM TLM port in generator
*/

`include "uvm_macros.svh";
import uvm_pkg::*;

// transaction class to move data from generator to driver
class transaction extends uvm_object;

  // registering on UVM factory;
  `uvm_object_utils(transaction);

  // property
  rand int data;

  // overriding the constructor;
  function new(string name = "transaction");
    super.new(name);
  endfunction

  // Display function
  function void display(string message);
    $display("%s: the value of data is : %0d", message, data);
  endfunction

endclass

// GENERATOR CLASS
class uvm_generator extends uvm_component;

  // 1. Declaring UVM TLM port as generator component is an initiator(sending data);
  uvm_blocking_put_port#(transaction) put_port;
  
  // registering to factory
  `uvm_component_utils(uvm_generator);

  // overriding constructor
  function new(string name = "uvm_generator", uvm_component parent);
     super.new(name, parent);

     // 2. creating instance of put_port
    put_port = new("put_port", this);
  endfunction

  task run_phase();
    // calling handles of transaction
    transaction txn;

    // creating instance of transaction
    txn = transaction :: type_id :: create("txn");

    // randomizing the data property inside the transaction
    assert(txn.randomize());

    // 3. calling the put method and putting the transaction items
    put_port.put(txn);

  endtask
endclass

class driver extends uvm_driver;

  // registering on UVM factory;
  `uvm_component_utils(driver);
                       
  // 1. creating implementation port
  uvm_blocking_put_imp#(transaction, driver) put_imp;

  // overidding constructor
  function new(string name = "driver", uvm_component parent);
    super.new(name, parent);
    
     // 2. creating instance of put_port
    put_imp = new("put_port", this);
  endfunction

  // 3. overidding put method, which is an builtin method already presented inside the base class
  task put(transaction txn);

    // calling the drive task, which is responsible of driving data.
    // drive(txn);

    // display the transaction
    txn.display("driver put method");
  endtask
endclass

  // Agent Class (it contain the generator and driver class
  class agent extends uvm_agent;

    // registering into factory
    `uvm_component_utils(agent);

    // Calling handles for generator and driver.
    uvm_generator genh;
    driver drvh;

    // overidding constructor
    function new(string name = "agent", uvm_component parent);
      super.new(name, parent);
    endfunction

    // Build Phase (creating instance of generator and driver
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      // creating instance of generator and driver
      genh = uvm_generator :: type_id :: create("genh", this);
      drvh = driver :: type_id :: create("drvh", this);

    endfunction

    // calling connection phase to connect with generator and driver.
    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);

      // 3. connecting generator with driver
      genh.put_port.connect(drvh.put_imp);

    endfunction
  endclass

  // Environment class
  class test extends uvm_test;

    // registering on factory
    `ucm_component_utils(test);

    // creating handle of agent class
    agent agnth;

    // overidding the constructor
    function new(string name = "test", uvm_component parent);
      super.new(name, parent);
    endfunction

    // build phase
    function void buid_phase(uvm_phase phase);
      super.new(phase);

    // creating instance of agent class
      agnth = agent :: type_id :: create("agnth", this);

    endfunction
  endclass

// creating top module
module top();
  initial
    begin
      run_test("test");
    end
endmodule



// OUTPUT
# KERNEL: driver : the value of data is  -278739829
      
  
  
