module areset_sync #(parameter STAGES=2)(
  input clk,             // Clock
  input async_rst_i,     // Asynchronous Reset in
  output reg sync_rst_o // Synchronized Reset out
);

reg [STAGES-1:0] flipflops;

(* ASYNC_REG = "true" *) reg [STAGES-1:0] async_reg;

// Synchroniser process
always @(posedge clk) begin
  async_reg <= flipflops;
  flipflops <= {async_reg[STAGES-2:0], async_rst_i};
  sync_rst_o <= flipflops[STAGES-1];
end
endmodule
