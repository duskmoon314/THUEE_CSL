`timescale 1ns/1ps
`include "src/top.v"

module top_tb;

initial
  begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0,top_tb);
  end

reg rst = 0;
initial
  begin
    # 100 rst = 1;
  end

reg clk = 1;
always #5 clk = ~clk;

wire [7:0] data_in;
wire [7:0] data_out;
wire [7:0] pcm_data;
wire [11:0] hamming_data;
wire [15:0] frame_data;
wire fsk_data;
wire r_fsk_data;
wire [11:0] r_frame_data;
wire frame_correct;
wire [7:0] r_hamming_data;
wire [12:0] r_pcm_data;

top top(
      .sys_clk(clk),
      .sys_rst(rst),
      .data_in(data_in),
      .data_out(data_out),
      .pcm_data(pcm_data),
      .hamming_data(hamming_data),
      .frame_data(frame_data),
      .fsk_data(fsk_data),
      .r_fsk_data(r_fsk_data),
      .r_frame_data(r_frame_data),
      .frame_correct(frame_correct),
      .r_hamming_data(r_hamming_data),
      .r_pcm_data(r_pcm_data)
    );

initial
  #1000000 $finish;

endmodule
