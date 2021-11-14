/**
 # Module `fsk`
 
 This module generate 2-FSK signals from input 16 bits data.
 
 ## Notice
 
 Clock must be well concerned.
 
 The module generates a high frequency signal at `1` and a low frequency signal at `0`.
 
 ## Input
 
 - clk: clock used to generate different frequency signals
 - rst: reset signal
 - data_in [15:0]: 16 bits data frame
 
 ## Output
 
 - data_out: FSK signal
 */

module fsk(
         input clk,
         input rst,
         input [15:0] data_in,
         output reg data_out
       );

reg [3:0] cnt, i;

always @(posedge clk)
  begin
    if (~rst)
      begin
        data_out <= 0;
        i <= 15;
        cnt <= 0;
      end
    else
      begin
        if (cnt==15)
          begin
            i <= i - 1;
          end
        cnt <= cnt + 1;
      end
  end

always @(*)
  begin
    data_out <= data_in[i] ? clk : cnt[1];
  end

endmodule
