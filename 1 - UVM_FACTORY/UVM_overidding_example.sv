
// ------------------------   difference between the key word new() in SV and create() in UVM ------------------------
/*
n standard SystemVerilog (SV), you create an object manually by directly calling its new() constructor.

Here is the direct comparison of how you create an object in standard SV versus how you do it in UVM:

1. The Standard SystemVerilog Way (Direct)
In normal SV, if you want to build an agent, you declare the handle and then immediately call new().

Code snippet
// 1. Declare the handle
base_agent my_agent; 

// 2. Build the object manually using new()
my_agent = new("my_agent", this); 
The Problem with new():
This is hardcoded. When the compiler sees new(), it will always build exactly a base_agent. If you realize later that you want to use the upgraded child_agent instead, you have to open up this exact file, delete the new() line, and rewrite the code to explicitly call the child's constructor.

2. The UVM Way (The Factory)
In UVM, we don't call new() directly. Instead, we ask the UVM Factory to build it for us using create().

Code snippet
// 1. Declare the handle
base_agent my_agent; 

// 2. Ask the factory to build the object
my_agent = base_agent::type_id::create("my_agent", this);
Why UVM does this:
When you call create(), the UVM Factory pauses and checks its rulebook (the overrides).

It asks itself: "The user asked for a base_agent. Did anyone set an override rule to swap this out for something else?"

If there is no rule, the factory quietly calls new() in the background and gives you the standard base_agent.

If there is a rule (like the global override he uses to replace base_agent with child_agent), the factory throws away the request for base_agent, quietly calls new() on the upgraded child_agent, and gives you that instead!

Summary
SystemVerilog uses new() to build objects immediately and permanently.

UVM uses create() to delegate the job to the factory, allowing you to swap (override) components dynamically without ever changing your original source code!

(Note: You still have to write the function new code inside your UVM classes—just like the speaker is doing in the video right now—because the factory still needs to call it in the background when it finally decides what to build!)
*/

`include "uvm_mcaros.svh";
import uvm_pkg::*;

// base driver
 // we are adding this on base_agent.
class base_driver extends uvm_driver;

  // registering the factory
  `uvm_component_utils(base_driver)
  
  function new(string name = "base_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// child driver1
class driver1 extends base_driver;

  // registering to factory
  `uvm_component_utils(driver1);

  function new(string name = "driver1", uvm_component parent)
    super.new(name, parent);
  endfunction
endclass

// child driver2
class driver2 extends base_driver;

  // registering to factory
  `uvm_component_utils(driver1);

  function new(string name = "driver2", uvm_component parent)
    super.new(name, parent);
  endfunction
endclass

// ----------- Agent - 2 -----------
class base_agent extends uvm_agent;
  
  `uvm_component_utils(base_agent);
  
  // creating the handle of base_driver;
  base_driver bdh;
  
  function new(string name = "base_agent",uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    bdh = base_driver :: type_id :: create("bdh", this)
  
endclass

// ---------- Agent-2 -----------
class child_agent extends base_agent;
  
  `uvm_component_utils(child_agent)
  
  function new(string name = "child_agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass

// ---------------------------------------------------------
// The Environment Class
// This acts as a container for your agents and other testbench components.
// ---------------------------------------------------------
class env extends uvm_env;
  
  // WHY WE USE THIS: Factory Registration. 
  // This macro registers the 'env' class with the UVM factory so the factory 
  // knows it exists and generates the background code needed to create it.
  `uvm_component_utils(env)
  
  // WHY WE USE THIS: Handle Declaration.
  // We need a pointer (handle) to the agent that will live inside this environment.
  base_agent bagent_h;
  
  // WHY WE USE THIS: Standard Constructor.
  // UVM requires this exact signature for components so the factory can build 
  // them dynamically in the background. 
  // (Note: The speaker accidentally typed 'parent' instead of '"env"' as the default name here, which he realizes and corrects a few seconds later!)
  function new(string name = parent, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  // WHY WE USE THIS: The Build Phase.
  // UVM executes phases in order. The build_phase is specifically used to 
  // construct all the child components (like agents, drivers, etc.) before the test runs.
  function void build_phase(uvm_phase phase);
    
    // WHY WE USE THIS: Factory Creation vs new().
    // Instead of saying `bagent_h = new(...)`, we ask the factory to create it.
    // If we apply an override in the test later, the factory will intercept this 
    // line and secretly build a 'child_agent' instead, without us having to change this code!
    bagent_h = base_agent::type_id::create("bagent_h", this);
    
    // WHY WE USE THIS: Super call.
    // It's good practice to call the parent class's build_phase so any underlying 
    // UVM base code executes properly.
    // this line is saying to add the base agent as agent
    super.build_phase(phase);
    
  endfunction
  
endclass

// ---------------------------------------------------------
// The Test Class
// This is the top-level UVM component. It controls the test scenario 
// and is where you typically configure the environment and apply overrides.
// ---------------------------------------------------------
class test extends uvm_test;

  // WHY WE USE THIS: Factory Registration.
  // We register the test class with the factory. This is critical because 
  // in the top module, we use run_test("test") to tell UVM to start here. 
  // UVM uses the factory to find this class by its string name and build it.
  `uvm_component_utils(test)

  // WHY WE USE THIS: Environment Handle.
  // We need a pointer to our environment class (which holds the agents and drivers).
  env envh;

  // WHY WE USE THIS: Standard Constructor.
  // Like all UVM components, this strict signature is required so the factory 
  // can build it dynamically when run_test() is called.
  function new(string name = "test",uvm_component parent);
    super.new(name,parent);
  endfunction

  // WHY WE USE THIS: The Build Phase.
  // This phase executes top-down. The test is built first, and here it builds 
  // the environment, which will then build the agents, and so on.
  function void build_phase(uvm_phase phase);
    
    // WHY WE USE THIS: Getting the Singleton Factory Instance.
    // He retrieves the global factory object here. In the video, he later uses 
    // this to call `factory.print()` so you can physically see the override rules 
    // in the simulation log.
    uvm_factory factory = uvm_factory :: get();
    
    // WHY WE USE THIS: Factory Creation.
    // We instantiate the environment using the factory instead of new().
    envh = env :: type_id :: create("envh",this);
    
    // WHY WE USE THIS: Call to parent build_phase.
    super.build_phase(phase);
    
    // ---------------------------------------------------------
    // THE CORE CONCEPT OF THE VIDEO: GLOBAL OVERRIDE
    // ---------------------------------------------------------
    // Scenarion - 1
    // set_type_override_by_type(base_agent :: get_type(),child_agent:: get_type()); // this is used for replacing the already assigned the base agent with child agent. 

    // Scenario - 2 
    // now we want to driver1(child driver) as the driver class instead the base driver already connected with the base driver
    // so now we comment scenario -1 code.
    // set_type_override_by_type(base_driver :: get_type(), driver1:: get_type());

    // Scenarion - 3
    // now agent change to base agent agent1 and now we overriding the driver of agent1 with driver1(child driver);
    // comment scenario - 2
    // //  envh.bagent_h is location the base agent
    // set_inst_override_by_type("envh.bagent_h", base_driver :: get_type(), driver1, get_type());

    // Scenarion - 4
    // now we are using the driver1 and driver2 as condition based. using ifdef concept.
// If we mention the DRV1 in compile option the DRV1 condition will run and for DRV2 thw DRV2 will run
    
    `ifdef DRV1
    set_type_override_by_type(base_driver :: get_type(), driver1 :: get_type());
    
    `elseif DRV2
    set_type_override_by_type(base_driver :: get_type(), driver2 :: get_type());
    
    `endif  

    
    factory.print();
    
  endfunction

endclass

module top;

  initial
    begin
      run_test("test");
    end
endmodule



// ----------- OUTPUT upto agent creation no driver is used --------------
# KERNEL: 
# KERNEL: Type Overrides:
# KERNEL: 
# KERNEL:   Requested Type  Override Type
# KERNEL:   --------------  -------------
# KERNEL:   base_agent      child_agent
# KERNEL: 
# KERNEL: All types registered with the factory: 120 total
# KERNEL:   Type Name
# KERNEL:   ---------
# KERNEL:   base_agent
# KERNEL:   child_agent
# KERNEL:   env
# KERNEL:   test
# KERNEL: (*) Types with no associated type name will be printed as <unknown>
# KERNEL: 
# KERNEL: ####
# KERNEL:

