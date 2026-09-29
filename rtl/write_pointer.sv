`timescale 1ns / 1ps

module write_pointer #(parameter PTR_WIDTH = 4)
(
input logic write_clk,
input logic rst_n,
input logic write_en,
input logic full,
output logic [PTR_WIDTH-1:0] wr_ptr_bin,
output logic [PTR_WIDTH-1:0] wr_ptr_bin_next
);

always_comb begin
wr_ptr_bin_next = wr_ptr_bin;

if(write_en && !full)
    wr_ptr_bin_next = wr_ptr_bin + 1'b1;
end


always_ff @(posedge write_clk or negedge rst_n) begin
if (!rst_n)
    wr_ptr_bin <= 0;
else
    wr_ptr_bin <= wr_ptr_bin_next;
end
endmodule
