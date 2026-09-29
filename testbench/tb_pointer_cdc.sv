`timescale 1ns / 1ps
module tb_pointer_cdc;
logic read_clk,write_clk;
logic rst_n, full;
logic write_en;

logic [3:0] wr_ptr_bin;
logic [3:0] wr_ptr_gray;
logic [3:0] synced_wr_ptr_gray;

logic [3:0] wr_ptr_bin_next;
logic [3:0] wr_ptr_gray_next;
logic full_next;

logic read_en,empty;

logic [3:0] rd_ptr_bin;
logic [3:0] rd_ptr_gray;
logic [3:0] synced_rd_ptr_gray;

logic [3:0] rd_ptr_bin_next;
logic [3:0] rd_ptr_gray_next;
logic empty_next;


always_comb begin
empty_next = (rd_ptr_gray_next == synced_wr_ptr_gray);
end

always_comb begin
full_next = (wr_ptr_gray_next == {~synced_rd_ptr_gray[3:2], synced_rd_ptr_gray[1:0]});
end

always_ff @(posedge write_clk or negedge rst_n) begin
    if (!rst_n)
        full <= 1'b0;
    else
        full <= full_next;
end


always_ff @(posedge read_clk or negedge rst_n) begin
if (!rst_n)
    empty <= 1'b1;
else
    empty <= empty_next;
end


read_pointer #(.PTR_WIDTH(4)) pointer_read (
.read_clk(read_clk),
.rst_n(rst_n),
.read_en(read_en),
.empty(empty),
.rd_ptr_bin(rd_ptr_bin),
.rd_ptr_bin_next(rd_ptr_bin_next)
);

bin_to_gray #(.WIDTH(4)) gray_converter_read (
.binary(rd_ptr_bin),
.gray(rd_ptr_gray)
);

bin_to_gray #(.WIDTH(4)) gray_converter_read_next (
.binary(rd_ptr_bin_next),
.gray(rd_ptr_gray_next)
);

gray_pointer_sync #(.WIDTH(4)) sync_rd_to_wr (
.clk(write_clk),
.rst_n(rst_n),
.gray_in(rd_ptr_gray),
.gray_out(synced_rd_ptr_gray)
);



write_pointer #(.PTR_WIDTH(4))
pointer(
.write_clk(write_clk),
.rst_n(rst_n),
.write_en(write_en),
.full(full),
.wr_ptr_bin(wr_ptr_bin),
.wr_ptr_bin_next(wr_ptr_bin_next)
);

bin_to_gray #(.WIDTH(4))
gray_converter_write(
.binary(wr_ptr_bin),
.gray(wr_ptr_gray)
);

bin_to_gray #(.WIDTH(4))
gray_converter_write_next(
.binary(wr_ptr_bin_next),
.gray(wr_ptr_gray_next)
);

gray_pointer_sync #(.WIDTH(4))
sync_wr_to_rd(
.clk(read_clk),
.rst_n(rst_n),
.gray_in(wr_ptr_gray),
.gray_out(synced_wr_ptr_gray)
);

initial begin
write_clk = 0;
forever #5 write_clk = ~write_clk;
end

initial begin
read_clk = 0;
forever #7 read_clk = ~read_clk;
end

initial begin
rst_n = 0;

write_en = 0;
full = 0;

read_en = 0;
   
#12;
rst_n = 1;

#10;
write_en = 1;
read_en = 1;

#150;
write_en = 0;
read_en = 0;

#30;
$finish;
end

endmodule
