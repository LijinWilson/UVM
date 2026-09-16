// macros accept 2 argument
// 1)ARG: name of var, that var type must be similar with macros we used
// 2) FLAG: defintion down >
/*
Here is the definition of FLAG as seen in the video:

"When set to something other than UVM_DEFAULT or UVM_ALL_ON, it specifies which data method implementations will not be included. For example, if FLAG is set to NO_COPY, everything else will be implemented for the variable except copy."
*/
// some flag operator
// Flag	Description
// UVM_ALL_ON	All operations are turned on
// UVM_DEFAULT	Enables all operations and equivalent to UVM_ALL_ON
// UVM_NOCOPY	Do not copy the given variable
// UVM_NOCOMPARE	Do not compare the given variable
// UVM_NOPRINT	Do not print the given variable
// UVM_NOPACK	Do not pack or unpack the given variable
// UVM_REFERENCE	Operate only on handles, i.e. for object types, do not do deep copy, etc.


class packet extends uvm_object;
  
  rand int data;
  rand reg [3:0] addr;
  rand logic enable;

  // factory registeration
  `uvm_object_utils_begin(packet)

  // UVM macros
  `uvm_field_int(data,UVM_ALL_ON)
  `uvm_field_int(addr,UVM_NOCOPY)
  `uvm_field_int(enable,UVM_NOCOMPARE)
  
  `uvm_object_utils_end

  // constructor
  function new(string name = "packet");
    super.new(name);
  endfunction

  // display function
  function void display(string handle);
    $display("%s the value of data is %d and value of addr is %d and value of enable is %d",handle,data,addr,enable);
  endfunction
  
endclass

module test;

  packet p1_h,p2_h;
  
  initial
    begin
      p1_h = packet :: type_id :: create("p1_h");
      p2_h = packet :: type_id :: create("p2_h");

      // randomizing the p1_h;
      // for that we have make the property rand in class code.
      p1_h.randomize();
      
      p2_h.copy(p1_h);
      p1_h.display("p1_h");
      p2_h.display("p2_h");
    end
endmodule


// OUTPUT
// here the addr remain unchanged for p2_h becuase we make it no copy during the field macros defintion. -   `uvm_field_int(addr,UVM_NOCOPY);
# KERNEL: p1_h the value of data is   391572697 and value of addr is  3 and value of enable is 0
# KERNEL: p2_h the value of data is   391572697 and value of addr is  x and value of enable is 0



/*
. `uvm_field_int(addr, UVM_NOCOPY)
`uvm_field_int: This macro tells UVM, "Hey, I have an integer-type variable (like int, reg, bit, logic) that I want you to keep track of."

addr: This is the specific variable being registered.

UVM_NOCOPY: This is the restriction flag. It tells UVM: "When someone calls the copy() method on this object, copy everything else, but skip addr."

Result: If you copy packet_A to packet_B, packet_B will get all of packet_A's data, but packet_B.addr will be left untouched (it will just be 0 or whatever its default state is).

2. `uvm_field_int(enable, UVM_NOCOMPARE)
enable: The variable being registered.

UVM_NOCOMPARE: This tells UVM: "When someone calls the compare() method to check if two of these packets are identical, completely ignore the enable variable."

Result: If the Scoreboard compares packet_A and packet_B, and all their data matches perfectly but packet_A.enable = 1 and packet_B.enable = 0, the compare() function will still return 1 (True). It literally pretends the enable variable doesn't exist during the check.
*/
