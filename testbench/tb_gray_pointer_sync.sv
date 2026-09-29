`timescale 1ns / 1ps
module tb_gray_pointer_sync;
logic rst_n;
logic read_clk;
logic write_clk;

logic [3:0] gray_in;
logic [3:0] gray_out;

gray_pointer_sync #(.WIDTH(4))
dut(
.clk(read_clk),
.rst_n(rst_n),
.gray_in(gray_in),
.gray_out(gray_out)
);

initial begin
write_clk=0;
forever #5 write_clk=~write_clk;
end

initial begin
read_clk=0;
forever #7 read_clk=~read_clk;
end

initial begin
rst_n=0;
gray_in=4'b0000;

#12;
rst_n = 1;

@(posedge write_clk);
gray_in = 4'b0001;

@(posedge write_clk);
gray_in = 4'b0011;

@(posedge write_clk);
gray_in = 4'b0010;

@(posedge write_clk);
gray_in = 4'b0110;

#30;

$finish;

end


endmodule
