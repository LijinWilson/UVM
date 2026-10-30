interface intf(input logic clk);
	logic rst;
	logic j;
	logic k;
	logic q;
	logic q_bar;

//=====================================
// CLOCKING BLOCK
//=====================================

// Driver Clocking
clocking drv_cb @(posedge clk);
	default input #1 output #1; // Skew
	output rst, j, k;
	input q, q_bar;
endclocking

// Monitor Clocking
clocking mon_cb @(posedge clk);
	default input #1 output #1; //Skew
	input rst, j, k, q, q_bar;
endclocking

//=====================================
// MODPORT
//=====================================
modport DRIVER(clocking drv_cb, input clk); // Driver Modport
modport MONITOR(clocking mon_cb, input clk);  // Monitor Modport


endinterface