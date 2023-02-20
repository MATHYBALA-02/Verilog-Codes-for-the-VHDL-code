module clock_divider_tb;
reg clk;
reg rstn;
wire clk_o;
clock_divider dut (
  .clk(clk),
  .rstn(rstn),
  .clk_o(clk_o)
);
// Clock generator
initial begin
		clk = 0;
		rstn = 0;
		#50 rstn=1;
	end
	always
	#10 clk=~clk;
	initial 
	#100 $finish;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
