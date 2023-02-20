module clock_gating_tb;
  reg clk_i;
  reg en_i;
  wire clk_o;
  clock_gating uut(clk_i,en_i,clk_o);
  initial
    begin
      $dumpfile("clkg.vcd");
      $dumpvars(1,clock_gating_tb);
    end
  always #5 clk_i=~clk_i;
  initial
    begin
      $monitor("time=%t,clk_i=%b,en_i=%b,clk_o=%b",$time,clk_i,en_i,clk_o);
      en_i=0;clk_i=0;
      #8 en_i=1;
      #9 en_i=0;
      #20$finish;
    end
endmodule
