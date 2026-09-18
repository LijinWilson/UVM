// See architecure in notes
`include "uvm_macros.svh";
import uvm_pkg::*;

// TRANSACTION CLASS
class transaction extends uvm_object;
  // registering to factory
  `uvm_object_utils(transaction);
  // property
  rand int data;;
  // constructor
  function new(string name = "transaction");
    super.new(name);
  endfunction
endclass

// PRODUCER CLASS
// It contain the analysis port
class producer extends uvm_component;
  // 1. Declaring the analysis port handle
  uvm_analysis_port #(transaction) producer_put;
  // creating the handles of transaction class
  transaction t_h;
  // registering to factory
  `uvm_component_utils(producer);
  //constructor
  function new(string name = "producer", uvm_component parent);
    super.new(name, parent);
    // 2. creating the instance of the handle
    producer_put = new("producer_put", this);
  endfunction
  // creating the run_phase(randomizing the data)
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    // creating the instance of transaction class
    t_h = transaction :: type_id :: create("t_h");
    // randomizing the transaction property data
    assert(t_h.randomize());
    // printing Data
    `uvm_info(get_type_name(), $sformatf("The value of data is: %0d", t_h.data), UVM_LOW);
    // 3. putting data inside the port
    producer_put.write(t_h);
  endtask
endclass

// Three Consumers are their consumer a, consumer b, consumer c
// CONSUMER A
class consumer_a extends uvm_component;
  // creating the implementation port handle for consumer a
  uvm_analysis_imp #(transaction, consumer_a) consumer_imp;
  // creating handle for transaction
  transaction t_h;
  // registerin in factory
  `uvm_component_utils(consumer_a);
  // constructor
  function new(string name = "consumer_a", uvm_component parent);
    super.new(name, parent);
    // instantiating the analysis imp_port handle
    consumer_imp = new("consumer_imp", this);
  endfunction
  // declaring the write method called inside the producer
  function void write(transaction t_h);
    // printing the recieved data
    `uvm_info(get_type_name(), $sformatf("recieved data is : %0d", t_h.data), UVM_LOW);
  endfunction
endclass

// CONSUMER B
class consumer_b extends uvm_component;
  // 1. creating the implementation port handle for consumer a
  uvm_analysis_imp #(transaction, consumer_b) b_imp;
  // creating handle for transaction
  transaction t_h;
  // registerin in factory
  `uvm_component_utils(consumer_b);
  // constructor
  function new(string name = "consumer_b", uvm_component parent);
    super.new(name, parent);
    // 2. instantiating the analysis imp_port handle
    b_imp = new("b_imp", this);
  endfunction
  // declaring the write method called inside the producer
  function void write(transaction t_h);
    // printing the recieved data
    `uvm_info(get_type_name(), $sformatf("recieved data is : %0d", t_h.data), UVM_LOW);
  endfunction
endclass

// CONSUMER C
class consumer_c extends uvm_component;
  // creating the implementation port handle for consumer a
  uvm_analysis_imp #(transaction, consumer_c) c_imp;
  // creating handle for transaction
  transaction t_h;
  // registerin in factory
  `uvm_component_utils(consumer_c);
  // constructor
  function new(string name = "consumer_c", uvm_component parent);
    super.new(name, parent);
    // instantiating the analysis imp_port handle
    c_imp = new("c_imp", this);
  endfunction
  // declaring the write method called inside the producer
  function void write(transaction t_h);
    // printing the recieved data
    `uvm_info(get_type_name(), $sformatf("recieved data is : %0d", t_h.data), UVM_LOW);
  endfunction
endclass

// ENVIRONMENT CLASS
class env extends uvm_env;
  // registering to factory
  `uvm_component_utils(env);
  // Declaring the handles of producer and consumer a, b, c;
  producer p_h;
  consumer_a ca_h;
  consumer_b cb_h;
  consumer_c cc_h;
  // constructor
  function new(string name = "env", uvm_component parent);
    super.new(name, parent);
  endfunction
// creating build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // creating instances for producer and consumer a, b, c;
    p_h = producer :: type_id :: create("p_h", this);
    ca_h = consumer_a :: type_id :: create("ca_h", this);
    cb_h = consumer_b :: type_id :: create("cb_h", this);
    cc_h = consumer_c :: type_id :: create("cc_h", this);
  endfunction
  // CONNECT PHASE
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // connection producer with consumer a;
    p_h.producer_put.connect(ca_h.consumer_imp);
    // connection producer with consumer b;
    p_h.producer_put.connect(cb_h.b_imp);
    // connection producer with consumer c;
    p_h.producer_put.connect(cc_h.c_imp);
  endfunction
endclass

// TEST CLASS
class test extends uvm_test;
  // registering to factory
  `uvm_component_utils(test);
  // creating the handles of the env class
  env envh;
  // Constructor
  function new(string name = "test", uvm_component parent);
    super.new(name, parent);
  endfunction
  // creating Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // creating the instance of the env class
    envh = env :: type_id :: create("envh", this);
  endfunction
endclass

// Creating top module
module top();
  initial
    begin
      run_test("test");
    end
endmodule




// OUTPUT
# KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
# KERNEL: UVM_INFO /home/runner/testbench.sv(45) @ 0: uvm_test_top.envh.p_h [producer] the value of data is 20
# KERNEL: UVM_INFO /home/runner/testbench.sv(72) @ 0: uvm_test_top.envh.ca_h [consumer_a] recived value is 20
# KERNEL: UVM_INFO /home/runner/testbench.sv(93) @ 0: uvm_test_top.envh.cb_h [consumer_b] recived value is 20
# KERNEL: UVM_INFO /home/runner/testbench.sv(114) @ 0: uvm_test_top.envh.cc_h [consumer_c] recived value is 20
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER]
# KERNEL: --- UVM Report Summary ---
# KERNEL:
# KERNEL: ** Report counts by severity
# KERNEL: UVM_INFO :    6
# KERNEL: UVM_WARNING : 0
# KERNEL: UVM_ERROR :   0
# KERNEL: UVM_FATAL :   0
# KERNEL: ** Report counts by id
# KERNEL: [RNTST]       1
# KERNEL: [UVM/RELNOTES]       1
# KERNEL: [consumer_a]       1
# KERNEL: [consumer_b]       1
