`timescale 1ns / 1ps
module fifo_status #(parameter PTR_WIDTH = 4)
(
input  logic [PTR_WIDTH-1:0] wr_ptr_gray_next,
input  logic [PTR_WIDTH-1:0] rd_ptr_gray_next,

input  logic [PTR_WIDTH-1:0] synced_rd_ptr_gray,
input  logic [PTR_WIDTH-1:0] synced_wr_ptr_gray,

output logic full_next,
output logic empty_next
);

always_comb begin
empty_next = (rd_ptr_gray_next == synced_wr_ptr_gray);

full_next = (wr_ptr_gray_next == {~synced_rd_ptr_gray[PTR_WIDTH-1:PTR_WIDTH-2],synced_rd_ptr_gray[PTR_WIDTH-3:0]});
end

endmodule
