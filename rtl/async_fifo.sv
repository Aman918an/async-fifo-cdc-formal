`timescale 1ns / 1ps
module async_fifo #(
parameter DATA_WIDTH = 8,
parameter ADDR_WIDTH = 3)
(
input logic write_clk,
input logic read_clk,
input logic rst_n,

input logic write_en,
input logic read_en,

input logic [DATA_WIDTH-1:0] write_data,
output logic [DATA_WIDTH-1:0] read_data,

output logic full,
output logic empty
);

localparam PTR_WIDTH = ADDR_WIDTH + 1;

// Binary pointers
logic [PTR_WIDTH-1:0] wr_ptr_bin;
logic [PTR_WIDTH-1:0] wr_ptr_bin_next;

logic [PTR_WIDTH-1:0] rd_ptr_bin;
logic [PTR_WIDTH-1:0] rd_ptr_bin_next;

// Gray pointers
logic [PTR_WIDTH-1:0] wr_ptr_gray;
logic [PTR_WIDTH-1:0] wr_ptr_gray_next;

logic [PTR_WIDTH-1:0] rd_ptr_gray;
logic [PTR_WIDTH-1:0] rd_ptr_gray_next;

// Synchronized Gray pointers
logic [PTR_WIDTH-1:0] synced_wr_ptr_gray;
logic [PTR_WIDTH-1:0] synced_rd_ptr_gray;

// Next-state status
logic full_next;
logic empty_next;

// Accepted memory operations
logic mem_write_en;
logic mem_read_en;

assign mem_write_en = write_en && !full;
assign mem_read_en  = read_en && !empty;

// FIFO memory addresses
logic [ADDR_WIDTH-1:0] write_addr;
logic [ADDR_WIDTH-1:0] read_addr;

assign write_addr = wr_ptr_bin[ADDR_WIDTH-1:0];
assign read_addr  = rd_ptr_bin[ADDR_WIDTH-1:0];


write_pointer #(.PTR_WIDTH(PTR_WIDTH)) 
write_pointer_inst (
.rst_n(rst_n),
.write_clk(write_clk),
.write_en(write_en),
.full(full),
.wr_ptr_bin(wr_ptr_bin),
.wr_ptr_bin_next(wr_ptr_bin_next)
);

read_pointer #(.PTR_WIDTH(PTR_WIDTH)) 
read_pointer_inst (
.read_clk(read_clk),
.rst_n(rst_n),
.read_en(read_en),
.empty(empty),
.rd_ptr_bin(rd_ptr_bin),
.rd_ptr_bin_next(rd_ptr_bin_next)
);

// Write pointer: current binary to Gray
bin_to_gray #(.WIDTH(PTR_WIDTH)) 
wr_gray_current (
.binary(wr_ptr_bin),
.gray(wr_ptr_gray)
);

// Write pointer: next binary to Gray
bin_to_gray #(.WIDTH(PTR_WIDTH)) 
wr_gray_next (
.binary(wr_ptr_bin_next),
.gray(wr_ptr_gray_next)
);

// Read pointer: current binary to Gray
bin_to_gray #(.WIDTH(PTR_WIDTH)) 
rd_gray_current (
.binary(rd_ptr_bin),
.gray(rd_ptr_gray)
);

// Read pointer: next binary to Gray
bin_to_gray #(.WIDTH(PTR_WIDTH)) 
rd_gray_next (
.binary(rd_ptr_bin_next),
.gray(rd_ptr_gray_next)
);


gray_pointer_sync #(.WIDTH(PTR_WIDTH)) 
wr_to_rd_sync (
.clk(read_clk),
.rst_n(rst_n),
.gray_in(wr_ptr_gray),
.gray_out(synced_wr_ptr_gray)
);

gray_pointer_sync #(.WIDTH(PTR_WIDTH)) 
rd_to_wr_sync (
.clk(write_clk),
.rst_n(rst_n),
.gray_in(rd_ptr_gray),
.gray_out(synced_rd_ptr_gray)
);

fifo_status #(.PTR_WIDTH(PTR_WIDTH)) 
status_inst (
.wr_ptr_gray_next(wr_ptr_gray_next),
.rd_ptr_gray_next(rd_ptr_gray_next),

.synced_rd_ptr_gray(synced_rd_ptr_gray),
.synced_wr_ptr_gray(synced_wr_ptr_gray),

.full_next(full_next),
.empty_next(empty_next)
);

// Empty flag: read clock domain
always_ff @(posedge read_clk or negedge rst_n) begin
if (!rst_n)
    empty <= 1'b1;
else
    empty <= empty_next;
end

// Full flag: write clock domain
always_ff @(posedge write_clk or negedge rst_n) begin
if (!rst_n)
    full <= 1'b0;
else
    full <= full_next;
end

fifo_memory #(
.DATA_WIDTH(DATA_WIDTH),
.ADDR_WIDTH(ADDR_WIDTH)
)
memory_inst (
.write_clk(write_clk),
.read_clk(read_clk),

.write_en(mem_write_en),
.read_en(mem_read_en),

.write_addr(write_addr),
.read_addr(read_addr),

.write_data(write_data),
.read_data(read_data)
);


endmodule
