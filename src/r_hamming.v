module r_hamming(
         input [11:0] data_in,
         output reg [7:0] data_out
       );

reg [3:0] cnt;
reg [11:0] data;

always @(*)
  begin
    cnt[3] <= data_in[11] ^ data_in[9] ^ data_in[7] ^ data_in[6] ^ data_in[3];
    cnt[2] <= data_in[11] ^ data_in[10] ^ data_in[8] ^ data_in[6] ^ data_in[5] ^ data_in[2];
    cnt[1] <= data_in[11] ^ data_in[10] ^ data_in[9] ^ data_in[7] ^ data_in[5] ^ data_in[4] ^ data_in[1];
    cnt[0] <= data_in[10] ^ data_in[8] ^ data_in[7] ^ data_in[4] ^ data_in[0];

    data <= data_in;

    case (cnt[3:0])
      4'b1110:
        begin
          data[11] <= ~data[11];
        end
      4'b0111:
        begin
          data[10] <= ~data[10];
        end
      4'b1010:
        begin
          data[9] <= ~data[9];
        end
      4'b0101:
        begin
          data[8] <= ~data[8];
        end
      4'b1011:
        begin
          data[7] <= ~data[7];
        end
      4'b1100:
        begin
          data[6] <= ~data[6];
        end
      4'b0110:
        begin
          data[5] <= ~data[5];
        end
      4'b0011:
        begin
          data[4] <= ~data[4];
        end
      4'b1000:
        begin
          data[3] <= ~data[3];
        end
      4'b0100:
        begin
          data[2] <= ~data[2];
        end
      4'b0010:
        begin
          data[1] <= ~data[1];
        end
      4'b0001:
        begin
          data[0] <= ~data[0];
        end
    endcase

    data_out <= data[11:4];

  end

endmodule
