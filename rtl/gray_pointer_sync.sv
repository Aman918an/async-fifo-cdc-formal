`timescale 1ns / 1ps
module gray_pointer_sync #(parameter WIDTH=4)
(
input logic clk, rst_n,
input logic [WIDTH-1:0] gray_in,
output logic [WIDTH-1:0] gray_out
    );
    
logic [WIDTH-1:0] sync_ff1;

always_ff@(posedge clk or negedge rst_n) begin
if(!rst_n) begin
    sync_ff1<=0;
    gray_out<=0;
end
else begin
    sync_ff1<=gray_in;
    gray_out<=sync_ff1;
end
end
endmodule
