class base_packet extends uvm_object;
  
  int a,b;
  
  `uvm_object_utils(base_packet)
  
  function new(string name = "base_packet");
    
    super.new(name);
    
  endfunction
  
  // do_compare method for comparison
  function bit do_compare(uvm_object rhs,uvm_comparer comparer);
    base_packet bph;
    
    if(!($cast(bph,rhs)))
      retrun 0;
    
    return(this.a == bph.a &&
           this.b == bph.b);
    
  endfunction

  // do_print() method for print()
  // do_print method expext some argument, see in notes
  function void do_print(uvm_printer printer);
    printer.print_field("the value of a :",a,$bits(a),UVM_DEC);
    printer.print_field("the value of b : ",b,$bits(b),UVM_HEX);
  
  endfunction
  
endclass

module top;

  base_packet bph1, bph2;
  
  initial
    begin
      bph1 = base_packet :: type_id :: create("bph1");
      bph2 = base_packet :: type_id :: create("bph2");
      
      bph1.a = 10;
      bph1.b = 20;
      
      bph2.a = 10;
      bph2.b = 30;

      // printing using UVM print() method
      // u can pass argument inside print(), based on the style u need to see the print.
      // we have to define the do do_print() here.
      bph1.print(); 
      bph2.print();
      
      if(bph1.compare(bph2))
        $display("comparison sucess");
        
      else
        $display("comparision failed");
    end
endmodule
