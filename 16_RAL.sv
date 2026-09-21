// creating Register class
// UVM_REG is an object class, which is extended from uvm_reg
class ctrl_reg extends uvm_reg;
  // DECLARING FIELDS: USING "uvm_reg_field"
  // ctrl_reg has 3 fields, register architecture :- | status | mode | enable |;
  // we have declare all this three field using the data types :  uvm_reg_field, through this data type we are declaring all the field inside the register
  uvm_reg_field enable;
  uvm_reg_field mode;
  uvm_reg_field status;

  `uvm_object_utils(ctrl_reg)
  function new(string name = "ctrl_reg");
    // 32: size of the whole register
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build();
    // Creating the instance of enable class
    enable = uvm_reg_field::type_id::create("enable");
    // CONFIGURE the ENABLE field.
    enable.configure(
      this,           // parent register
      1,              // number of bits
      0,              // lsb position
      "RW",           // access type
      0,              // volatile
      0,              // reset value
      1,              // has reset
      0               // is random
    );

    // CREATING THE INSTANCE OF MODE
    mode = uvm_reg_field::type_id::create("mode");
    // CONFIGURING THE MODE
    mode.configure(this, 3, 1, "RW", 0, 0, 1, 0);

    // CREATING INSTANCE OF STATUS
    status = uvm_reg_field::type_id::create("status");
    // CONFIGURING STATUS
    status.configure(this, 4, 4, "RO", 1, 0, 1, 0);

    // >> IN FUTURE WE CAN ADD MORE FIELDS, IT IS NOT LIMITED

  endfunction

endclass
