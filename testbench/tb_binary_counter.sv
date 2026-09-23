`timescale 1ns / 1ps
module tb_binary_counter;

    logic clk,rst_n,enable;
    logic [3:0] count;
    
binary_counter #(.WIDTH(4)) 
dut(
.clk(clk),
.rst_n(rst_n),
.enable(enable),
.count(count)
);

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin

rst_n = 0;
enable = 0;

#12;
rst_n = 1;

#10;
enable = 1;

#50;
enable = 0;

#20;
enable = 1;
    
#150;
$finish;

end
endmodule
