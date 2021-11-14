`timescale 1ns/1ps
`include "src/framer.v"

module framer_tb;

initial
  begin
    $dumpfile("framer_tb.vcd");
    $dumpvars(0,framer_tb);
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

reg [11:0] data_in;
wire [15:0] data_out;

framer f(.data_in(data_in), .data_out(data_out));

initial
  #10000 $finish;

endmodule
