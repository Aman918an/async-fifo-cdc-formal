`timescale 1ns / 1ps
module fifo_memory #(
parameter DATA_WIDTH = 8,
parameter ADDR_WIDTH = 3)
(
input logic write_clk, read_clk,
input logic write_en, read_en,

input logic [ADDR_WIDTH-1:0] write_addr,
input logic [ADDR_WIDTH-1:0] read_addr,

input logic [DATA_WIDTH-1:0] write_data,
output logic [DATA_WIDTH-1:0] read_data

);

logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

always_ff @(posedge write_clk) begin
if(write_en)
    mem[write_addr] <= write_data;
end

always_ff @(posedge read_clk) begin
if(read_en)
    read_data <= mem[read_addr];
end
endmodule
