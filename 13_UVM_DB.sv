// Code your testbench here
// or browse Examples
`include "uvm_macros.svh";
import uvm_pkg ::*;

// Class A
class class_a extends uvm_component;
// registering factory
  `uvm_component_utils(class_a);
  function new(string name = "class_a",uvm_component parent);
    super.new(name,parent);
  endfunction
  function display();
    `uvm_info(get_type_name(),"inside class a",UVM_LOW)
  endfunction
endclass

// Class C
class class_c extends uvm_component;
// registering to factory
  `uvm_component_utils(class_c)

  function new(string name = "class_c",uvm_component parent);

    super.new(name,parent);

  endfunction

  function display();

    `uvm_info(get_type_name(),"inside class c",UVM_LOW);

  endfunction

endclass

// Class B
class class_b extends uvm_component;
// registering on factory
  `uvm_component_utils(class_b);
  // control signal for class C
  int ctrl;
  // calling handle of class C
  class_c cc;
  
  function new(string name = "class_b",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // getting the control signal from UVM DB.
    // control is key name and is same for set and get, and ctrl the variable storing the value coming from the sender
    if (!uvm_config_db #(int) :: get(this, "", "control", ctrl);
        `uvm_fatal(get_type_name(), "get function failed", UVM_NONE);
        // making the class c
        if (ctrl)
          // creating the instance of Class C
          cc = class_c :: type_id :: create("cc", this);
        cc.display();
  endfunction

  function display();
    `uvm_info(get_type_name(),"inside class b",UVM_NONE);  
  endfunction
endclass

// Class Environment
class env extends uvm_env;

  `uvm_component_utils(env)
  
  class_a ca;
  class_b cb;
  
  function new(string name = "env",uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    ca = class_a :: type_id :: create("ca",this);
    cb = class_b :: type_id :: create("cb",this);
    
  endfunction
  
endclass

// Test class
// from here the control signal is sending
class test extends uvm_test;

  `uvm_component_utils(test)

  int ctrl = 1;

  env envh;

  function new(string name = "test",uvm_component parent);

    super.new(name,parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    envh = env :: type_id :: create("envh",this);
// * means this control signal can access by the all component under test
    // thrpugh path we can restrict the data access
    uvm_config_db#(int) :: set(this,"*","control",ctrl);

  endfunction

  task run_phase(uvm_phase phase);

    super.run_phase(phase);

    envh.ca.display();
    envh.cb.display();

  endtask

endclass

// TOP module
module top;

  initial
    begin
      run_test("test");
    end
endmodule

// OUTPUT
# KERNEL:         (Specify +UVM_NO_RELNOTES to turn off this notice)
# KERNEL: 
# KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
# KERNEL: UVM_INFO /home/runner/testbench.sv(37) @ 0: uvm_test_top.envh.cb.cc [class_c] inside class c
# KERNEL: UVM_INFO /home/runner/testbench.sv(19) @ 0: uvm_test_top.envh.ca [class_a] inside class a
# KERNEL: UVM_INFO /home/runner/testbench.sv(77) @ 0: uvm_test_top.envh.cb [class_b] inside class b
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER]
# KERNEL: --- UVM Report Summary ---
# KERNEL:
# KERNEL: ** Report counts by severity
# KERNEL: UVM_INFO :    5
