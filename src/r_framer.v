module r_framer #(
         parameter HEADER = 6
       ) (
         input clk,
         input rst,
         input data_in,
         output reg [11:0] data_out,
         output correct
       );

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b11;
parameter s3 = 2'b10;

reg [1:0] state;
reg [15:0] data;
reg [5:0] cnt;

always @(posedge clk)
  begin
    if (~rst)
      begin
        state <= s0;
        data <= 0;
        data_out <= 0;
        cnt <= 0;
      end
    else
      begin
        data <= {data[14:0], data_in};

        if (state == s0)
          begin
            if (data[15:12] == HEADER)
              begin
                cnt <= 0;
                state <= s1;
              end
            else
              begin
                cnt <= cnt + 1;
              end
          end
        else
          begin
            if (cnt >= 15)
              begin
                cnt <= 0;
                if (data[15:12] == HEADER)
                  begin
                    case (state)
                      s1:
                        state <= s2;
                      s2:
                        state <= s3;
                    endcase

                    data_out <= data[11:0];
                  end
                else
                  begin
                    state <= s0;
                    data_out <= 0;
                  end
              end
            else
              begin
                cnt <= cnt + 1;
              end
          end
      end
  end

assign correct = (state == s3);

endmodule
