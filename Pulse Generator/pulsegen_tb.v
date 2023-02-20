module pulse_generator_tb;
reg clk;
reg rstn;
wire pulse_o;
pulse_generator dut (
    .clk(clk),
    .rstn(rstn),
    .pulse_o(pulse_o)
);
  initial begin
		clk = 0;
    		rstn = 0;
		#50 rstn=1;
	end
	always
	#10 clk=~clk;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #200 $finish;
    end
endmodule
