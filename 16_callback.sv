`include "uvm_macros.svh";
import uvm_pkg::*;

typedef enum {DATA_1, DATA_2, EXTRA_DATA1, EXTRA_DATA2} pkt_type;

pkt_type pkt;

// CALL BACK CLASS
class driver_cb extends uvm_callback;
  // registering to factory
  `uvm_object_utils(driver_cb);

  function new(string name = "driver_cb");
    super.new(name);
  endfunction

  // Defining a empty virtual function to add modification code.
  virtual task modify_pkt();
    // Add Modification
  endfunction

endclass

class derived_cb extends driver_cb;
  // Registering to factory
  `uvm_object_utils(derived_cb);

  function new(string name = "derived_cb"):
    super.new(name);
  endfunction

  // overidding the virtual function(modify_pkt) inside driver_cb class
  task modify_pkt();
    `uvm_info(get_type_name(), "inside modify_pkt method injecting extra pkt", UVM_LOW);

    // Randomize the 'pkt' variable using SystemVerilog's built-in scope randomization
    // The 'with' clause applies an inline constraint to inject our custom behavior,
    // explicitly forcing the driver to generate 'EXT_DATA1' or 'EXT_DATA2' packets
    // instead of its normal, default data.
    std::randomize(pkt) with {pkt inside {EXT_DATA1,EXT_DATA2};};
    
  endtask
endclass

// DRIVER CLASS
class driver extends uvm_driver;

  `uvm_component_utils(driver);
  `uvm_register_cb(driver, driver_cb) // Registering the callback class

  function new(string name = "driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    
    drive();
    
    `uvm_do_callbacks(driver,driver_cb,modify_pkt()); //hook, uvm_do_callbacks hook, the driver effectively says: "Let me check my queue. Did anyone add anything?"
    
  endtask

  task drive();
    
    `uvm_info(get_full_name(),"inside driver class method",UVM_LOW)
    
    std::randomize(pkt) with {pkt == DATA_1;};
    
  endtask

endclass

// ENV CLASS
class env extends uvm_env;

  driver drvh;

  `uvm_component_utils(env)

  function new(string name = "env",uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    drvh = driver :: type_id :: create("drvh");

  endfunction

endclass

// TEST CLASS
class base_test extends uvm_test;

  env envh;

  `uvm_component_utils(base_test)

  function new(string name = "base_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    envh = env :: type_id :: create("envh",this);
    
  endfunction

endclass

// TEST 2 CLASS and SCENARIO - 2 CASE
class test_2 extends base_test;

  derived_cb dcb;

  `uvm_component_utils(test_2);

  function new(string name = "test_2", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Create the instance of the user-defined callback class
    dcb = derived_cb :: type_id :: create("dcb");
    
    // Register/add the callback to the specific driver instance | replacing driver, driver class with derived_cb driver class
    uvm_callbacks#(driver,driver_cb) :: add(envh.drvh, dcb);
    
  endfunction

endclass

// TOP MODULE
module top;

  initial
    begin
      // SCENARIO - 1
      run_test("base_test");
      // Running the SCENARIO - 2 CASE
      run_test("test_2");
    end

endmodule


// OUTPUT
// SCENARIO - 1 NORMAL DRIVER | INSIDE DRIVER CLASS CODE    
# KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test base_test...
# KERNEL: UVM_INFO /home/runner/testbench.sv(69) @ 0: uvm_test_top.envh.drvh [uvm_test_top.envh.drvh] inside driver class method
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER]
# KERNEL: --- UVM Report Summary ---
# KERNEL: 
# KERNEL: ** Report counts by severity
# KERNEL: UVM_INFO :    3
# KERNEL: UVM_WARNING :    0
# KERNEL: UVM_ERROR :      0
# KERNEL: UVM_FATAL :      0

  // -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  // SCENARIO - 2 USING DERIVED_CB DRIVER
  # KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test_2...
# KERNEL: UVM_WARNING @ 0: reporter [CBUNREG] Callback dcb cannot be registered with object (*) because callback type derived_cb is not registered w
# KERNEL: UVM_INFO /home/runner/testbench.sv(69) @ 0: uvm_test_top.envh.drvh [uvm_test_top.envh.drvh] inside driver class method
# KERNEL: UVM_INFO /home/runner/testbench.sv(38) @ 0: reporter [derived_cb] inside modify_pkt method injecting extra pkt
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER]
# KERNEL: --- UVM Report Summary ---
# KERNEL: 
# KERNEL: ** Report counts by severity
# KERNEL: UVM_INFO :    4
# KERNEL: UVM_WARNING :    1
# KERNEL: UVM_ERROR :      0
# KERNEL: UVM_FATAL :      0
# KERNEL: ** Report counts by id
# KERNEL: [CBUNREG] 1
# KERNEL: [RNTST] 1
# KERNEL: [UVM/RELNOTES] 1
