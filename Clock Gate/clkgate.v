module clock_gating(clk_i,en_i,clk_o);
  input clk_i;
  input en_i;
  reg en_latched;
  output  clk_o;
  always@(negedge clk_i)
    assign en_latched=en_i;
  assign clk_o=en_latched&&clk_i;
endmodule
