`timescale 1ns/1ps
`include "src/fsk.v"

module fsk_tb;

initial
  begin
    $dumpfile("fsk_tb.vcd");
    $dumpvars(0,fsk_tb);
  end

reg rst = 0;
initial
  begin
    data_in = 0;
    # 20 rst = 1;
  end

reg clk = 1;
always #5 clk = ~clk;

always #2560 data_in = data_in + 1;

reg [15:0] data_in;
wire data_out;

fsk fsk(.clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out));

initial
  #100000 $finish;

endmodule
