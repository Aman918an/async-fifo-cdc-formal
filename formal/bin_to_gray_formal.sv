module bin_to_gray_formal;
    (* anyconst *) logic [3:0] binary;
    logic [3:0] gray;

    bin_to_gray #(
        .WIDTH(4)
    ) dut (
        .binary(binary),
        .gray(gray)
    );

    // Check the binary-to-Gray conversion for every possible input.
    always_comb begin
        assert (gray == (binary ^ (binary >> 1)));
    end
endmodule
