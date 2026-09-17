/*
--=== VERBOSITY LEVEL ===--

typedef enum {
  UVM_NONE    = 0,
  UVM_LOW     = 100,
  UVM_MEDIUM  = 200,
  UVM_HIGH    = 300,
  UVM_FULL    = 400,
  UVM_DEBUG   = 500
} uvm_verbosity;
 
*/

// ---======== VIRTUAL FUNCTIONS ( already described in library ) ========---
/*
  1. Virtual function void uvm_report_info(string id,string message,int verbosity = UVM_HIGH, string file name = "",int line = 0);
      > string id:
        - While registering class with factory we will get one id. 
        - To get the string id: get_type_name.
      > Line number:
        - use the editor line number, where we typing this virtual function [Virtual function void uvm_report_info]

  2. Virtual function void uvm_report_warning (string id,string message,int verbosity = UVM_MEDIUM, string file name = "",int line = 0);

  3. Virtual function void uvm_report_error (string id,string meessage,int verbosity = UVM_LOW, string file name = "",int line = 0);

  4. Virtual function void uvm_report_fatal(string id,string message,int verbosity = NONE,string file name = "", int line = 0);

*/
// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Example 1
// VERBOSITY and VIRTUAL FUNCTION

`include "uvm_macros.svh";
import uvm_pkg::*;

// 12:33
class test extends  uvm_test;
  
  // registering to factory;
  `uvm_component_utils(test);

  // overriding the virtual constructor
  function new(string name = "test", uvm_component parent);
    super.new(name, parent);
  endfunction

  // BUILD PHASE
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // VIRTUAL FUNCTION overriding uvm printing
    // Format: Virtual function void uvm_report_info(string id,string message,int verbosity = UVM_HIGH, string file name = "",int line = 0);
    uvm_report_info(get_type_name, "PRINTING CALLED FROM BUILD PHASE", UVM_HIGH, "test.sv", 23); 

    // using MACROS (comment vitual function and try)
    `uvm_info(get_type_name,"printing from build_phase",UVM_NONE);

  endfunction

endclass

// Top Module
module top();
  initial
    begin
      uvm_top.set_verbosity_level(UVM_HIGH);
      run_test("test");
    end
endmodule


// >>>>>>>>>>>>>>>>>> OUTPUT SCENARIOS <<<<<<<<<<<<<<<<<<<<

// USING VIRTUAL FUNCTION
// NO OUTPUT
// SCENARION - 1:
/*
  -  as verbosity level is selected as medium by deafult, so this UVM_HIGH level wont print on output console. 
  -  only level less than medium and medium only print.
*/

// SCENARIO - 2:
# KERNEL: UVM_INFO test.sv(18) @ 0: uvm_test_top [test] printing from build_phase
/*
  - overriding the verbosity level from medium to user requirment(UVM_HIGH as now) in main top module.
    - SYNTAX: uvm_top.set_verbosity_level(UVM_HIGH);
*/

// USING MACROS:
# KERNEL: UVM_INFO /home/runner/testbench.sv(19) @ 0: uvm_test_top [test] printing from build_phase





