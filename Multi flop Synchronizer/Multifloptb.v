module testbench;

reg clk, rstn, async_sig_i;
wire sync_sig_o;

synchronizer #(.STAGES(3)) dut (
  .clk(clk),
  .rstn(rstn),
  .async_sig_i(async_sig_i),
  .sync_sig_o(sync_sig_o)
);

initial begin
  clk = 0;
  forever #5 clk = ~clk;
end

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(1);
end

initial begin
  rstn = 0;
  async_sig_i = 0;
  #10 rstn = 1;
  #10 async_sig_i = 1;
  #20 async_sig_i = 0;
  #20 async_sig_i = 1;
  #20 async_sig_i = 0;
  #20 async_sig_i = 1;
  #20 async_sig_i = 0;
  #20 $finish;
end
endmodule
