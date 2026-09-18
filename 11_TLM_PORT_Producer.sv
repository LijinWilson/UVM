// See notes for the architecture

`include "uvm_macros.svh";
import uvm_pkg::*;

class producer extends uvm_component;

  // Creating the handle of the port
  uvm_put_port #(int) tlm_put;

  // property
  int data;

  // registering to factory
  `uvm_component_utils(producer);

  function new(string name = "producer", uvm_component parent);
    super.new(name, parent);

    // creating the instance of port handle
    tlm_put = new("tlm_put", this);
  endfunction

  // creating the run_phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    data = 20;

    // printing the value
    `uvm_info(get_type_name(), $sformatf("the value of data is %0d", data), UVM_LOW);

    // putting the data inside the port
    tlm_put.put(data);

    /*
    - To send transactions to another component
    - As it is a non-blocking method, it returns 1 if the consumer component is ready to accept the transaction otherwise, it returns 0
    - .try_put(trans_item)
    */

    tlm_put.try_put(data);

    /*
      -  It can not send transactions to another component. Hence, no argument is passed when this method is called
      -  As it is a non-blocking method, it returns 1 as it checks the consumer component is ready to accept the transaction otherwise, it returns 0
      -  .can_put()
    */

    tlm_put.can_put();

  endtask
endclass

// Consumer/driver Class
class consumer extends uvm_component;

  // declaring the imp port
  uvm_put_imp #(int, consumer) tlm_imp;

  // registering into factory
  `uvm_component_utils(consumer);

  function new(string name = "consumer", uvm_component parent);
    super.new(name, parent);

    // creating the instance of the imp port
    tlm_imp = new("tlm_imp", this);
  endfunction

  // put is called inside the task, put is an blocking method so it consume some time, so functions cant consume time.
  task put(int val);
    #10;

    `uvm_info(get_type_name(), $sformatf("Recieved the data: %0d", val), UVM_LOW);
  endtask

  // try_put method is an non-blocking method, so inside the function
  function bit try_put(int val);
    `uvm_info(get_type_name(), $sformatf("Recieved the try_put value: %0d", val), UVM_LOW);
    return 1;
  endfunction

  // can_put method is an non_blocking method with no argument
  function bit can_put();
    `uvm_info(get_type_name(), "Inside the can_put(): ", UVM_LOW);
    return 1;
  endfunction

endclass

// Env Class
class env extends uvm_env;

  // registering to the factory
  `uvm_component_utils(env);

  // creating handles of consumer and prodcuer
  producer prh;
  consumer crh;

  function new(string name = "env", uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    prh = producer :: type_id :: create("prh", this);
    crh = consumer :: type_id :: create("crh", this);
  endfunction

  // Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // producer_handle_name.port_name.connect(consumer_handle_name.imp_port)
    prh.tlm_put.connect(crh.tlm_imp);
  endfunction
endclass

// Test Class
class test extends uvm_test;
  // registering on factory
  `uvm_component_utils(test);
  // creating handles for env class
  env envh;
  // constructor
  function new(string name = "test", uvm_component parent);
    super.new(name, parent);
  endfunction
  // Buid Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // creating the instance for env handle
    envh = env :: type_id :: create("env", this);
  endfunction
  // Run Phase, creating some objection 
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    // raising objection and delaying for some time unit
    phase.raise_objection(this);
    #50;
    phase.drop_objection(this);
  endtask
endclass

// creating the top module
module top();
  initial
    begin
      run_test("test");
    end
endmodule

// ================= OUTPUT ==================
KERNEL: ASDB file was created in location /home/runner/dataset.asdb
KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
KERNEL: UVM_INFO /home/runner/testbench.sv(28) @ 0: uvm_test_top.envh.prh [producer] the value of data is 20
KERNEL: UVM_INFO /home/runner/testbench.sv(58) @ 10: uvm_test_top.envh.crh [consumer] recieved the data : 14
KERNEL: UVM_INFO /home/runner/testbench.sv(64) @ 10: uvm_test_top.envh.crh [consumer] recieved try_put value : 20
KERNEL: UVM_INFO /home/runner/testbench.sv(72) @ 10: uvm_test_top.envh.crh [consumer] inside can_put
KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_objection.svh(1271) @ 50: reporter [TEST_DONE] 'run' phase is ready
KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 50: reporter [UVM/REPORT/SERVER]
KERNEL: --- UVM Report Summary ---
KERNEL:
KERNEL: ** Report counts by severity
KERNEL: UVM_INFO :    7
KERNEL: UVM_WARNING : 0
KERNEL: UVM_ERROR :   0
KERNEL: UVM_FATAL :   0
  
  

    

