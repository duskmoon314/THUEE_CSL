module r_fsk(
         input clk,
         input rst,
         input data_in,
         output reg data_out
       );

reg [3:0] cnt;
reg flag;

// count data_in times when clk == 1
always @(posedge data_in)
  begin
    if (~rst)
      begin
        cnt <= 0;
      end
    else
      begin
        if (clk)
          begin
            cnt <= cnt + 1;
          end
        else
          begin
            cnt <= 0;
          end
      end
  end

// save and output cnt result at negedge
always @(negedge clk)
  begin
    data_out <= cnt > 4 ? 1 : 0;
  end

endmodule
