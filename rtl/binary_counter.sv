`timescale 1ns / 1ps
module binary_counter #(parameter WIDTH=4)
(
    input logic clk,rst_n,
    input logic enable,
    output logic [WIDTH-1:0] count

    );
    
always_ff@(posedge clk or negedge rst_n) begin
if(!rst_n)
    count<=1'b0;
else if(enable)
    count<=count+1'b1;
end

endmodule
