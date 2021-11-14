`timescale 1ns/1ps
`include "src/data_gen.v"

module data_gen_tb;

initial
  begin
    $dumpfile("data_gen_tb.vcd");
    $dumpvars(0,data_gen_tb);
  end

reg rst = 0;
initial
  begin
    # 20 rst = 1;
  end

reg clk = 1;
always #5 clk = ~clk;

wire [7:0] data_out;

data_gen dg(.clk(clk), .rst(rst), .data_out(data_out));

initial
  #1000 $finish;

endmodule
