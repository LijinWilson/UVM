`include "uvm_macros.svh";
import uvm_pkg ::*;

// Driver Component
class driver extends uvm_driver;

  // factory registering
  `uvm_component_utils(driver)
  
  function new(string name = "driver",uvm_component parent);
    super.new(name,parent);
  endfunction

  // virtual UVM_phase function, this can be override by the user
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    `uv_info("BUILD PHASE","CONNECT PHASE CALLED FROM DRIVER COMPONENT", UVM_LOW);
  endfunction

  // connect Phase
  function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
    `uvm_info("CONNECT PHASE","CONNECT PHASE CALLED FROM DRIVER COMPONENT",UVM_LOW);
  
endfunction

// RUN PHASE
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("RUN PHASE", "RUN PHASE CALLED FROM DRIVER CLASS", UVM_LOW);
  endtask
  
endclass

// Monitor Component
class monitor extends uvm_monitor;

  // factory registering
  `uvm_component_utils(monitor)
  
  function new(string name = "monitor",uvm_component parent);
    super.new(name,parent);
  endfunction

// virtual UVM_phase function, this can be override by the user
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    `uvm_info("BUILD PHASE","BUILD PHASE CALLED FROM MONITOR COMPONENT", UVM_LOW);
  endfunction

  // CONNECT PHASE
  function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
    `uvm_info("CONNECT PHASE","CONNECT PHASE CALLED FROM MONITOR COMPONENT",UVM_LOW);
  
endfunction

  // RUN PHASE
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("RUN PHASE", "RUN PHASE CALLED FROM MONITOR CLASS", UVM_LOW);
  
  endtask
  
endclass

// Agent Component
class agent extends uvm_agent;

  // factory registering
  `uvm_component_utils(agent);
  
  // creating handles
  monitor monh;
  driver drvh;
  
  function new(string name = "agent",uvm_component parent);
    super.new(name,parent);
  endfunction

// virtual UVM_phase function, this can be override by the user
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    `uvm_info("BUILD PHASE","BUILD PHASE CALLED FROM AGENT COMPONENT", UVM_LOW);

    // As Driver and Monitor are subcmoponent inside the Agent, we need to creat them in build_phase.
    drvh = driver :: type_id :: create("drvh", this);
    monh = monitor :: type_id :: create("monh", this);
    
  endfunction

  // connect Phase
  function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
    `uvm_info("CONNECT PHASE","CONNECT PHASE CALLED FROM AGENT COMPONENT",UVM_LOW);
  
endfunction
  
  // RUN PHASE
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("RUN PHASE", "RUN PHASE CALLED FROM AGENT CLASS", UVM_LOW);
  endtask
  
endclass

// Enironment Class
class env extends uvm_env;

  // factory registeration
  `uvm_component_utils(env);

  // creating handles for agent;
  agent agnth;

  // Virtual constructor
  function new(string name = "env", uvm_component parent);
    super.new(name, parent);
  endfunction

  // creating Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    `uvm_info("BUILD PHASE", "BUILD PHASE CALLED FROM AGENT COMPONENT", UVM_LOW);

    // as agent is the subclass of env, so wwe need to create here
    agnth = agent :: type_id :: create("agnth", this);
  endfunction

  // connect Phase
  function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
    `uvm_info("CONNECT PHASE","CONNECT PHASE CALLED FROM ENV COMPONENT",UVM_LOW);
  
endfunction

  // RUN PHASE
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("RUN PHASE", "RUN PHASE CALLED FROM ENV COMPONENT", UVM_LOW);
  endtask

endclass

// Test Class/top class
class test extends uvm_test;

  // factory registeration
  `uvm_component_utils(test);

  // creating environment handles
  env envh;

  // virtual constructor
  function new(string name = "env", uvm_component parent);
    super.new(name,  parent);
  endfunction

  // creating the build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    `uvm_info("BUILD PHASE", "BUILD PHASE CALLED FROM TEST COMPONENT", UVM_LOW);

    // create object for env, as env is inside the test class
    envh = env :: type_id :: create("envh", this);
  endfunction

    // connect Phase
  function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
    `uvm_info("CONNECT PHASE","CONNECT PHASE CALLED FROM ENV COMPONENT",UVM_LOW);
  
endfunction

  // creating the end_of_Connection_phase;
  function void end_of_connection_phase(uvm_phase phase);
    super.end_of_connection_phase(phase);

    uvm_top.print_topolgy();
  endfunction

    // RUN PHASE
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("RUN PHASE", "RUN PHASE CALLED FROM TEST COMPONENT", UVM_LOW);
  endtask

endclass

    


// Top Module
module top();

  initial
    begin
      run_test("test"); // run_test is an inbuilt construct and it initiate the UVM phasing mechanism run_test("test_name");
    end

endmodule
    
    // Scenario - 1(BUILD PHASE EXECUTION): OUTPUT - Here it is order of build phase execution of classes [Top to Bottom].
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
# KERNEL: UVM_INFO /home/runner/testbench.sv(109) @ 0: uvm_test_top [BUILD_PHASE] BUILD PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(85) @ 0: uvm_test_top.envh [BUILD_PHASE] BUILD PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(59) @ 0: uvm_test_top.envh.agnth [BUILD_PHASE] BUILD PHASE CALLED FROM AGENT CO
# KERNEL: UVM_INFO /home/runner/testbench.sv(17) @ 0: uvm_test_top.envh.agnth.drvh [BUILD_PHASE] BUILD PHASE CALLED FROM DRI
# KERNEL: UVM_INFO /home/runner/testbench.sv(37) @ 0: uvm_test_top.envh.agnth.monh [BUILD_PHASE] BUILD PHASE CALLED FROM MON
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER]

    // SCENARIO - 2 [CONNECT PHASE]
   # KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
# KERNEL: UVM_INFO /home/runner/testbench.sv(138) @ 0: uvm_test_top [BUILD_PHASE] BUILD PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(107) @ 0: uvm_test_top.envh [BUILD_PHASE] BUILD PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(74) @ 0: uvm_test_top.envh.agnth [BUILD_PHASE] BUILD PHASE CALLED FROM AGENT CO
# KERNEL: UVM_INFO /home/runner/testbench.sv(17) @ 0: uvm_test_top.envh.agnth.drvh [BUILD_PHASE] BUILD PHASE CALLED FROM DRI
# KERNEL: UVM_INFO /home/runner/testbench.sv(45) @ 0: uvm_test_top.envh.agnth.monh [BUILD_PHASE] BUILD PHASE CALLED FROM MON
# KERNEL: UVM_INFO /home/runner/testbench.sv(24) @ 0: uvm_test_top.envh.agnth.drvh [CONNECT_PHASE] CONNECT PHASE CALLED FROM
# KERNEL: UVM_INFO /home/runner/testbench.sv(52) @ 0: uvm_test_top.envh.agnth.monh [CONNECT_PHASE] CONNECT PHASE CALLED FROM
# KERNEL: UVM_INFO /home/runner/testbench.sv(87) @ 0: uvm_test_top.envh.agnth [CONNECT_PHASE] CONNECT PHASE CALLED FROM AGEN
# KERNEL: UVM_INFO /home/runner/testbench.sv(116) @ 0: uvm_test_top.envh [CONNECT_PHASE] CONNECT PHASE CALLED FROM ENV COMPO
# KERNEL: UVM_INFO /home/runner/testbench.sv(148) @ 0: uvm_test_top [CONNECT_PHASE] CONNECT PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER]

// SCENARIO - 3 [END_OF_CONNECTION_PHASE]
# KERNEL: ---------------------------------------------------------
# KERNEL: Name                      Type                   Size  Value
# KERNEL: ---------------------------------------------------------
# KERNEL: uvm_test_top              test                   -     @335
# KERNEL:   envh                    env                    -     @350
# KERNEL:     agnth                 agent                  -     @361
# KERNEL:       drvh                driver                 -     @373
# KERNEL:         rsp_port          uvm_analysis_port      -     @392
# KERNEL:         seq_item_port     uvm_seq_item_pull_port -     @382
# KERNEL:       monh                monitor                -     @402
# KERNEL: ---------------------------------------------------------

// SCENARIO - 4 [RUN PHASE]
# KERNEL: UVM_INFO /home/runner/testbench.sv(236) @ 0: uvm_test_top [END OF ELABORATION PHASE] END OF ELABORATION PHASE CALLI
# KERNEL: UVM_INFO /home/runner/testbench.sv(244) @ 0: uvm_test_top [RUN PHASE] RUN PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(193) @ 0: uvm_test_top.envh [RUN PHASE] RUN PHASE CALLED FROM ENV COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(146) @ 0: uvm_test_top.envh.agnth [RUN PHASE] RUN PHASE CALLED FROM AGENT COMPO
# KERNEL: UVM_INFO /home/runner/testbench.sv(93) @ 0: uvm_test_top.envh.agnth.monh [RUN PHASE] RUN PHASE CALLED FROM MONITOR
# KERNEL: UVM_INFO /home/runner/testbench.sv(46) @ 0: uvm_test_top.envh.agnth.drvh [RUN PHASE] RUN PHASE CALLED FROM DRIVER (
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER]



// SOME NOTES RUN PHASES-  Phases that run parallel with RUN_PHASE
/*
   Phase Type,Phase Name,Description
1, task,pre_reset,Used to add any activity or functionality before reset as power-up signal goes active
2, task,reset,Used to generate a reset and put an interface into its default state.
3, task,post_reset,Used to add any activity that is required immediately after reset
4, task,pre_configure,"After the reset is completed, this phase is used to prepare DUT for configuration programming. Ex: It may be used as a last chance to update information before it is passed to the DUT."

below one shows the area where we are using the pre-reset and post-reset are used >>
----------------the cases/scenario that we are using the pre_reset -----------

Scenario,Signal Example,Why Set It Before Reset?
1. Power-Up Sequence,"power_up, vdd_en",Many chips require power to be present before reset is applied. The reset line only has an effect when the chip is powered.
2. Clock Enable,clk_en,"Some DUTs expect clock to be running or gated ON before reset starts, or they sample clock enable during reset."
3. Boot Mode Select,boot_mode[1:0],These pins may be latched during reset. They must be stable before and during reset.
4. Configuration Pins,"cfg, straps, etc.",Some hardware reads configuration straps (external pull-up/down settings) during reset. You must set them before reset.
5. Isolation or Bias Controls,"iso_en, bias_on",Analog or mixed-signal designs may need certain bias circuits enabled before reset to avoid damage or invalid states.
6. Reset Supervisor Signal,"reset_req, reset_ctrl","If an external block or testbench controls reset sequencing, you may need to set its control line before applying DUT reset."

------------------- The post_reset_phase comes after the reset has been deasserted. It's used to: -----------------------

 * Wait for DUT to stabilize
 * Do basic DUT initialization (e.g., configure registers)
 * Make sure DUT is ready to accept transactions
*/
