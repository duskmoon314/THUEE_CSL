/**
 # Module TOP
 */

/***** Include Modules *****/
// These lines are used for simulation with iverilog
// Need to be deleted in Quartus
`include "src/clkrst.v"
`include "src/data_gen.v"
`include "src/pcm.v"
`include "src/hamming.v"
`include "src/framer.v"
`include "src/fsk.v"
`include "src/r_fsk.v"
`include "src/r_framer.v"
`include "src/r_hamming.v"
`include "src/r_pcm.v"
/***************************/

module top (
         input sys_clk,
         input sys_rst,
         output wire [7:0] data_in,
         output wire [7:0] data_out,
         output wire [7:0] pcm_data,
         output wire [11:0] hamming_data,
         output wire [15:0] frame_data,
         output wire fsk_data,
         output wire r_fsk_data,
         output wire [11:0] r_frame_data,
         output wire frame_correct,
         output wire [7:0] r_hamming_data,
         output wire [12:0] r_pcm_data
       );

wire clk_2, clk_32, clk_512, rst;
parameter HEADER = 6;

clkrst cr(
         .clk(sys_clk), .rst(sys_rst),
         .clk_2(clk_2), .clk_32(clk_32), .clk_512(clk_512),
         .reset(rst)
       );

data_gen dg(.clk(clk_512), .rst(rst), .data_out(data_in));

pcm pcm(.data_in({data_in, 5'b0}), .data_out(pcm_data));
hamming h(.data_in(pcm_data), .data_out(hamming_data));
framer #(.HEADER(HEADER))
       f(.data_in(hamming_data), .data_out(frame_data));
fsk fsk(
      .clk(clk_2), .rst(rst),
      .data_in(frame_data), .data_out(fsk_data)
    );

r_fsk r_fsk(
        .clk(clk_32), .rst(rst),
        .data_in(fsk_data), .data_out(r_fsk_data)
      );
r_framer #(.HEADER(HEADER))
         r_f(
           .clk(clk_32), .rst(rst),
           .data_in(r_fsk_data),
           .data_out(r_frame_data), .correct(frame_correct)
         );
r_hamming r_h(.data_in(r_frame_data), .data_out(r_hamming_data));
r_pcm r_pcm(.data_in(r_hamming_data), .data_out(r_pcm_data));

assign data_out = r_pcm_data[12:5];

endmodule
