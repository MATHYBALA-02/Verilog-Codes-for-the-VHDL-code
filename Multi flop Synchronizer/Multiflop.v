module synchronizer #(parameter STAGES = 2) (
  input clk,       // Clock
  input rstn,      // Synchronous reset
  input async_sig_i,  // Asynchronous signal in
  output reg sync_sig_o  // Synchronized signal out
);

reg [STAGES-1:0] flipflops;
(* ASYNC_REG = "true" *) 

always @(posedge clk) begin
  if (rstn == 0) begin
    flipflops <= 0;
  end else begin
    flipflops <= {flipflops[STAGES-2:0], async_sig_i};
  end
if(rstn==0)
begin
	sync_sig_o<=0;
end
else
begin
	sync_sig_o <= flipflops[STAGES-1];
end
end
endmodule
