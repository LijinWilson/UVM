class my_component extends uvm_component;

  // 1. Manually wrapping the class in the registry and creating a 'type_id'
  typedef uvm_component_registry #(my_component, "my_component") type_id;

  // 2. Creating a static function to get the singleton instance of the registry
  static function type_id get_type();
    return type_id::get();
  endfunction

  // 3. (Normally you also need a get_type_name function as well)
  virtual function string get_type_name();
    return "my_component";
  endfunction
endclass


// instead of 3 replacing all this with macros
// For a component
class my_component extends uvm_component;

// Component factory registration macro
  // class registering macros instead of that code in book code - 3
`uvm_component_utils(my_component)

// For a parameterized component
class my_param_component #(int ADD_WIDTH=20, int DATA_WIDTH=23) extends
  uvm_component;

typedef my_param_component #(ADD_WIDTH, DATA_WIDTH) this_t;

  // why we use the typedef inside the param_component
  /*
    If you tried to pass the full parameterized class directly into the macro without a typedef, it would look like this:
  */

// Parameterized component factory registration macro
`uvm_component_param_utils(this_t)

// For a class derived from an object (i.e. uvm_object, 
// uvm_transaction, uvm_sequence_item, uvm_sequence etc.)
class my_item extends uvm_sequence_item;

`uvm_object_utils(my_item)

// For a parameterized object class
class my_item #(int ADD_WIDTH=20, int DATA_WIDHT=20) extends
  uvm_sequence_item;

typedef my_item #(ADD_WIDTH, DATA_WIDTH) this_t;

`uvm_object_param_utils(this_t)


  // ------------------ SOME NOTES ---------------
  /*
  <<< "their constructors act like virtual methods with strict rules." what are this? >>>
  In UVM, when we say the constructors (new() functions) have "strict rules" or follow a "standard prototype", it means you are not allowed to pass whatever custom variables you want into the new() function like you normally can in standard SystemVerilog (e.g., you can't do function new(int address, int data);).

Because the UVM Factory automatically builds these classes in the background using a generic create() method, it needs to know exactly what arguments every single constructor expects. If every class had different constructor arguments, the factory wouldn't know how to build them!

Here are the strict rules you must follow when writing the new function for your UVM classes:

1. The Rule for Components (uvm_component)
Components (like agents, drivers, monitors, and scoreboards) represent the physical, static hierarchy of your testbench. Therefore, their constructor must always have exactly two arguments: a name and a parent.

Code snippet
// Standard prototype for a Component constructor
function new(string name = "my_component", uvm_component parent = null);
  super.new(name, parent);
endfunction
string name: The name of the instance in the UVM hierarchy.

uvm_component parent: A pointer to the parent component that is instantiating this one (this is what builds the UVM hierarchy tree).

2. The Rule for Objects (uvm_object / uvm_sequence_item)
Objects (like transactions, sequence items, or configurations) are dynamic and temporary. They are created, move through the testbench, and are destroyed. They do not have a fixed place in the testbench hierarchy, so they do not take a parent argument.

Code snippet
// Standard prototype for an Object constructor
function new(string name = "my_item");
  super.new(name);
endfunction
string name: Just the name of the object instance.

3. The Rule of Default Values
Notice in both examples above, the arguments have default values (e.g., name = "my_component" and parent = null).

This is mandatory for the factory's deferred construction. When the factory is getting ready to build an object, it needs to be able to call the constructor without explicitly passing arguments at the exact moment of instantiation. Providing default values allows the factory to safely construct the class in the background without throwing a compilation error about missing arguments.
  */

  /*
  <<<<<<<<< Why the slide says constructors "act like" virtual methods >>>>>>>>>>
There is a catch in SystemVerilog: Constructors (new() functions) cannot actually be declared as virtual.

Because of this, the slide carefully phrases it: "constructors are virtual methods... in the sense that their subclasses must use a specific constructor signature."

Here is what that means in the context of the UVM Factory:

The Factory Needs Uniformity: The whole point of the UVM Factory is that you can tell it to swap out (override) a base component (like a standard driver) with an advanced component (like an error-injecting driver) without changing your testbench code.

The Problem: When the factory goes to build that new advanced driver in the background, it has to call its new() constructor. If your advanced driver had a totally different set of arguments for its new() function than the base driver, the factory wouldn't know how to build it and the simulation would crash.

The "Virtual" Solution: To get around this, UVM forces a strict rule. Every single component must have the exact same constructor signature: function new(string name, uvm_component parent).

By forcing every child class to strictly copy the exact same constructor format as the parent class, it mimics the behavior of a virtual method. The factory can blindly call the generic creation mechanism, confident that whatever specific child class it is building will accept those standard arguments perfectly.
  */




  // constructor argumenst:
  // For a component:
class my_component extends uvm_component;

function new(string name = "my_component", uvm_component parent = null);
  super.new(name, parent);
endfunction

// For an object:
class my_item extends uvm_sequence_item;

function new(string name = "my_item");
  super.new(name);
endfunction



  // -----------------------------------------BIT REPLACE-----------------------------------------
  /*
    can explain the argument "bit_replace" with 0 and 1
The replace bit (which is the optional 4th argument in these override functions) acts as a tie-breaker. It tells the UVM Factory what to do if you try to override something that has already been overridden earlier in the code.

Here is exactly how it works with 1 and 0:

replace = 1 (The Overwrite Mode)
If you set the bit to 1 (which is the default behavior in UVM), it means "Force this new rule."

If a previous line of code already said, "Replace Base_driver with driver_1", and your new line of code says, "Replace Base_driver with driver_2 (with replace=1)"...

Result: The factory will overwrite the old rule. The final component built will be driver_2.

replace = 0 (The Safe Mode)
If you set the bit to 0, it means "Only apply this rule if no one else has touched this component."

If a previous line of code already said, "Replace Base_driver with driver_1", and your new line of code says, "Replace Base_driver with driver_2 (with replace=0)"...

Result: The factory sees that a rule already exists, so it completely ignores your new line of code. The final component built remains driver_1.
  */
  
