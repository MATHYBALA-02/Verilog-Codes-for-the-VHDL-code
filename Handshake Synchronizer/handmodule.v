module double_flop_sync (
    input clk,
    input rst_n,
    input async_in,
    output wire sync_out
);
    reg [1:0] stages;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            stages <= 2'b0;
        end else begin
            stages <= {stages[0], async_in};
        end
    end
    assign sync_out = stages[1];
endmodule
