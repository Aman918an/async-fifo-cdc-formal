`timescale 1ns / 1ps
module tb_pointer_gray;
logic clk,rst_n,enable;
logic [2:0] binary_ptr;
logic [2:0] gray_ptr;

logic [2:0] previous_gray;

binary_counter #(.WIDTH(3)) 
counter (
.clk(clk),
.rst_n(rst_n),
.enable(enable),
.count(binary_ptr)
);

bin_to_gray #(.WIDTH(3)) 
converter (
.binary(binary_ptr),
.gray(gray_ptr)
);

initial begin
clk = 0;
forever #5 clk = ~clk;
end


initial begin
rst_n = 0;
enable = 0;
previous_gray = 0;

#12;
rst_n = 1;

#5;
enable = 1;

repeat (8) begin
    @(posedge clk);
    #1;
    if (!$onehot(previous_gray ^ gray_ptr))
        $display("FAILED: previous=%b current=%b",
                 previous_gray, gray_ptr);
    else
        $display("PASS: previous=%b current=%b",
                 previous_gray, gray_ptr);

    previous_gray = gray_ptr;

end
$finish;
end
endmodule
