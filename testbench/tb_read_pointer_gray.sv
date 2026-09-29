`timescale 1ns / 1ps
module tb_read_pointer_gray;
logic rst_n,read_clk;
logic read_en,empty;

logic [3:0] rd_ptr_bin;
logic [3:0] rd_ptr_gray;

read_pointer #(.PTR_WIDTH(4)) 
pointer (
.read_clk(read_clk),
.rst_n(rst_n),
.read_en(read_en),
.empty(empty),
.rd_ptr_bin(rd_ptr_bin)
);

bin_to_gray #(.WIDTH(4))
gray_converter(
.binary(rd_ptr_bin),
.gray(rd_ptr_gray)
);

initial begin
read_clk = 0;
forever #5 read_clk = ~read_clk;
end

initial begin
rst_n = 0;
read_en = 0;
empty = 0;

#12;
rst_n = 1;

#10;
read_en = 1;

#50;

read_en = 0;

#20;

$finish;
end
endmodule
