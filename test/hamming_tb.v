`timescale 1ns/1ps
`include "src/hamming.v"

module hamming_tb;

initial
  begin
    $dumpfile("hamming_tb.vcd");
    $dumpvars(0,hamming_tb);
  end

reg rst = 0;
initial
  begin
    data_in = 0;
    # 20 rst = 1;
  end

reg clk = 1;
always #5 clk = ~clk;

always @(posedge clk )
  begin
    data_in <= data_in + 1;
  end

reg [7:0] data_in;
wire [11:0] data_out;

hamming h(.data_in(data_in), .data_out(data_out));

initial
  #10000 $finish;

endmodule
