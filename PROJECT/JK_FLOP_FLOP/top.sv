`include "uvm_macros.svh"
`include "interface.sv"
`include "jk_pkg.sv"

module top();

	import uvm_pkg::*;
	import jk_pkg::*;
			
	bit clk = 0;
	
// Clock generation
	initial
		begin
		
			forever #5 clk = ~clk;
		end
	
// Passing Clock to Interface	
	intf inf(clk);
	
// instantiating the DUT and passing input via interface
	jk_ff tb1(inf.clk, inf.rst, inf.j, inf.k, inf.q, inf.q_bar);
	
// Run Test
	initial
		begin
			run_test("test");
		end
		
// Passing interface through DB
	initial
		begin
			uvm_config_db #(virtual intf) :: set(null, "*", "inf", inf);
		end
		
endmodule
	

	
	
	
		
		