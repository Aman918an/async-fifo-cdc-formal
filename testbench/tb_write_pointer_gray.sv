`timescale 1ns / 1ps

module tb_write_pointer_gray;
logic rst_n,write_clk;
logic write_en,full;

logic [3:0] wr_ptr_bin;
logic [3:0] wr_ptr_gray;

write_pointer #(.PTR_WIDTH(4)) 
pointer (
.write_clk(write_clk),
.rst_n(rst_n),
.write_en(write_en),
.full(full),
.wr_ptr_bin(wr_ptr_bin)
);

bin_to_gray #(.WIDTH(4))
gray_converter(
.binary(wr_ptr_bin),
.gray(wr_ptr_gray)
);

initial begin
write_clk = 0;
forever #5 write_clk = ~write_clk;
end

initial begin
rst_n = 0;
write_en = 0;
full = 0;

#12;
rst_n = 1;

write_en = 1;
#50;

write_en = 0;

#20;

$finish;
end
endmodule
