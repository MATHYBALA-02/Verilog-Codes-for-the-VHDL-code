module areset_sync_tb;

  // Declare the signals
  reg clk;
  reg async_rst_i;
  wire sync_rst_o;

  // Instantiate the DUT
  areset_sync_tb areset_sync (
    .clk(clk),
    .async_rst_i(async_rst_i),
    .sync_rst_o(sync_rst_o)
  );

  // Generate the clock signal
  always #5 clk = ~clk;
   // Initialize the input signals
  initial begin
	  clk=0;
    async_rst_i = 1;
    #10 async_rst_i = 0;
    #100 $finish;
  end

  // Monitor the output signal
  always @(posedge clk) begin
    $display("sync_rst_o = %b", sync_rst_o);
  end
 initial 
  begin
	  $dumpfile("reset.vcd");
	  $dumpvars(1);
  end
endmodule
