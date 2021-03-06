/**
 # Module `data_gen`
 
 This module generate 8 bits self-incrementing data
 
 
 ## Input
 
 - clk: the clock that controls data generation
 - rst: reset data to 0
 
 ## Output
 
 - data_out: 8 bits
 */

module data_gen (
         input clk,
         input rst,
         output reg [7:0] data_out
       );

always @(posedge clk)
  begin
    if (~rst)
      begin
        data_out <= 0;
      end
    else
      begin
        data_out <= data_out + 1;
      end
  end

endmodule
