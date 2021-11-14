/**
 # Module `clkrst`
 
 > author: duskmoon (Campbell He)
 
 This module generate `clock` and `reset` signals for latter modules
 
 ## Notice
 
 In the implementation of this module, the system clock frequency used for the experiment is 60 MHz.
 
 ## Input
 
 - clk: system clock 60 MHz
 - rst: system reset signal
    - It seems that we have no more than one switch to use
 
 ## Output
 
 - clk_2: clock that divides clk by 2
 - clk_32: clock that divides clk by 32
 - clk_512: clock that divides clk by 512
 */

module clkrst (
         input clk,
         input rst,
         output reg clk_2,
         output reg clk_32,
         output reg clk_512,
         output reset
       );

reg [8:0] cnt;

always @(posedge clk)
  begin
    if (~rst)
      begin
        cnt <= 0;
        clk_2 <= 1;
        clk_32 <= 1;
        clk_512 <= 1;
      end
    else
      begin
        cnt <= cnt + 1;
        clk_2 <= ~cnt[0];
        clk_32 <= ~cnt[4];
        clk_512 <= ~cnt[8];
      end
  end

assign reset = rst;

endmodule
