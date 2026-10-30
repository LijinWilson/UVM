vsim -gui top
# End time: 16:36:55 on Oct 30,2026, Elapsed time: 0:01:31
# Errors: 1, Warnings: 0
# vsim -gui top 
# Start time: 16:36:55 on Oct 30,2026
# ** Note: (vsim-3813) Design is being optimized due to module recompilation...
# Loading sv_std.std
# Loading work.intf(fast)
# Loading mtiUvm.uvm_pkg
# Loading work.jk_pkg(fast)
# Loading work.top(fast)
# Loading mtiUvm.questa_uvm_pkg(fast)
# Loading C:/questasim64_10.7c/uvm-1.1d\win64\uvm_dpi.dll
run -all
# ----------------------------------------------------------------
# UVM-1.1d
# (C) 2007-2013 Mentor Graphics Corporation
# (C) 2007-2013 Cadence Design Systems, Inc.
# (C) 2006-2013 Synopsys, Inc.
# (C) 2011-2013 Cypress Semiconductor Corp.
# ----------------------------------------------------------------
# 
#   ***********       IMPORTANT RELEASE NOTES         ************
# 
#   You are using a version of the UVM library that has been compiled
#   with `UVM_NO_DEPRECATED undefined.
#   See http://www.eda.org/svdb/view.php?id=3313 for more details.
# 
#   You are using a version of the UVM library that has been compiled
#   with `UVM_OBJECT_MUST_HAVE_CONSTRUCTOR undefined.
#   See http://www.eda.org/svdb/view.php?id=3770 for more details.
# 
#       (Specify +UVM_NO_RELNOTES to turn off this notice)
# 
# UVM_INFO verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(215) @ 0: reporter [Questa UVM] QUESTA_UVM-1.2.3
# UVM_INFO verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(216) @ 0: reporter [Questa UVM]  questa_uvm::init(+struct)
# UVM_INFO @ 0: reporter [RNTST] Running test test...
# UVM_INFO driver.sv(30) @ 0: uvm_test_top.ev.agt.drv [driver] Starting UVM Driver RUN PHASE
# UVM_INFO driver.sv(47) @ 7: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# --------------------------------------------------------------------------------
# Name                           Type         Size  Value                         
# --------------------------------------------------------------------------------
# txn                            transaction  -     @684                          
#   j                            integral     1     'd0                           
#   k                            integral     1     1                             
#   rst                          integral     1     'd0                           
#   q                            integral     1     'd0                           
#   q_bar                        integral     1     'd0                           
#   begin_time                   time         64    0                             
#   end_time                     time         64    7                             
#   depth                        int          32    'd2                           
#   parent sequence (name)       string       5     reset                         
#   parent sequence (full name)  string       30    uvm_test_top.ev.agt.seqr.reset
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr      
# --------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 17: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# --------------------------------------------------------------------------------
# Name                           Type         Size  Value                         
# --------------------------------------------------------------------------------
# txn                            transaction  -     @713                          
#   j                            integral     1     1                             
#   k                            integral     1     1                             
#   rst                          integral     1     'd0                           
#   q                            integral     1     'd0                           
#   q_bar                        integral     1     'd0                           
#   begin_time                   time         64    7                             
#   end_time                     time         64    17                            
#   depth                        int          32    'd2                           
#   parent sequence (name)       string       5     reset                         
#   parent sequence (full name)  string       30    uvm_test_top.ev.agt.seqr.reset
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr      
# --------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 27: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# --------------------------------------------------------------------------------
# Name                           Type         Size  Value                         
# --------------------------------------------------------------------------------
# txn                            transaction  -     @721                          
#   j                            integral     1     'd0                           
#   k                            integral     1     1                             
#   rst                          integral     1     'd0                           
#   q                            integral     1     'd0                           
#   q_bar                        integral     1     'd0                           
#   begin_time                   time         64    17                            
#   end_time                     time         64    27                            
#   depth                        int          32    'd2                           
#   parent sequence (name)       string       5     reset                         
#   parent sequence (full name)  string       30    uvm_test_top.ev.agt.seqr.reset
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr      
# --------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 37: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=0
# --------------------------------------------------------------------------------
# Name                           Type         Size  Value                         
# --------------------------------------------------------------------------------
# txn                            transaction  -     @729                          
#   j                            integral     1     'd0                           
#   k                            integral     1     'd0                           
#   rst                          integral     1     'd0                           
#   q                            integral     1     'd0                           
#   q_bar                        integral     1     'd0                           
#   begin_time                   time         64    27                            
#   end_time                     time         64    37                            
#   depth                        int          32    'd2                           
#   parent sequence (name)       string       5     reset                         
#   parent sequence (full name)  string       30    uvm_test_top.ev.agt.seqr.reset
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr      
# --------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 47: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=0
# --------------------------------------------------------------------------------
# Name                           Type         Size  Value                         
# --------------------------------------------------------------------------------
# txn                            transaction  -     @737                          
#   j                            integral     1     1                             
#   k                            integral     1     'd0                           
#   rst                          integral     1     'd0                           
#   q                            integral     1     'd0                           
#   q_bar                        integral     1     'd0                           
#   begin_time                   time         64    37                            
#   end_time                     time         64    47                            
#   depth                        int          32    'd2                           
#   parent sequence (name)       string       5     reset                         
#   parent sequence (full name)  string       30    uvm_test_top.ev.agt.seqr.reset
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr      
# --------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 57: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# -----------------------------------------------------------------------------------
# Name                           Type         Size  Value                            
# -----------------------------------------------------------------------------------
# txn                            transaction  -     @745                             
#   j                            integral     1     1                                
#   k                            integral     1     'd0                              
#   rst                          integral     1     1                                
#   q                            integral     1     'd0                              
#   q_bar                        integral     1     'd0                              
#   begin_time                   time         64    47                               
#   end_time                     time         64    57                               
#   depth                        int          32    'd2                              
#   parent sequence (name)       string       8     jk_valid                         
#   parent sequence (full name)  string       33    uvm_test_top.ev.agt.seqr.jk_valid
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr         
# -----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 67: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=1
# -----------------------------------------------------------------------------------
# Name                           Type         Size  Value                            
# -----------------------------------------------------------------------------------
# txn                            transaction  -     @753                             
#   j                            integral     1     'd0                              
#   k                            integral     1     1                                
#   rst                          integral     1     1                                
#   q                            integral     1     'd0                              
#   q_bar                        integral     1     'd0                              
#   begin_time                   time         64    57                               
#   end_time                     time         64    67                               
#   depth                        int          32    'd2                              
#   parent sequence (name)       string       8     jk_valid                         
#   parent sequence (full name)  string       33    uvm_test_top.ev.agt.seqr.jk_valid
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr         
# -----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 77: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=1
# -----------------------------------------------------------------------------------
# Name                           Type         Size  Value                            
# -----------------------------------------------------------------------------------
# txn                            transaction  -     @761                             
#   j                            integral     1     'd0                              
#   k                            integral     1     1                                
#   rst                          integral     1     1                                
#   q                            integral     1     'd0                              
#   q_bar                        integral     1     'd0                              
#   begin_time                   time         64    67                               
#   end_time                     time         64    77                               
#   depth                        int          32    'd2                              
#   parent sequence (name)       string       8     jk_valid                         
#   parent sequence (full name)  string       33    uvm_test_top.ev.agt.seqr.jk_valid
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr         
# -----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 87: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# -----------------------------------------------------------------------------------
# Name                           Type         Size  Value                            
# -----------------------------------------------------------------------------------
# txn                            transaction  -     @769                             
#   j                            integral     1     1                                
#   k                            integral     1     'd0                              
#   rst                          integral     1     1                                
#   q                            integral     1     'd0                              
#   q_bar                        integral     1     'd0                              
#   begin_time                   time         64    77                               
#   end_time                     time         64    87                               
#   depth                        int          32    'd2                              
#   parent sequence (name)       string       8     jk_valid                         
#   parent sequence (full name)  string       33    uvm_test_top.ev.agt.seqr.jk_valid
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr         
# -----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 97: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=1
# -----------------------------------------------------------------------------------
# Name                           Type         Size  Value                            
# -----------------------------------------------------------------------------------
# txn                            transaction  -     @777                             
#   j                            integral     1     1                                
#   k                            integral     1     1                                
#   rst                          integral     1     1                                
#   q                            integral     1     'd0                              
#   q_bar                        integral     1     'd0                              
#   begin_time                   time         64    87                               
#   end_time                     time         64    97                               
#   depth                        int          32    'd2                              
#   parent sequence (name)       string       8     jk_valid                         
#   parent sequence (full name)  string       33    uvm_test_top.ev.agt.seqr.jk_valid
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr         
# -----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 107: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @785                            
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    97                              
#   end_time                     time         64    107                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 117: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @793                            
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    107                             
#   end_time                     time         64    117                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 127: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @801                            
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    117                             
#   end_time                     time         64    127                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 137: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @809                            
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    127                             
#   end_time                     time         64    137                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 147: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @817                            
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    137                             
#   end_time                     time         64    147                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 157: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @825                            
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    147                             
#   end_time                     time         64    157                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 167: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @833                            
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    157                             
#   end_time                     time         64    167                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 177: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @841                            
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    167                             
#   end_time                     time         64    177                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 187: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @849                            
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    177                             
#   end_time                     time         64    187                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 197: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @857                            
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    187                             
#   end_time                     time         64    197                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 207: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @865                            
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    197                             
#   end_time                     time         64    207                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 217: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @873                            
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    207                             
#   end_time                     time         64    217                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 227: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @881                            
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    217                             
#   end_time                     time         64    227                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 237: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @889                            
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    227                             
#   end_time                     time         64    237                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 247: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @897                            
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    237                             
#   end_time                     time         64    247                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 257: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @905                            
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    247                             
#   end_time                     time         64    257                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 267: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @913                            
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    257                             
#   end_time                     time         64    267                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 277: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @921                            
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    267                             
#   end_time                     time         64    277                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 287: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @929                            
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    277                             
#   end_time                     time         64    287                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 297: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @937                            
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    287                             
#   end_time                     time         64    297                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 307: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @945                            
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    297                             
#   end_time                     time         64    307                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 317: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @953                            
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    307                             
#   end_time                     time         64    317                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 327: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @961                            
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    317                             
#   end_time                     time         64    327                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 337: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @969                            
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    327                             
#   end_time                     time         64    337                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 347: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @977                            
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    337                             
#   end_time                     time         64    347                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 357: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @985                            
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    347                             
#   end_time                     time         64    357                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 367: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @993                            
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    357                             
#   end_time                     time         64    367                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 377: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1001                           
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    367                             
#   end_time                     time         64    377                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 387: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1009                           
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    377                             
#   end_time                     time         64    387                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 397: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1017                           
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    387                             
#   end_time                     time         64    397                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 407: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1025                           
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    397                             
#   end_time                     time         64    407                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 417: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1033                           
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    407                             
#   end_time                     time         64    417                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 427: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1041                           
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    417                             
#   end_time                     time         64    427                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 437: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1049                           
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    427                             
#   end_time                     time         64    437                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 447: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1057                           
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    437                             
#   end_time                     time         64    447                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 457: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1065                           
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    447                             
#   end_time                     time         64    457                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 467: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1073                           
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    457                             
#   end_time                     time         64    467                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 477: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1081                           
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    467                             
#   end_time                     time         64    477                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 487: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1089                           
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    477                             
#   end_time                     time         64    487                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 497: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1097                           
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    487                             
#   end_time                     time         64    497                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 507: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1105                           
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    497                             
#   end_time                     time         64    507                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 517: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1113                           
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    507                             
#   end_time                     time         64    517                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 527: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1121                           
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    517                             
#   end_time                     time         64    527                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 537: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=0 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1129                           
#   j                            integral     1     1                               
#   k                            integral     1     'd0                             
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    527                             
#   end_time                     time         64    537                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 547: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1137                           
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    537                             
#   end_time                     time         64    547                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 557: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1145                           
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    547                             
#   end_time                     time         64    557                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 567: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=0 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1153                           
#   j                            integral     1     'd0                             
#   k                            integral     1     'd0                             
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    557                             
#   end_time                     time         64    567                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 577: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=0 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1161                           
#   j                            integral     1     'd0                             
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    567                             
#   end_time                     time         64    577                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 587: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=1
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1169                           
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     1                               
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    577                             
#   end_time                     time         64    587                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO driver.sv(47) @ 597: uvm_test_top.ev.agt.drv [driver] Driven values to DUT: J=1 | K=1 | RST=0
# ----------------------------------------------------------------------------------
# Name                           Type         Size  Value                           
# ----------------------------------------------------------------------------------
# txn                            transaction  -     @1177                           
#   j                            integral     1     1                               
#   k                            integral     1     1                               
#   rst                          integral     1     'd0                             
#   q                            integral     1     'd0                             
#   q_bar                        integral     1     'd0                             
#   begin_time                   time         64    587                             
#   end_time                     time         64    597                             
#   depth                        int          32    'd2                             
#   parent sequence (name)       string       7     rand_jk                         
#   parent sequence (full name)  string       32    uvm_test_top.ev.agt.seqr.rand_jk
#   sequencer                    string       24    uvm_test_top.ev.agt.seqr        
# ----------------------------------------------------------------------------------
# UVM_INFO verilog_src/uvm-1.1d/src/base/uvm_objection.svh(1267) @ 597: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   65
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [Questa UVM]     2
# [RNTST]     1
# [TEST_DONE]     1
# [driver]    61
# ** Note: $finish    : C:/questasim64_10.7c/win64/../verilog_src/uvm-1.1d/src/base/uvm_root.svh(430)
#    Time: 597 ns  Iteration: 61  Instance: /top
# 1
# Break in Task uvm_pkg/uvm_root::run_test at C:/questasim64_10.7c/win64/../verilog_src/uvm-1.1d/src/base/uvm_root.svh line 430
