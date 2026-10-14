module gray_pointer_sync_formal;
    (* gclk *) logic clk;
    (* anyseq *) logic rst_n;
    (* anyseq *) logic [3:0] gray_in;
    logic [3:0] gray_out;

    gray_pointer_sync #(
        .WIDTH(4)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .gray_in(gray_in),
        .gray_out(gray_out)
    );

    // Check that the output follows the two-stage pipeline.
    always @(posedge clk) begin
        if (!$initstate && rst_n && $past(rst_n) && $past(rst_n, 2))
            assert (gray_out == $past(gray_in, 2));
    end

    // Check that the output is zero while reset is active.
    always_comb begin
        if (!rst_n)
            assert (gray_out == 0);
    end

    initial assume (!rst_n);
endmodule
