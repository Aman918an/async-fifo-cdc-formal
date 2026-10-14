module fifo_status_formal;
    (* anyconst *) logic [3:0] wr_ptr_gray_next;
    (* anyconst *) logic [3:0] rd_ptr_gray_next;
    (* anyconst *) logic [3:0] synced_rd_ptr_gray;
    (* anyconst *) logic [3:0] synced_wr_ptr_gray;

    logic full_next;
    logic empty_next;

    fifo_status #(
        .PTR_WIDTH(4)
    ) dut (
        .wr_ptr_gray_next(wr_ptr_gray_next),
        .rd_ptr_gray_next(rd_ptr_gray_next),
        .synced_rd_ptr_gray(synced_rd_ptr_gray),
        .synced_wr_ptr_gray(synced_wr_ptr_gray),
        .full_next(full_next),
        .empty_next(empty_next)
    );

    // Property 1: Verify empty detection.
    always_comb begin
        assert (empty_next == (rd_ptr_gray_next == synced_wr_ptr_gray));
    end

    // Property 2: Verify full detection.
    always_comb begin
        assert (full_next == (
            wr_ptr_gray_next == {
                ~synced_rd_ptr_gray[3:2],
                synced_rd_ptr_gray[1:0]
            }
        ));
    end
endmodule
