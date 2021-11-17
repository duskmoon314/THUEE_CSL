/**
 # Module `pcm`
 
 This module encode 13 bits data to 8 bits pcm code
 
 ## Input
 
 - data_in: 13 bits data
 
 ## Output
 
 - data_out: 8 bits pcm code
 */

module pcm (
         input [12:0] data_in,
         output reg [7:0] data_out
       );

always @(*)
  begin
    casex (data_in[11:0])
      12'b1xxx_xxxx_xxxx:
        data_out <= {data_in[12], 3'b111, data_in[10:7]};
      12'b01xx_xxxx_xxxx:
        data_out <= {data_in[12], 3'b110, data_in[9:6]};
      12'b001x_xxxx_xxxx:
        data_out <= {data_in[12], 3'b101, data_in[8:5]};
      12'b0001_xxxx_xxxx:
        data_out <= {data_in[12], 3'b100, data_in[7:4]};
      12'b0000_1xxx_xxxx:
        data_out <= {data_in[12], 3'b011, data_in[6:3]};
      12'b0000_01xx_xxxx:
        data_out <= {data_in[12], 3'b010, data_in[5:2]};
      12'b0000_001x_xxxx:
        data_out <= {data_in[12], 3'b001, data_in[4:1]};
      12'b0000_000x_xxxx:
        data_out <= {data_in[12], 3'b000, data_in[4:1]};
      default:
        data_out <= 0;
    endcase
  end

endmodule
