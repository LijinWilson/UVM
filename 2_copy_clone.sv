`include "uvm_macros.svh";
import uvm_pkg::*;

// creating a transaction class
class transaction extends uvm_object;

  // adding in factory;
  `uvm_object_utils(transaction);

  // adding property
  bit [3:0] addr;
  bit [7:0] data;

  // Adding the do_copy method for making copying action working, 
  // this will be automatically called when copy method is called.
  virtual function void do_copy(uvm_object rhs);

    // downcasting (explanation down)
    transaction t_h;
    $cast(t_h, rhs);
    
    this.addr = rhs.addr;
    this.data = rhs.data;
  endfunction

  // Defining virtual constructor
  function new(string name = "transaction");
    super.new(name);
  endfunction

  // display function 
  function void display(string message);
    $display("[%0s : the value of addr : %0d and the value of data : %0d", message, addr, data);
  endfunction
endclass


// Top module
module top();

  // creating two transaction handles;
  transaction t_h1, t_h2;

  initial
    begin
      // creating the instance/objects for t_h1 and t_h2 handles;
      t_h1 = transaction :: type_id :: create("t_h1");
      t_h2 = transaction :: type_id :: create("t_h2");

      // assigning values to the property
      t_h1.data = 50;
      t_h1.addr = 10;

      // copying the t_h2 to t_h1(calling copy method)
      t_h1.copy(t_h2);

      // Clone method
      // It doesnt require object creation.
      $cast(t_h2, t_h1.clone());

      // calling the display function from both handles t_h1 and t_h2;
      t_h1.display("t_h1");
      t_h2.display("t_h2");
    end
endmodule


// OUTPUT
// scenario - 1, as copy method is not working becuase do_copy method is not called
# KERNEL: [t_h1] : the value of addr : 10 and the value of data is 50
# KERNEL: [t_h2] : the value of addr : 0 and the value of data is 0

// Scenario - 2, as copy method working becuase do_copy method called
# KERNEL: [t_h1] : the value of addr : 10 and the value of data is 50
# KERNEL: [t_h2] : the value of addr : 10 and the value of data is 50





/*
---------------------------------- DOWN CASTING ----------------------------------
We use the $cast code here to perform what is called downcasting. This is absolutely required in UVM's do_copy method because of how Object-Oriented Programming works.

Here is exactly why we need it:

The Problem: Generic Handles
Because do_copy is a standard UVM function built into the base uvm_object class, its argument is strictly locked. It must accept the generic base type: uvm_object rhs (Right-Hand Side).

The problem is that a generic uvm_object handle is essentially blind to your custom variables. It has no idea that your addr or data variables exist.

If you tried to skip the cast and just write:

Code snippet
this.addr = rhs.addr; // ERROR!
The compiler would throw a fatal error saying: "I don't know what 'addr' is! This is just a generic uvm_object!"

The Solution: $cast
To get around this, we use $cast(t_h, rhs). Here is how it works step-by-step in your code:

Declare a specific handle: We create a local handle of our actual transaction type (transaction t_h;).

Perform the cast: $cast(t_h, rhs) tells the simulator, "Hey, I know this rhs object is hiding behind a generic mask, but I promise it's actually a transaction object underneath. Please convert it and attach it to my t_h handle."

Access the variables safely: Now that t_h is pointing to the object, the compiler recognizes it as a full transaction. It allows us to safely look inside and copy the variables using t_h.addr and t_h.data
*/

  
