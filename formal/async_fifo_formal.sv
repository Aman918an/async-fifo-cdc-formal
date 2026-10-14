module async_fifo_formal;
    // ── Global formal clock ──
    // Single global clock drives the formal time-step.
    // Design clocks are free-running (anyseq) so clk2fflogic can
    // properly detect their edges.
    (* gclk *) logic formal_clk;

    // ── Design clocks ──
    // anyseq lets the solver pick when each clock toggles,
    // modelling truly asynchronous clock domains.
    (* anyseq *) logic write_clk;
    (* anyseq *) logic read_clk;

    (* anyseq *) logic rst_n;
    (* anyseq *) logic write_en;
    (* anyseq *) logic read_en;
    (* anyseq *) logic [7:0] write_data;

    logic [7:0] read_data;
    logic full;
    logic empty;

    async_fifo #(
        .DATA_WIDTH(8),
        .ADDR_WIDTH(3)
    ) dut (
        .write_clk(write_clk),
        .read_clk(read_clk),
        .rst_n(rst_n),
        .write_en(write_en),
        .read_en(read_en),
        .write_data(write_data),
        .read_data(read_data),
        .full(full),
        .empty(empty)
    );

    // ──────────────────────────────────────────────
    //  Clock constraints
    // ──────────────────────────────────────────────
    // Clocks must toggle: they cannot stay stuck at the same level
    // for two consecutive formal steps. This guarantees at least one
    // rising edge every two steps for each clock domain.
    always @($global_clock) begin
        if (!$initstate) begin
            assume (write_clk != $past(write_clk));
            assume (read_clk  != $past(read_clk));
        end
    end

    // ──────────────────────────────────────────────
    //  Reset constraints
    // ──────────────────────────────────────────────
    // Reset starts active.
    initial assume (!rst_n);

    // Keep reset active for the first formal step.
    always @($global_clock) begin
        if ($initstate)
            assume (!rst_n);
    end

    // Once rst_n is deasserted (goes high), it must stay deasserted.
    // Without this, the induction engine can re-assert reset mid-proof,
    // creating unreachable states where pointers change due to reset
    // while assertions expect them to be stable.
    always @($global_clock) begin
        if (!$initstate && $past(rst_n))
            assume (rst_n);
    end

endmodule
