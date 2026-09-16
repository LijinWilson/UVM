//-------------- packet override example without UVM factory -----------------------
// wr_txn and wrw_tnx2 is code for two type of packet, based on the use case we can change.
// if we need to use packet as wr_tnx2 instead of wr_txn, do inheritance in wr_tnx2 or another method is change the packet name on every code.

class wr_txn;
  
  rand logic [7:0] data_in;
  
  virtual function void display();
    $display("base_txn : data_in = %0d",data_in);
  endfunction
endclass

// we are extending (ingeritance) because we need to use the wr_tnx2 instead of wr_txn.
class wr_tnx2 extends wr_txn;
  
  rand logic [15:0] data_in;
  
  function void display();
    $display("wr_txn2 : data_in = %0d",data_in);
  endfunction
endclass

/*
/// for using the wrt_txn2(16 bit) we are adding new argument in constructor class. ///////
reason:-
Controlling from the Top: By adding wr_txn txn_type as an argument, you allow the upper layers (like the env or test block) to dictate which specific type of
packet the generator should produce.
*/

class generator;
  wr_txn wtxnh;
  wr_txn txn_type; // for using new packet( 8 or 16 bit)

  /*
    - explicitly telling the compiler that this specific mailbox should only store and retrieve objects of the wr_txn class.
  */
  mailbox#(wr_txn) gen_drv_mb;
  
  function new(mailbox #(wr_txn) gen_drv_mb, wr_txn txn_type);
    this.gen_drv_mb = gen_drv_mb;
    wtxnh = new();
    wtxnh = txn_type; // new packet(16)
  endfunction
  
  task send_packet();

/*
Silent Failures: If you just write wtxnh.randomize(); without checking the return value and the randomization fails, 
the simulator will silently ignore it. The variables will just keep their previous values.
Your testbench will continue running, but it will be driving stale or un-randomized data, which can lead to hours of confusing debugging.

Catching the Error Early: By wrapping it in assert(), you are telling the simulator: "I expect this randomization to succeed.
If it returns 0 (fails), throw an assertion error immediately and halt or flag the simulation."
*/    
    
    
    assert(wtxnh.randomize());
    wtxnh.display();
    
    gen_drv_mb.put(wtxnh);
    
  endtask
endclass

  class driver;
  mailbox#(wr_txn) gen_drv_mb;
  
  function new(mailbox#(wr_txn) gen_drv_mb);
    this.gen_drv_mb = gen_drv_mb;
  endfunction
  
  task drive_packet();
    wr_txn wtxnh;
    gen_drv_mb.get(wtxnh);
    
    wtxnh.display();
  endtask

endclass

  class env;

  generator genh;
  driver drvh;
    wr_txn txn_type; // for using 16 bit packet
  
  mailbox #(wr_txn) mb;
  
  function new(wr_txn txn_type);
    mb = new();
    this.txn_type = txn_type;
    genh = new(mb, wr_txn txn_type);
    drv = new(mb);
  endfunction
  
  task run();
    genh.send_packet();
    drvh.drive_packet();
  endtask
endclass

// top module
module test
  env envh;
  wr_txn txn_type; // for using 16 bit packet and comment the txn_type2.
  wr_tnx2 txn_type2; // for using the 8 bit packet and comment the txn_type.
  
  initial
    begin
      txn_type = new(); // for using 16 bit packet and comment the txn_type2.
      txn_type2 = new(); // for using the 8 bit packet and comment the txn_type.
      
      envh = new(txn_type); // for using 16 bit packet and comment the txn_type2.
      envh = new(txn_type2); // for using the 8 bit packet and comment the txn_type.
      envh.run();
      
      $display("test completed");
    end
endmodule

  
