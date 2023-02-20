module toggle_sync
#(
    parameter re_edge = 1,
    parameter sync_size = 3
)
(
    input clk_a,
    input sig_a,
    input clk_b,
    output sig_b
);

    wire fast_event;
    reg q = 0;

  reg  [sync_size-1:0]capture_reg = 0;

   
     assign fast_event = (sig_a == 1'b1) ? ~q : q;
  assign sig_b = capture_reg[sync_size-1] ^ capture_reg[sync_size-2];

    
  always @(posedge clk_a) begin
        if (re_edge == 1'b1) begin
                q <= fast_event;
        end
    end

    always @(posedge clk_b) begin
        if (re_edge == 1'b1) begin
                capture_reg <= {capture_reg[sync_size-2:0], q};
        end
    end
endmodule
