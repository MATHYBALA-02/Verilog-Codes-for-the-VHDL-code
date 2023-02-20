module fb_sync_1 (
clkA,
clkB, 
resetA,
resetB,
inA,
outB,
outB_pulse,
busy
);

input  clkA;
input  clkB;
input  resetA;
input  resetB;
input  inA;
output outB;
output outB_pulse;
output busy;

reg outB_level;
reg inA_level,next_inA_level     ;
wire outB_pulse;
wire busy;
wire ack;

assign outB_pulse = outB & (!outB_level);
assign busy = inA_level || ack;

always @ (posedge clkB or negedge resetB)
begin
if(~resetB)
outB_level <= 1'b0;
else
outB_level <= outB;
end

wire   outB;

double_flop_sync OUTPUT_DFF (    //Instance 1 of double flop synchronizer
          .clk          (clkB),	
          .rst_n      (resetB),
          .async_in     (inA_level),	
          .sync_out     (outB)
);

double_flop_sync ACK_DFF (   //Instance 2 of double flop synchronizer
          .clk          (clkA),	
          .rst_n      (resetA),
          .async_in     (outB),	
          .sync_out     (ack)
);

always @(posedge clkA or negedge resetA)
begin
    if (!resetA)
    begin
         inA_level <=  1'b0;
    end
    else
    begin
        inA_level <=  next_inA_level;
    end
end

always @ (*)          
begin
       if (inA)
       begin
           next_inA_level = 1'b1 ;
       end
       else begin
       if (ack)
       begin
           next_inA_level = 1'b0 ;
       end
       else 
       begin
           next_inA_level = inA_level;
       end
       end 
end

endmodule
