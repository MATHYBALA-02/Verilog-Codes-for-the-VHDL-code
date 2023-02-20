module clock_divider (
    input  wire        clk,        
    input  wire        rstn,       
    output reg         clk_o       
);
parameter DV = 4;
reg   clk_rg        ;              
reg   [3:0] count  ;              
always @(posedge clk) begin
   if (rstn == 1'b0) begin 
         clk_rg <= 1'b0;
         count  <= 4'h0;
      end else begin    
         if (count == (DV/2)-1) begin
            count  <= 4'h0;
            clk_rg <= ~clk_rg;
         end else begin
            count  <= count + 4'h1;
     end                     
      end
end
assign clk_o = clk_rg;  //Clock out
endmodule
