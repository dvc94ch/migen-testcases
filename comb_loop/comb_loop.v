`default_nettype none
`include "comb_loop_migen.v"

module top_nb(input sys_clk, output reg a, output reg b, output reg c);

   always @(*) begin
      a <= ~sys_clk;
      b <= c;
   end

   always @(*) begin
      if (a) c <= 1'd0;
      else c <= 1'd1;
   end

endmodule // top

module top_b(input sys_clk, output reg a, output reg b, output reg c);

   always @(*) begin
      a = ~sys_clk;
      b = c;
   end

   always @(*) begin
      if (a) c = 1'd0;
      else c = 1'd1;
   end

endmodule // top

module top_b_verilator(input sys_clk, output a, output b, output c);

   assign a = ~sys_clk;
   assign b = c;
   assign c = a ? 1'd0 : 1'd1;

endmodule // top_b_verilator

`ifndef SYNTHESIS
`ifndef VERILATOR
module bench();
   reg clk;

   top dut(.sys_clk(clk));
   top_b dut_b(.sys_clk(clk));
   top_nb dut_nb(.sys_clk(clk));
   top_b_verilator dut_b_verilator(.sys_clk(clk));

   initial begin
      $dumpfile("comb_loop.vcd");
      $dumpvars;
   end

   initial begin
      clk = 0;
      #100 $finish;
   end

   always begin
      #5 clk = ~clk;
   end

endmodule
`endif //  `ifndef VERILATOR
`endif //  `ifndef SYNTHESIS
