`timescale 1ns/1ps
`include "src/framer.v"
`include "src/r_framer.v"

module r_framer_tb;

initial
  begin
    $dumpfile("r_framer_tb.vcd");
    $dumpvars(0,r_framer_tb);
  end

reg rst = 0;
initial
  begin
    data_in = 0;
    idx = 15;
    # 20 rst = 1;
  end

reg clk = 1;
always #5 clk = ~clk;

always #160 data_in = data_in + 1;
always #10 idx = idx - 1;

reg [11:0] data_in;
wire [15:0] frame_data;
wire [11:0] data_out;
reg [3:0] idx;
wire correct;

framer f(.data_in(data_in), .data_out(frame_data));
r_framer rf(.clk(clk), .rst(rst), .data_in(frame_data[idx]), .data_out(data_out), .correct(correct));

initial
  #10000 $finish;

endmodule
