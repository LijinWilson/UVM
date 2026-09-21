// Code your testbench here
// or browse Examples

    
    
//     ON REAL SIMULATOR:
    /* MAKE ONE PACKAGE FILE
    	- MAKE ALL CLASS CODE IN SEPERATE FILE EG: DFF_DRIVER.SV ETC......
    
    */

`include "uvm_macros.svh";
import uvm-pkg::*;

// ---------------- SEQUENCE ITEM CLASS ----------------
class dff_txn extends uvm_sequence_item;
  
  //   data item to send
  rand bit d; // input to D_FF
  bit q_exp; // output from D_FF
  
  // Registering with factory
  `uvm_object_utils(dff_txn);
  
//   constructor
  function new(string name = "dff_txn")'
    super.new(name);
  endfunction
  
  function string convert2string;
    return $sformatf("%d  = %0b", "expected q = %0b", d, q_exp);
  endfunction
  
endclass

// ---------------- SEQUENCE CLASS, parametrized class ----------------
class dff_seq extends uvm_sequence #(dff_txn);;
  
//   registering with factory
  `ucm_object_utils(dff_seq);
  
//   Creating handle for d_txn;
  dff_txn txn;
  
//   constructor 
  function new (string name = "dff_seq");
    super.new(name);
  endfunction
  
  //   calling BODY() TASK, here we are using approach b rather than approach a lengthy methods
  task body();
    `uvm_info(get_type_name(), "Starting D_FF sequences", UVM_LOW);

    //  ----   repeating the action for 10 times ----
    
    repeat(10) begin
//       creating handles of txn item
      txn = dff_txn :: type_id :: create("txn");
      assert(txn.randomize()); // randomizing the txn item
      start_item(txn);
      finish_item(txn);
    end
    
    `uvm_info(get_type_name(), $formatf("Generate txn %s", convert2string), UVM_LOW);
  endtask 
endclass


// -------------------------------- SEQUENCER  class --------------------------------
class dff_sequencer extends uvm_sequencer;

  //   registering to factory
  `uvm_component_utils(dff_sequencer);
  
  
//   constructor class
  function new(string name = "dff_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction
  
endclass


// -------------------------------- DRIVER CLASS --------------------------------      
class dff_driver extends uvm_driver;
//   registering to factory
  `uvm_component_utils(dff_driver);
  
//   declaring virtual interface handle, used to move data for DUT
  virtual dff_inf vif;
  
//   constructing costructor
  function new (name = "dff_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
//   buil phase
  function void build_phase(uvm_phase phase);
    super.build_class(phase);
    
//     using config db for getting the virtual interface handle 
//     as it is reciever side no need to path, so making it empty
    if(!uvm_config_db #(virtual dff_inf) :: get(this, "", "vif", vif);
       begin
         `uvm_fatal("NO INTERFACE", "VIRTUAL INTERFACE IS NOT RECIEVED");
       end
       
   endfunction
       
//        run phase task
   task run_phase(uvm_phase phase);
//          declaring handle for trasaction item
     dff_txn txn;
         
     forever begin
//   getting data from built in TLM port
     seq_item_port.get_next_item(txn);
           
//   putting that recievec item to virtual interface 
     vif.d <= txn.d;
           
//   acknowledging sequencer that driver has recieved the data.
     seq_item.port.item_done();
           
     `uvm_info(get_type_name(), $sformatf("DRIVER DRIVEN D IS %0d", txn.d), UVM_LOW);
     end
   endtask
endclass
       
// ---------------------------- MONITOR CLASS ----------------------------
// The monitor also need the virtual interface
       class dff_monitor extends uvm_monitor;

         //          Registering to factory
         `uvm_component_utils(dff_monitor);

         //          Declaring handles for virtual interface
         virtual dff_inf vif;

         //          constructor
         function new(string name = "dff_monitor", uvm_component parent);
           super.new(name, parent);
         endfunction

         //          build Phase
         function void build_phase(uvm_phase phase);
           super.build_phase(phase);

           //            getting interface from the top through UVM CONFIG DB
           if(!uvm_config_db #(virtual dff_inf) :: get(this, "", "vif", vif))
             `uvm_fatal(get_type_name(), "CANNNOT GET INTERFACE INSTANCE");
         endfunction

         //          run phase task
         task run_phase(uvm_phase phase);
           //            transaction class handle
           dff_txn txn;

           forever begin
             //              analysing data at vif.positive edge clock
             @(posedge vif.clk)

             //              declaring the instance of the txn;
             txn = dff_txn :: type_id :: create("txn", this);

             // copying the data from virtual interface to LOCAL(transaction class)
             txn.d = vif.d;
             txn.q_exp = vif.q; // expected output

             //	MONITOR ANALYSIS PORT.
             // 	- the analysis port instantly broadcasts a copy of the txn object to any and all components that have subscribed (connected) to it(reference model, score board).
             mon_ap_write(txn);

             `uvm_info(get_type_name(),$sformat("MON : OBSERVERED THE DATA %d and output of design : q = %d",txn.d,txn.q_exp);
                       endtask
endclass
                       
// ---------------------------- AGENT CLASS --------------------------------------------------------
class dff_agent extends uvm_agent;
//   registering to factory
  `uvm_component_utils(dff_agent);
  
//   declaring the hanles of monitor, driver and sequencer
  dff_monitor monh;
  dff_driver drvh;
  dff_sequencer seqrh;
  
//   handles for virtual interface
  virtual dff_inf vif;
  
//   constructor
  function new(string name = "dff_agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
//   build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
//  getting interface from the top through UVM CONFIG DB
//  Here for connecting the interface with driver and monitor
    if(!uvm_config_db #(virtual dff_inf) :: get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "CANNNOT GET INTERFACE INSTANCE");
    
//     creating instance for driver, monitor, sequencer
    drvh = dff_driver :: typeid :: create("drvh", this);
    monh = dff_monitor :: typeid :: create("monh", this);
    seqrh = dff_sequencer :: typeid :: create("seqrh", this);
    
//     Connecting the driver with sequencer using built in TLM port
    drvh.seq_item_port.connect(seqrh.seq_item_export);
    
//     passing virtual interface handles with driver and sequencer
    drvh.vif = vif;
    seqrh.vif = vif;
    
  endfunction
endclass
                       
// ---------------------------- SCOREBOARD CLASS ----------------------------
// Just compairing the input and output
class dff_scoreboard extends uvm_scoreboard;
  
//   registering to factory
  `uvm_component_utils(dff_scoreboard);
  
  int total_txns;
  int pass_count, fail_count;
  
//   Constructor
  function new(string name = "dff_scoreboard", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  //   Implementing the write() method
  // this method was called inside and implement inside the target(score board);
  function void write(dff_txn txn);
    
    // increementing the transaction count, for getting the transaction count;
    total_txns++;
    
//     Pass or Fail checking and Count
    if(txn.d == txn.q_exp)
      begin
        pass_count++;
        `uvm_info(get_type_name(), $sformatf("[PASS] D = %0b and q_exp = %0b", txn.d, txn.q_exp),UVM_LOW);
      end
    else
      begin
        `uvm_info(get_type_name(), $sformatf("[FAIL] D = %0b and q_exp = %0b", txn.d, txn.q_exp),UVM_LOW);
      end
  endfunction
  
  
//   Report Phase function
//   Printing the number of transaction, fail and pass
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    
    `uvm_info(get_type_name(), $sformatf("TOTAL TRANS = %0D | PASS COUNT = %0D | FAIL COUNT = %0D", total_txns, pass_count, fail_count), UVM_LOW);
  
endclass

    
// ---------------------------- ENVIROMENT CLASS ----------------------------------
    
// Score board and monitor are connected using ANALYSIS PORT.

class dff_env extends env;
  
//   Registering with factory
  `uvm_component_utils(dff_env);
  
//   Declaring the handles for AGENT AND SCOREBOARD
  dff_scoreboard sbh;
  dff_agent agnth;
  
  dff_seq seqh;
  
//   constructor
  function new(string name  = "dff_env", uvm_component parent);
    super.new(name, parent);
  endfunction 
  
//   build phase - instantiating the AGENT and SCORE BOARD class
  function build_phase(uvm_phase phase);
    super.build_phase(phase);
    
//     instantiating the agent and scoreboard class
    sbh = dff_scoreboard :: type_id :: create("sbh", this);
    agnth = dff_agent :: type_id :: create("agnth", this);
    
  endfunction
  
//   conect phase - connecting the monitor and scoreboard using the analysis port
  function void connect_phase(uvm_phase phase);
    super.new(phase);
    
    /*
    If the monitor's analysis port (mon_ap) is the radio transmitter broadcasting the data, the scoreboard's implementation port (sb_imp) is the radio receiver listening for it.
    */
    
    agnth.monh.mon_ap.connect(sbh.);
    
  endfunction
  
endclass
    
// --------------------------------- TEST CLASS ---------------------------------
class dff_test extends uvm_test;
  
//   registering it to factory;
  `uvm_component_utils(dff_test);
  
//   handle for env class
    dff_env envh;
  
//   constructor
  function new(string name = "dff_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
//   Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    envh = dff_env :: type_id :: create("envh", this);
    
  endfunction
  
//   task RUN_PHASE
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
//     creating the instance of sequence
    seqh = dff_seq :: type_id :: create("seqh");
    phase.raise_objection(this);
//     handing the sequence to that specific sequencer and saying, "Execute these data patterns right now."
    seqh.start(envh.agnth.seqrh);
    #100;
    phase.drop_objection(this);
  endtask
endclass
    
//------------------------------------ PACKAGE CLASS ------------------------------------
  package dff_tb_pkg;

  // Import UVM base package
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  //---------------------------------------------------------
  // Include all UVM components
  //---------------------------------------------------------
  `include "dff_txn.sv"
  `include "dff_sequence.sv"
  `include "dff_sequencer.sv"
  `include "dff_driver.sv"
  `include "dff_monitor.sv"
  `include "dff_agent.sv"
  `include "dff_sb.sv"
  `include "dff_env.sv"
  `include "dff_test.sv"

endpackage
    
    
// ------------------------------------ TOP MODULE CODE ------------------------------------
// Import your testbench package
import uvm_pkg::*;
`include "uvm_macros.svh"
import dff_tb_pkg::*;

//---------------------------------------------------------
// Interface Declaration
//---------------------------------------------------------
interface dff_if (input logic clk);
  logic rst_n;
  logic d;
  logic q;
endinterface : dff_if

//---------------------------------------------------------
// Top-Level Testbench Module
//---------------------------------------------------------
module tb_top;

// Clock signal
    logic clk;
    // Instantiate interface and connect to clock
    dff_if dff_vif (clk);

    // DUT instance
    dff dut (
        .clk   (clk),
        .rst_n (dff_vif.rst_n),
        .d     (dff_vif.d),
        .q     (dff_vif.q)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset generation
    initial begin
        dff_vif.rst_n = 0;
        #15;
        dff_vif.rst_n = 1;
    end
  end
    
    //---------------------------------------------------------
    // UVM Configuration and Test Start
    //---------------------------------------------------------
    initial begin
        // Set virtual interface for driver and monitor
        uvm_config_db#(virtual dff_if)::set(null, "*", "vif", dff_vif);
        
        // Run the UVM test
        run_test("dff_test");
    end

endmodule

    
    
    
    
     
//------------------------------------ DESIGN CODE ------------------------------------
    
//     DESIGN CODE, THIS SHOULD BE ON SEPERATE FILE
    module dff (
    input  logic clk,      // Clock
    input  logic rst_n,    // Active-low synchronous reset
    input  logic d,        // D input
    output logic q         // Q output
);

    // Sequential logic: Q follows D on rising clock edge
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0;      // Reset output to 0
        else
            q <= d;         // Capture input D
    end

endmodule
    
//---------------------------------- OUTPUT ----------------------------------
 # UVM_INFO dff_driver.sv(47) @ 75000: uvm_test_top.env.agt.drv [dff_driver] Driven D = 0, Expected Q = 0
# UVM_ERROR dff_sb.sv(34) @ 75000: uvm_test_top.env.sb [dff_scoreboard] FAIL: D = 0, Q = 1 (Mismatch!)
# UVM_INFO dff_monitor.sv(40) @ 75000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 0, Q = 1
# UVM_INFO dff_sequence.sv(26) @ 75000: uvm_test_top.env.agt.seqr@@seq [dff_seq] Generated txn: d = 0, expected q = 0
# UVM_INFO dff_driver.sv(47) @ 85000: uvm_test_top.env.agt.drv [dff_driver] Driven D = 1, Expected Q = 1
# UVM_ERROR dff_sb.sv(34) @ 85000: uvm_test_top.env.sb [dff_scoreboard] FAIL: D = 1, Q = 0 (Mismatch!)
# UVM_INFO dff_monitor.sv(40) @ 85000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 0
# UVM_INFO dff_sequence.sv(26) @ 85000: uvm_test_top.env.agt.seqr@@seq [dff_seq] Generated txn: d = 1, expected q = 1
# UVM_INFO dff_driver.sv(47) @ 95000: uvm_test_top.env.agt.drv [dff_driver] Driven D = 0, Expected Q = 0
# UVM_ERROR dff_sb.sv(34) @ 95000: uvm_test_top.env.sb [dff_scoreboard] FAIL: D = 0, Q = 1 (Mismatch!)
# UVM_INFO dff_monitor.sv(40) @ 95000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 0, Q = 1
# UVM_INFO dff_sequence.sv(26) @ 95000: uvm_test_top.env.agt.seqr@@seq [dff_seq] Generated txn: d = 0, expected q = 0
# UVM_INFO dff_driver.sv(47) @ 105000: uvm_test_top.env.agt.drv [dff_driver] Driven D = 1, Expected Q = 1
# UVM_ERROR dff_sb.sv(34) @ 105000: uvm_test_top.env.sb [dff_scoreboard] FAIL: D = 1, Q = 0 (Mismatch!)
# UVM_INFO dff_monitor.sv(40) @ 105000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 0
# UVM_INFO dff_sequence.sv(26) @ 105000: uvm_test_top.env.agt.seqr@@seq [dff_seq] Generated txn: d = 1, expected q = 1
# UVM_INFO dff_sequence.sv(29) @ 105000: uvm_test_top.env.agt.seqr@@seq [dff_seq] DFF sequence completed.
# UVM_INFO dff_sb.sv(28) @ 115000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 115000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 125000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 125000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 135000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 135000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 145000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 145000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 155000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 155000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 165000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 165000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 175000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 175000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 185000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 185000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 195000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 195000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO dff_sb.sv(28) @ 205000: uvm_test_top.env.sb [dff_scoreboard] PASS: D = 1, Q = 1 (Match)
# UVM_INFO dff_monitor.sv(40) @ 205000: uvm_test_top.env.agt.mon [dff_monitor] MON: Observed D = 1, Q = 1
# UVM_INFO verilog_src/uvm-1.1d/src/base/uvm_objection.svh(1267) @ 205000: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO dff_sb.sv(41) @ 205000: uvm_test_top.env.sb [dff_scoreboard] Total = 21, Pass = 16, Fail = 5
# 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   64
# UVM_WARNING :    0
# UVM_ERROR :      5
# UVM_FATAL :      0

    
      
// ---------------------------------- ANALYSIS PORT ----------------------------------
    
 /*
In UVM, there are two main families of TLM ports, and they are used for different purposes:

1. Standard TLM Ports (Point-to-Point)

How they work: These are strictly 1-to-1 connections and often involve waiting or handshakes (blocking).

Where you use them: The connection between the Sequencer and the Driver uses a standard TLM port (specifically, a uvm_seq_item_pull_port). The driver asks for an item, waits, and the sequencer hands it exactly one item.

2. TLM Analysis Ports (Broadcast)

How they work: These are 1-to-many connections and are strictly non-blocking (using the write() method). The sender throws the data out and never waits for a response.

Where you use them: As you perfectly summarized, this is exactly what is used to connect the Monitor to the Scoreboard (and to coverage collectors).
 */
         
  
// ANALYSIS PORT EXPLANATION
/*
In UVM, an analysis port (uvm_analysis_port) is a dedicated broadcast channel used to send data from one component to multiple other components. It works entirely on a Publish/Subscribe model.

Think of it like a Radio Station:

The Broadcaster (The Monitor): When the monitor sees a complete transaction on the bus (like a D-Flip Flop input/output), it packages that data and broadcasts it out into the airwaves via the analysis port. It essentially shouts, "Hey, a transaction just happened! Here is the data!"

The Listeners (Scoreboards, Coverage Collectors, etc.): Any component that cares about that data "tunes in" by formally connecting to that analysis port. (In your video's captions, the speaker mentions connecting the scoreboard using the analysis port).

The Rule of the Radio: The radio station (monitor) doesn't care if 1 component is listening, 10 components are listening, or nobody is listening at all. It never waits for a receipt. It just broadcasts the data and immediately goes back to watching the bus.

Why is it built this way? (Decoupling)
If you hard-wired the monitor directly to the scoreboard, the monitor's code would break if you ever wanted to run a test without a scoreboard.

By using an analysis port, the components are completely independent. The monitor simply calls write(transaction) on its analysis port, and the UVM framework automatically distributes a copy of that transaction to every single component that chose to subscribe to it.
*/
