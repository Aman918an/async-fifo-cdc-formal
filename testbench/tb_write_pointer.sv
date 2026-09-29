`timescale 1ns / 1ps

module tb_write_pointer;

logic write_clk;
logic rst_n;
logic write_en;
logic full;

logic [3:0] wr_ptr_bin;

write_pointer #(.PTR_WIDTH(4)) 
dut(
.write_clk(write_clk),
.rst_n(rst_n),
.write_en(write_en),
.full(full),
.wr_ptr_bin(wr_ptr_bin)
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

#10;

write_en = 1;
#30;

full = 1;
#20;

full = 0;
#10;

$finish;
end
endmodule
