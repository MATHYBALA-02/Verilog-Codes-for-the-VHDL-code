module pulse_generator (
    input clk,        
    input rstn,       
    output pulse_o );
parameter PERIOD = 4; 
reg pulse_rg;          
reg [7:0] count = 0;   
always @(posedge clk) begin
    if (~rstn) begin
        pulse_rg <= 1'b0;
        count <= 8'd0;
    end else begin
        if (count == PERIOD-1) begin
            count <= 8'd0;
            pulse_rg <= 1'b1;
        end else begin
            count <= count + 1;
            pulse_rg <= 1'b0;
        end
    end
end
assign pulse_o = pulse_rg;
endmodule
