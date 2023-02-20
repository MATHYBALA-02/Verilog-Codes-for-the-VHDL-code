module fb_sync_tb_1;

reg clkA;
reg clkB; 
reg resetA;
reg resetB;
reg inA;
wire outB;
wire outB_pulse;
wire busy;

fb_sync_1 DUT (
	clkA,
	clkB, 
	resetA,
	resetB,
	inA,
	outB,
	outB_pulse,
        busy
  );

always #5 clkA=~clkA;
always #10 clkB=~clkB;

initial
begin
clkA=1'b0; clkB=1'b0; resetA=1'b0; resetB=1'b0; inA=1'b0;
#50 resetA=1'b1; resetB=1'b1;
#45 inA=1'b1;
#20 inA=1'b0;
end
initial 
begin
$dumpfile("waveform.vcd");
$dumpvars;end

initial
  #700 $finish;

endmodule
