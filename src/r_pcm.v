/**
 # Module `r_pcm`
 
 This module decode 8 bits pcm code to 8 bits data
 
 ## Input
 
 - data_in: 8 bits pcm code
 
 ## Output
 
 - data_out: 13 bits data
 */

module r_pcm(
         input [7:0] data_in,
         output reg [12:0] data_out
       );

always @(*)
  begin
    case (data_in[6:4])
      3'b000:
        data_out <= {data_in[7], 7'b0, data_in[3:0], 1'b1};
      3'b001:
        data_out <= {data_in[7], 7'b1, data_in[3:0], 1'b1};
      3'b010:
        data_out <= {data_in[7], 6'b1, data_in[3:0], 2'b10};
      3'b011:
        data_out <= {data_in[7], 5'b1, data_in[3:0], 3'b100};
      3'b100:
        data_out <= {data_in[7], 4'b1, data_in[3:0], 4'b1000};
      3'b101:
        data_out <= {data_in[7], 3'b1, data_in[3:0], 5'b10000};
      3'b110:
        data_out <= {data_in[7], 2'b1, data_in[3:0], 6'b100000};
      3'b111:
        data_out <= {data_in[7], 1'b1, data_in[3:0], 7'b1000000};
    endcase
  end

endmodule
