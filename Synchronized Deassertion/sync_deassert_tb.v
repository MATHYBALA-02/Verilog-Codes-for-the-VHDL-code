module areset_deassert_sync_tb;
reg clk;
reg async_rst_i;
wire sync_rst_o;
parameter CLK_PERIOD = 10;
areset_deassert_sync dut (
  .clk(clk),
  .async_rst_i(async_rst_i),
  .sync_rst_o(sync_rst_o)
);
initial begin
  clk = 0;
  async_rst_i = 0;
  #100;
  async_rst_i = 1;
  #10;
  async_rst_i = 0;
  #10;
  async_rst_i = 1;
  #50;
  async_rst_i = 0;
  #100;
  $finish;
end
  always #(CLK_PERIOD/2) clk = ~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
