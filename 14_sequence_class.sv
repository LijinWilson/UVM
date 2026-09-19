// Theory are explained inside notes 


import uvm_pkg ::*;
`include "uvm_macros.svh";

// CLASS SEQUENCE[OBJECT]
// which contain all data that need to be transfered to DUT
// it is an parametrized class
class seq_item extends uvm_sequence_item;

  rand int data;
// registering to factory
  `uvm_object_utils(seq_item)

  function new(string name = "seq_item");
    super.new(name);
  endfunction

endclass

// CLASS SEQUENCER[COMPONENT]
// It is parametrized class using data type as SEQUENCE_ITEM
class sequencer extends uvm_sequencer#(seq_item);

  // Registering to factory
  `uvm_component_utils(sequencer)

  function new(string name = "sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction

endclass

// CLASS DRIVER
// it is also an parametrized class, parameter as SEQUENCE_ITEM
class driver extends uvm_driver#(seq_item);

  `uvm_component_utils(driver)

  function new(string name = "driver",uvm_component parent);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);

    forever begin
// "seq_item_port" it is an TLM port, which instance is already declared by default
      // get_next_item is an method inside the TLM port for getting the next sequence item from sequencer. it block driver execution until next sequence item is availble
      seq_item_port.get_next_item(req);

      #50;

      seq_item_port.item_done();

      `uvm_info(get_type_name(),"after item_done called",UVM_LOW);
      end
  endtask
endclass

// CLASS SEQUENCE
// It is also expecting the parameter, and that is SEQ_ITEM
class sequence_ex extends uvm_sequence#(seq_item);

  `uvm_object_utils(sequence_ex)
// Calling the handle of sequence item
  seq_item req;

  function new(string name = "sequence_ex");

    super.new(name);

  endfunction
  // this task body will be called automatically, when we call the start function inside the TEST class.
  // this BODY() is performing some action like creating instance of sequence_item, randomization of data inside the sequence items, sending data to driver.
  task body();
    `uvm_info(get_type_name(),"base seq inside body method",UVM_LOW)
    req = seq_item :: type_id :: create("req"); // creating instance for the sequence item handle
    wait_for_grant(); // ask permission from the sequencer
    asssert(req.randomize()); // randomize the data inside the sequence item
    send_request(req); // sending data for sequencer
    `uvm_info(get_type_name(),"BEFORE WAIT_ITEM_DONE", UVM_LOW);
    wait_for_item_done(); // this will unblock when the driver call item_done
  endtask
endclass

// AGENT CLASS
class agent extends uvm_agent;

  `uvm_component_utils(agent);
  
  // Calling the handles for sequencer and driver 
  sequencer seqrh;

  driver drvh;

  function new(string name = "agent",uvm_component parent);

    super.new(name,parent);

  endfunction


  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    seqrh = sequencer :: type_id :: create("seqrh",this);

    drvh = driver :: type_id :: create("drvh",this);

  endfunction
endclass

  // ENVIRONMENT CLASS
class env extends uvm_env;

  `uvm_component_utils(env)

  agent agnth;

  function new(string name = "env",uvm_component parent);

    super.new(name,parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    agnth = agent :: type_id :: create("agnth",this);

  endfunction


  function void connect_phase(uvm_phase phase);
  
      super.connect_phase(phase);
  // driver will have port handle and sequencer will have export handle.
      drvh.seq_item_port.connect(seqrh.seq_item_export);
  
    endfunction
  
endclass

// TEST CLASS
class test extends uvm_test;

  `uvm_component_utils(test)

  env envh;

  sequence_ex seqh;

  function new(string name = "test",uvm_component parent);

    super.new(name,parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    envh = env :: type_id :: create("envh",this);

    seqh = sequence_ex :: type_id :: create("seqh");

  endfunction

  task run_phase(uvm_phase phase);

    super.run_phase(phase);

    phase.raise_objection(this);
    // START FUNCTION => sequence.start(sequencer_location)
    seqh.start(envh.agnth.seqrh);

    phase.drop_objection(this);

  endtask
endclass

// TOP MODULE CODE
module tb;

  initial
    begin
      run_test("test");

    end
endmodule

// OUTPUT
KERNEL: ASDB file was created in location /home/runner/dataset.asdb
KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
KERNEL: UVM_INFO /home/runner/testbench.sv(73) @ 0: uvm_test_top.envh.agnth.seqrh@@seqh [sequence_ex] base seq inside body met
KERNEL: UVM_INFO /home/runner/testbench.sv(83) @ 0: uvm_test_top.envh.agnth.seqrh@@seqh [sequence_ex] BEFORE WAIT_ITEM_DONE
KERNEL: UVM_INFO /home/runner/testbench.sv(51) @ 50: uvm_test_top.envh.agnth.drvh [driver] after item_done called
KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_objection.svh(1271) @ 50: reporter [TEST_DONE] 'run' phase is proceed
KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 50: reporter [UVM/REPORT/SERVER]
KERNEL: --- UVM Report Summary ---
KERNEL:
KERNEL: ** Report counts by severity
KERNEL: UVM_INFO :    6
KERNEL: UVM_WARNING :    0
