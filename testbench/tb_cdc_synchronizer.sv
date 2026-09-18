`timescale 1ns / 1ps
module tb_cdc_synchronizer;

logic clk, rst_n;
logic async_in;
logic sync_out;

cdc_synchronizer dut(
.clk(clk),
.rst_n(rst_n),
.async_in(async_in),
.sync_out(sync_out)
);

initial begin
clk=0;
forever #5 clk = ~clk;
end

initial begin

rst_n=0;
async_in=0;

#12;
rst_n=1;

#8;
async_in=1;

#17;
async_in=0;

#13;
async_in=1;

#21;
async_in=0;

#20;
$finish;
end

endmodule
