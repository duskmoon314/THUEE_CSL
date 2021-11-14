`timescale 1ns/1ps
`include "src/hamming.v"
`include "src/r_hamming.v"

module r_hamming_tb;

initial
  begin
    $dumpfile("r_hamming_tb.vcd");
    $dumpvars(0,r_hamming_tb);
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
wire [11:0] hamming_data;
wire [7:0] data_out;

hamming h(.data_in(data_in), .data_out(hamming_data));
r_hamming rh(.data_in(hamming_data), .data_out(data_out));

initial
  #10000 $finish;

endmodule
