/**
 # Module `hamming`
 
 This module encode 8 bits data to 12 bits hamming code
 
 ## Input
 
 - data_in: 8 bits data
 
 ## Output
 
 - data_out: 12 bits {data bits, parity bits}
 */

module hamming (
         input [7:0] data_in,
         output [11:0] data_out
       );

assign data_out[0]  = data_in[6] ^ data_in[4] ^ data_in[3] ^ data_in[0];
assign data_out[1]  = data_in[7] ^ data_in[6] ^ data_in[5] ^ data_in[3] ^data_in[1] ^ data_in[0];
assign data_out[2]  = data_in[7] ^ data_in[6] ^ data_in[4] ^ data_in[2] ^data_in[1];
assign data_out[3]  = data_in[7] ^ data_in[5] ^ data_in[3] ^ data_in[2];
assign data_out[11:4]  = data_in[7:0];

endmodule
