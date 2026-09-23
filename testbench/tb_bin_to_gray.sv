`timescale 1ns / 1ps
module tb_bin_to_gray;

    logic [3:0] binary;
    logic [3:0] gray;

    bin_to_gray #(
        .WIDTH(4)
    ) dut (
        .binary(binary),
        .gray(gray)
    );

initial begin
for (int i = 0; i < 16; i++) begin
    binary = i;

    #1;  // allow combinational logic to settle
    if (gray !== (binary ^ (binary >> 1))) begin
        $error("Mismatch: binary=%b gray=%b expected=%b",
               binary,
               gray,
               (binary ^ (binary >> 1)));
    end

end

$display("All Gray-code conversions passed.");
$finish;

end
endmodule
