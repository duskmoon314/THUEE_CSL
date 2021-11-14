`timescale 1ns/1ps
`include "src/fsk.v"
`include "src/r_fsk.v"

module r_fsk_tb;

initial
  begin
    $dumpfile("r_fsk_tb.vcd");
    $dumpvars(0,r_fsk_tb);
  end

reg rst = 0;
initial
  begin
    data_in = 0;
    # 20 rst = 1;
  end

reg clk = 1;
always #5 clk = ~clk;

reg clk_16 = 1;
always #80 clk_16 = ~clk_16;

always #2560 data_in = data_in + 1;

reg [15:0] data_in;
wire fsk_data, data_out;

fsk fsk(.clk(clk), .rst(rst), .data_in(data_in), .data_out(fsk_data));
r_fsk r_fsk(.clk(clk_16), .rst(rst), .data_in(fsk_data), .data_out(data_out));

initial
  #100000 $finish;

endmodule
