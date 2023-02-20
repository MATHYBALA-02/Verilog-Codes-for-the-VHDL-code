module toggle_tb();
  reg clk_a;
  reg clk_b;
  reg sig_a;
  wire sig_b;
  toggle_sync ts(.clk_a(clk_a),.sig_a(sig_a),.clk_b(clk_b),.sig_b(sig_b));
  always #5 clk_a=~clk_a;
  always #10 clk_b=~clk_b;
  initial
    begin
       clk_a=0;
       clk_b=0;
       sig_a=0;
      #3 sig_a=1;
      #10 sig_a=1;
      #100 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  endmodule
