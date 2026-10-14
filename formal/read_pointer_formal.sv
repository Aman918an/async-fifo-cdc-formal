module read_pointer_formal;
    (* gclk *) logic read_clk;
    (* anyseq *) logic rst_n;
    (* anyseq *) logic read_en;
    (* anyseq *) logic empty;

    logic [3:0] rd_ptr_bin;
    logic [3:0] rd_ptr_bin_next;

    read_pointer #(
        .PTR_WIDTH(4)
    ) dut (
        .read_clk(read_clk),
        .rst_n(rst_n),
        .read_en(read_en),
        .empty(empty),
        .rd_ptr_bin(rd_ptr_bin),
        .rd_ptr_bin_next(rd_ptr_bin_next)
    );

    // Property 1: Check combinational next-pointer logic.
    always_comb begin
        if (read_en && !empty)
            assert (rd_ptr_bin_next == rd_ptr_bin + 1'b1);
        else
            assert (rd_ptr_bin_next == rd_ptr_bin);
    end

    // Property 2: Check sequential pointer update.
    always @(posedge read_clk) begin
        if (!$initstate && rst_n && $past(rst_n))
            assert (rd_ptr_bin == $past(rd_ptr_bin_next));
    end

    // Property 3: Check that the pointer is zero during reset.
    always_comb begin
        if (!rst_n)
            assert (rd_ptr_bin == 0);
    end

    initial assume (!rst_n);
endmodule
