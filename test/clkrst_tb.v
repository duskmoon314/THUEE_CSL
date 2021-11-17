`timescale 1ns/1ps
`include "src/clkrst.v"

module clkrst_tb;

initial
  begin
    $dumpfile("clkrst_tb.vcd");
    $dumpvars(0,clkrst_tb);
  end

reg rst = 0;
initial
  begin
    # 20 rst = 1;
  end

reg clk = 1;
always #5 clk = ~clk;

wire clk_2, clk_32, clk_512;

clkrst #(.OFFSET(5)) cs(.clk(clk), .rst(rst), .clk_2(clk_2), .clk_32(clk_32), .clk_512(clk_512));

initial
  #5000000 $finish;

endmodule
