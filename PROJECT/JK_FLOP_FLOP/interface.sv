interface intf(input logic clk);
	logic rst;
	logic j;
	logic k;
	logic q;
	wire q_bar;

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


//=======================================================================
// SYSTEMVERILOG ASSERTIONS (SVA) FOR JK FLIP-FLOP
//=======================================================================

// 1. Asynchronous Active-Low Reset Behavior
// Maps to RTL: if(!rst) begin q <= 0; end
// We use an immediate deferred assertion to ensure it checks correctly 
// after the non-blocking assignment (NBA) region updates 'q'.
always @(negedge rst) begin
  #1; // Wait 1 time unit cuz it will take some time for q to get update.
  ASSERT_ASYNC_RST: assert (q == 1'b0) else $error("FAIL: q did not reset to 0 on negedge rst");
end

// 2. Synchronous Hold Behavior (J=0, K=0)
// Maps to RTL: 2'b00: q <= q;
property p_hold;
  @(posedge clk) disable iff (!rst) // if reset pin is 0, abort this check even if j and k has some value.
  (!j && !k) |=> (q == $past(q));
endproperty
ASSERT_HOLD: assert property (p_hold) else $error("FAIL: Hold state broken (J=0, K=0)");

// 3. Synchronous Reset Behavior (J=0, K=1)
// Maps to RTL: 2'b01: q <= 0;
property p_sync_reset;
  @(posedge clk) disable iff (!rst)
  (!j && k) |=> (q == 1'b0);
endproperty
ASSERT_SYNC_RST: assert property (p_sync_reset) else $error("FAIL: Sync Reset broken (J=0, K=1)");

// 4. Synchronous Set Behavior (J=1, K=0)
// Maps to RTL: 2'b10: q <= 1;
property p_sync_set;
  @(posedge clk) disable iff (!rst)
  (j && !k) |=> (q == 1'b1);
endproperty
ASSERT_SYNC_SET: assert property (p_sync_set) else $error("FAIL: Sync Set broken (J=1, K=0)");

// 5. Synchronous Toggle Behavior (J=1, K=1)
// Maps to RTL: 2'b11: q <= ~q;
property p_toggle;
  @(posedge clk) disable iff (!rst)
  (j && k) |=> (q == ~$past(q));
endproperty
ASSERT_TOGGLE: assert property (p_toggle) else $error("FAIL: Toggle state broken (J=1, K=1)");

// 6. Continuous Complement Behavior (q_bar)
// Maps to RTL: assign q_bar = ~q;
// Evaluates on every clock edge to ensure continuous assignment holds true.
/* property p_q_bar_complement;
  @(posedge clk) 
  (q_bar == ~q);
endproperty
ASSERT_Q_BAR: assert property (p_q_bar_complement) else $error("FAIL: q_bar is not the complement of q"); */


endinterface
