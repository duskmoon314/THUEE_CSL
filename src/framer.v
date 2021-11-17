/**
 # Module `framer`
 
 This module adds `HEADER` in front of data to form a frame
 
 ## Input
 
 - data_in: 12 bits data
 
 ## Output
 
 - data_out: 16 bits {HEADER, data_in}
 */

module framer #(
         parameter HEADER = 6
       ) (
         input [11:0] data_in,
         output [15:0] data_out
       );

assign data_out = {HEADER, data_in};

endmodule
