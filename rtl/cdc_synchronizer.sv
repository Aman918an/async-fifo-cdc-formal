`timescale 1ns / 1ps
module cdc_synchronizer(
input logic clk,rst_n,
input logic async_in,
output logic sync_out
    );

logic sync_ff1;
logic sync_ff2;    
    
always @(posedge clk or negedge rst_n) begin
if (!rst_n)begin
    sync_ff1 <= 1'b0;
    sync_ff2 <= 1'b0;    
end
else begin
    sync_ff1 <= async_in;
    sync_ff2 <= sync_ff1;
end
end

assign sync_out = sync_ff2;

endmodule
