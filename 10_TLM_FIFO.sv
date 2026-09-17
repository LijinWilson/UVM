`include "uvm_macros.svh";
import uvm_package::*;

// Packet Class
class packet extends uvm_object;

  // registering to factory
  `uvm_object_utils(packet)
  
  rand int data;
  
  function new(string name = "packet");
    super.new(name);
  endfunction

  function void display(string s);
    $display("%s the value of data is %d",s,data);
  endfunction
  
endclass

// Generator Class
class generator extends uvm_component;

  // 1. declaring the port | put_port is name of the port
  uvm_blocking_put_port #(packet) put_port;

  // registering to factory
  `uvm_component_utils(generator)
  
  // Creating the Handles of packet
  packet pkt;
  
  function new(string name = "generator",uvm_component parent);
    
    super.new(name,parent);

    // 2. Declaring the instance or new port
    put_port = new("put_port", this);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    pkt = packet :: type_id :: create("pkt",this);
    
  endfunction

  // function or run_phase to randomize data;
  task run_phase(uvm_phase phase);
    
    pkt.randomize();

    // putting the packet into port
    put_port.put(pkt);

  endtask
endclass


// Driver Class
class driver extends uvm_driver;

  // 1. Declaring the get port handle
  uvm_blocking_get_port #(packet) get_port;
  
  `uvm_component_utils(driver)
  
  // Packet Handle
  packet pkt;
  
  function new(string name = "driver",uvm_component parent);
    
    super.new(name,parent);

    // 2. Creating the instance of get port
    get_port = new("get_port",this);
    
  endfunction
    
  task run_phase(uvm_phase phase);
    
    // Getting the Packet
    get_port.get(pkt);
  
    pkt.display();
    
  endtask
endclass

// Agent Class
class agent extends uvm_agent;
  
  generator genh;
  driver drvh;

  // declaring the tlm fifo handle
  uvm_tlm_fifo #(packet) fifoh;

  // registering with factory
  `uvm_component_utils(agent);
  
  function new(string name = "agent",uvm_component parent);
    
    super.new(name,parent);

    // creating the instance of tlm FIFO port
    fifoh = new("fifoh",this);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    genh = generator :: type_id :: create("genh",this);
    
    drvh = driver :: type_id :: create("drvh",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // generator put_port is connecting with FIFO put_export
    genh.put_port.connect(fifoh.put_export);

    // driver get_port is connected with FIFO get_export 
    drvh.get_port.connect(fifoh.get_export);
    
  endfunction

endclass

// Test Class
class test extends uvm_test;
  
  agent agnth;
  
  function new(string name = "agent",uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    // calling instance of agent class
    agnth = agent :: type_id :: create("agnth",this);
    
  endfunction
  
endclass

// Top Module
module top;
  
  initial
    begin
      run_test("test");
    end
endmodule
  
// OUTPUT
# KERNEL: driver the value of data is  1317047967
