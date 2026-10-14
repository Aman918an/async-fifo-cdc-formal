module write_pointer_formal;

    (* gclk *) logic write_clk;
    (* anyseq *) logic rst_n;
    (* anyseq *) logic write_en;
    (* anyseq *) logic full;

    logic [3:0] wr_ptr_bin;
    logic [3:0] wr_ptr_bin_next;

    write_pointer #(.PTR_WIDTH(4)) 
    dut (
        .write_clk(write_clk),
        .rst_n(rst_n),
        .write_en(write_en),
        .full(full),
        .wr_ptr_bin(wr_ptr_bin),
        .wr_ptr_bin_next(wr_ptr_bin_next)
    );

    // Check the combinational next-pointer logic.
    always_comb begin
        if (write_en && !full)
            assert (wr_ptr_bin_next == wr_ptr_bin + 1'b1);
        else
            assert (wr_ptr_bin_next == wr_ptr_bin);
    end

    // Assume reset is active initially.
    initial assume (!rst_n);


    // Check sequential pointer update on each rising clock edge.
    always @(posedge write_clk) begin
        if (!$initstate && rst_n && $past(rst_n))
            assert (wr_ptr_bin == $past(wr_ptr_bin_next));
    end

    // Check that the pointer is zero whenever reset is active.
    always_comb begin
        if (!rst_n)
            assert (wr_ptr_bin == 0);
    end
endmodule
