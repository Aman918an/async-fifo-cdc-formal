`timescale 1ns / 1ps
module tb_read_pointer;

logic read_clk;
logic rst_n;
logic read_en;
logic empty;
logic [3:0] rd_ptr_bin;

read_pointer #(.PTR_WIDTH(4)) 
dut(
.read_clk(read_clk),
.rst_n(rst_n),
.read_en(read_en),
.empty(empty),
.rd_ptr_bin(rd_ptr_bin)
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
#30;

empty = 1;
#20;

empty = 0;
#10;

$finish;
end
endmodule
