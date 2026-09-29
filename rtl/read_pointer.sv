`timescale 1ns / 1ps

module read_pointer #(parameter PTR_WIDTH=4)
(
input logic read_clk,
input logic rst_n,
input logic read_en,
input logic empty,
output logic [PTR_WIDTH-1:0] rd_ptr_bin,
output logic [PTR_WIDTH-1:0] rd_ptr_bin_next
);

always_comb begin
rd_ptr_bin_next = rd_ptr_bin;

if(read_en && !empty)
    rd_ptr_bin_next = rd_ptr_bin + 1'b1;
    
end

always_ff @(posedge read_clk or negedge rst_n) begin
if (!rst_n)
    rd_ptr_bin <= 0;
else 
    rd_ptr_bin <= rd_ptr_bin_next;
end
endmodule
