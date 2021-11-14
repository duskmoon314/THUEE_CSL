module framer #(
         parameter HEADER = 6
       ) (
         input [11:0] data_in,
         output [15:0] data_out
       );

assign data_out = {HEADER, data_in};

endmodule
