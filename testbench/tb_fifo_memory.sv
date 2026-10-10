`timescale 1ns / 1ps

module tb_fifo_memory;

// Top-level asynchronous FIFO testbench with independent read/write clocks.

logic write_clk;
logic read_clk;
logic rst_n;

logic write_en;
logic read_en;

logic [7:0] write_data;
logic [7:0] read_data;

logic full;
logic empty;

integer i,k;
integer pass_count;
integer fail_count;
integer random_cycle;

integer random_write_accepts;
integer random_read_accepts;
integer random_overflow_attempts;
integer random_underflow_attempts;

logic [7:0] memory_snapshot [0:7];
logic [3:0] pointer_snapshot;
logic [3:0] read_pointer_snapshot;

logic [7:0] recovery_data;

// Queue-based reference model for checking randomized data ordering.
logic [7:0] reference_fifo[$];

logic random_test_active;
logic random_stimulus_active;

// Set when a bounded wait fails to observe the expected status flag.
logic wait_timeout;
// ============================================================
// SVA CHECKS
// Simulation-time assertions; these are not a formal proof.
// ============================================================

assert property (
    @(posedge write_clk)
    disable iff (!rst_n)
    (full && write_en) |=> dut.wr_ptr_bin == $past(dut.wr_ptr_bin)
) else $error("SVA FAIL: Write pointer changed while FIFO was full");


assert property (
    @(posedge read_clk)
    disable iff (!rst_n)
    (empty && read_en) |=> dut.rd_ptr_bin == $past(dut.rd_ptr_bin)
) else $error("SVA FAIL: Read pointer changed while FIFO was empty");


assert property (
    @(posedge write_clk)
    disable iff (!rst_n)
    $stable(dut.wr_ptr_gray) || $onehot(dut.wr_ptr_gray ^ $past(dut.wr_ptr_gray))
) else $error("SVA FAIL: Gray-code write pointer changed by more than one bit");

assert property (
    @(posedge read_clk)
    disable iff (!rst_n)
    $stable(dut.rd_ptr_gray) || $onehot(dut.rd_ptr_gray ^ $past(dut.rd_ptr_gray))
) else $error("SVA FAIL: Gray-code read pointer changed by more than one bit");

assert property (
    @(posedge read_clk)
    disable iff (!rst_n)
    dut.empty_next == (dut.rd_ptr_gray_next == dut.synced_wr_ptr_gray)
) else $error("SVA FAIL: empty_next does not match pointer comparison");

assert property (
    @(posedge write_clk)
    disable iff (!rst_n)
    dut.full_next ==
    (dut.wr_ptr_gray_next == {~dut.synced_rd_ptr_gray[3:2],dut.synced_rd_ptr_gray[1:0]})
) else $error("SVA FAIL: full_next does not match Gray-code full condition");

assert property (
    @(posedge write_clk)
    disable iff (!rst_n)
    (write_en && !full) |=> dut.wr_ptr_bin == $past(dut.wr_ptr_bin) + 1'b1
) else $error("SVA FAIL: Accepted write did not advance write pointer");

assert property (
    @(posedge read_clk)
    disable iff (!rst_n)
    (read_en && !empty) |=> dut.rd_ptr_bin == $past(dut.rd_ptr_bin) + 1'b1
) else $error("SVA FAIL: Accepted read did not advance read pointer");
// ============================================================
// ============================================================

// Wait for full in the write-clock domain, with a finite timeout.
task automatic wait_for_full(
    input logic expected_value,
    input integer timeout_cycles
);
    integer cycles;
    begin
        cycles = 0;

        while ((full !== expected_value) &&
               (cycles < timeout_cycles)) begin
            @(negedge write_clk);
            cycles = cycles + 1;
        end

        if (full !== expected_value) begin
            $display(
                "FAIL: Timeout waiting for full = %0b",
                expected_value
            );
            fail_count++;
            wait_timeout = 1;
        end
    end
endtask


// Wait for empty in the read-clock domain, with a finite timeout.
task automatic wait_for_empty(
    input logic expected_value,
    input integer timeout_cycles
);
    integer cycles;
    begin
        cycles = 0;

        while ((empty !== expected_value) &&
               (cycles < timeout_cycles)) begin
            @(negedge read_clk);
            cycles = cycles + 1;
        end

        if (empty !== expected_value) begin
            $display(
                "FAIL: Timeout waiting for empty = %0b",
                expected_value
            );
            fail_count++;
            wait_timeout = 1;
        end
    end
endtask

// ============================================================
// TEST SEQUENCE
// ============================================================

// Instantiate an 8-bit-wide FIFO with 8 storage entries.
// FIFO under test
async_fifo #(
.DATA_WIDTH(8),
.ADDR_WIDTH(3)
) 
dut(
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

// Independent write clock: 10 ns period (100 MHz).
// Write clock: 10 ns period
initial begin
write_clk = 0;
forever #5 write_clk = ~write_clk;
end

// Independent read clock: 14 ns period (approximately 71.4 MHz).
// Read clock: 14 ns period
initial begin
read_clk = 0;
forever #7 read_clk = ~read_clk;
end


// Reference-model write monitor: enqueue accepted writes only.
always @(posedge write_clk) begin
    if (rst_n && random_test_active && write_en && !full) begin
        reference_fifo.push_back(write_data);

        if (random_stimulus_active)
            random_write_accepts++;
    end

    if (rst_n && random_stimulus_active && write_en && full) begin
        random_overflow_attempts++;
    end
end


// Reference-model read monitor: compare accepted reads with the oldest
// expected item. The #1 delay allows the DUT's read-data update to settle.
always @(posedge read_clk) begin
    if (rst_n && random_test_active && read_en && !empty) begin
        logic [7:0] expected_random_data;

        if (reference_fifo.size() == 0) begin
            $display("RANDOM CHECK FAIL: Reference FIFO is empty on an accepted read");
            fail_count++;
        end
        else begin
            expected_random_data = reference_fifo.pop_front();

            #1;

            if (read_data !== expected_random_data) begin
                $display("RANDOM CHECK FAIL: Expected %h, Got %h",
                         expected_random_data, read_data);
                fail_count++;
            end
            else begin
                pass_count++;
            
                if (random_stimulus_active)
                    random_read_accepts++;
            end
        end
    end
    if (rst_n && random_stimulus_active && read_en && empty) begin
    random_underflow_attempts++;
    end
end


// Drive write stimulus away from the active write-clock edge.
always @(negedge write_clk) begin
    if (random_stimulus_active) begin
        write_en   = $urandom_range(0, 1);
        write_data = $urandom_range(0, 255);
    end
    else begin
        write_en = 0;
    end
end

// Drive read stimulus away from the active read-clock edge.
always @(negedge read_clk) begin
    if (random_stimulus_active) begin
        read_en = $urandom_range(0, 1);
    end
    else begin
        read_en = 0;
    end
end


initial begin
rst_n = 0;

write_en = 0;
read_en = 0;
write_data = 0;
#20;
rst_n = 1;
end


initial begin
pass_count = 0;
fail_count = 0;
recovery_data = 8'h5A;
random_test_active = 0;
random_stimulus_active = 0;

random_write_accepts = 0;
random_read_accepts = 0;
random_overflow_attempts = 0;
random_underflow_attempts = 0;

wait_timeout = 0;

wait (rst_n == 1);

// Allow reset state to settle
repeat (2) @(negedge write_clk);

// Directed test: fill the FIFO and check that full asserts.
// Attempt to write 8 entries
for (i = 0; i < 8; i = i + 1) begin
    @(negedge write_clk);
    write_en = 1;
    write_data = 8'h10 + i;
end

// Allow the eighth write to be accepted
@(negedge write_clk);
write_en = 0;

// Wait for full status to update
wait_for_full(1'b1, 20);

// Snapshot memory and pointer to detect unintended overflow effects.
// Capture FIFO state before overflow attempt
for (k = 0; k < 8; k = k + 1) begin
    memory_snapshot[k] = dut.memory_inst.mem[k];
end

pointer_snapshot = dut.wr_ptr_bin;

// Attempt ninth write while FIFO is full
@(negedge write_clk);
write_en = 1;
write_data = 8'hFF;

@(negedge write_clk);
write_en = 0;

// Verify overflow protection
if (full !== 1'b1) begin
    $display("FAIL: FIFO was not full during overflow attempt");
    fail_count = fail_count + 1;
end
else if (dut.wr_ptr_bin !== pointer_snapshot) begin
    $display("FAIL: Write pointer advanced during overflow");
    fail_count = fail_count + 1;
end
else begin
    $display("PASS: Write pointer remained unchanged during overflow");
    pass_count = pass_count + 1;
end

for (k = 0; k < 8; k = k + 1) begin
    if (dut.memory_inst.mem[k] !== memory_snapshot[k]) begin
        $display("FAIL: Memory[%0d] was modified during overflow", k);
        fail_count = fail_count + 1;
    end
    else begin
        $display("PASS: Memory[%0d] unchanged", k);
        pass_count = pass_count + 1;
    end
end


// Free one slot, then verify the slot can be reused after wrap-around.
// Read one entry to create space
wait_for_empty(1'b0, 20);

@(negedge read_clk);
read_en = 1;

@(negedge read_clk);
read_en = 0;

// Wait for full flag to deassert
wait_for_full(1'b0, 20);

// Write a new entry
@(negedge write_clk);
write_en = 1;
write_data = 8'hAA;

@(negedge write_clk);
write_en = 0;

// Allow final signals to settle
repeat (2) @(negedge write_clk);


    // Consume the remaining 8 FIFO entries
    // Data ordering is checked separately by randomized verification.
    for (i = 0; i < 8; i = i + 1) begin
        @(negedge read_clk);
        read_en = 1;

        @(negedge read_clk);
        read_en = 0;
    end

    // Attempt a read while empty and verify that it is rejected.
// Verify empty-read protection


// Wait until FIFO becomes empty
wait_for_empty(1'b1, 20);

// Capture read pointer
read_pointer_snapshot = dut.rd_ptr_bin;

// Attempt read while empty
@(negedge read_clk);
read_en = 1;

@(posedge read_clk);
#1;

// Verify read protection
if (dut.rd_ptr_bin === read_pointer_snapshot &&
    dut.mem_read_en === 1'b0 &&
    empty === 1'b1) begin

    $display("PASS: Empty-read protection");
    pass_count = pass_count + 1;
end
else begin

    $display("FAIL: Empty-read protection");
    fail_count = fail_count + 1;

    $display("Read pointer = %0d, Expected = %0d",
             dut.rd_ptr_bin, read_pointer_snapshot);

    $display("mem_read_en = %b, Expected = 0",
             dut.mem_read_en);
end

@(negedge read_clk);
read_en = 0;

// Verify normal operation recovers after the FIFO becomes empty.
// Verify recovery after empty

// Wait for write clock edge
@(negedge write_clk);

write_en = 1;
write_data = recovery_data;

// Allow write to be accepted
@(negedge write_clk);
write_en = 0;

// Wait for write pointer synchronization
wait_for_empty(1'b0, 20);

// Verify FIFO recovered from empty
if (empty === 1'b0) begin
    $display("PASS: FIFO recovered from empty state");
    pass_count = pass_count + 1;
end
else begin
    $display("FAIL: FIFO did not recover from empty");
    fail_count = fail_count + 1;
end

// Read recovered data
@(negedge read_clk);
read_en = 1;

@(posedge read_clk);
#1;

if (read_data === recovery_data) begin
    $display("PASS: Recovery data = %h", read_data);
    pass_count = pass_count + 1;
end
else begin
    $display("FAIL: Recovery data = %h, Expected = %h",
             read_data, recovery_data);
    fail_count = fail_count + 1;
end

@(negedge read_clk);
read_en = 0;


// Wait for FIFO to return to empty
wait_for_empty(1'b1, 20);

if (empty === 1'b1) begin
    $display("PASS: FIFO returned to empty after recovery read");
    pass_count = pass_count + 1;
end
else begin
    $display("FAIL: FIFO did not return to empty");
    fail_count = fail_count + 1;
end


// ============================================================
// RANDOMIZED VERIFICATION
// Random requests use independent clocks; the queue checks accepted data
// ordering. Coverage counters track transfers and blocked requests.
// ============================================================

$display("\nStarting randomized verification...");

// Confirm that the reference model starts empty
if (reference_fifo.size() != 0) begin
    $display("ERROR: Reference FIFO is not empty at random-test start");
    fail_count++;
end
else begin
    $display("PASS: Reference FIFO is empty at random-test start");
    pass_count++;
end

// Enable randomized stimulus
random_test_active = 1;
random_stimulus_active = 1;

// Run randomized traffic for 1000 write-clock cycles
for (random_cycle = 0; random_cycle < 1000; random_cycle = random_cycle + 1) begin
    @(negedge write_clk);
end

// Stop generating random write requests.
// Keep random_test_active high so the read checker remains enabled.
@(negedge write_clk);
random_stimulus_active = 0;
write_en = 0;

// Stop random read requests.
@(negedge read_clk);
read_en = 0;

// Allow synchronized pointers and status flags to settle.
repeat (4) @(negedge write_clk);
repeat (4) @(negedge read_clk);

$display("Randomized stimulus finished. Starting FIFO drain.");

// Drain outstanding reference-model entries with a bounded loop so a
// stalled DUT cannot leave the simulation running indefinitely.
// Drain remaining entries, with a timeout to prevent a hang.
for (random_cycle = 0;
     random_cycle < 1000 && reference_fifo.size() > 0;
     random_cycle = random_cycle + 1) begin

    @(negedge read_clk);

    if (empty == 1'b0) begin
        read_en = 1;
    end
    else begin
        read_en = 0;
    end

    @(negedge read_clk);
    read_en = 0;
end


if (reference_fifo.size() > 0) begin
    $display("FAIL: Drain timed out with %0d reference entries remaining",
             reference_fifo.size());
    fail_count++;
end
else begin
    // Wait for the DUT's empty flag, with a timeout
    fork
        begin
            wait (empty == 1);
        end

        begin
            repeat (20) @(posedge read_clk);
            $display("FAIL: Timeout waiting for FIFO empty after drain");
            fail_count++;
        end
    join_any
    disable fork;
end


if (reference_fifo.size() == 0 && empty == 1) begin
    $display("PASS: Reference FIFO drained and DUT is empty");
    pass_count++;
end
else begin
    $display("FAIL: Drain did not complete correctly");
    fail_count++;
end

// Disable the checker only after draining
random_test_active = 0;

$display("\nRANDOMIZED COVERAGE SUMMARY");
$display("Accepted writes    : %0d", random_write_accepts);
$display("Accepted reads     : %0d", random_read_accepts);
$display("Overflow attempts  : %0d", random_overflow_attempts);
$display("Underflow attempts : %0d", random_underflow_attempts);

if (random_write_accepts == 0 ||
    random_read_accepts == 0 ||
    random_overflow_attempts == 0 ||
    random_underflow_attempts == 0) begin

    $display("FAIL: Randomized coverage requirement not met");
    fail_count++;
end
else begin
    $display("PASS: All randomized coverage targets met");
    pass_count++;
end


$display("--------------------------------");
$display("FIFO VERIFICATION SUMMARY");
$display("Total Checks : %0d", pass_count + fail_count);
$display("Passed       : %0d", pass_count);
$display("Failed       : %0d", fail_count);
$display("--------------------------------");

if (fail_count == 0) 
    $display("FINAL RESULT: ALL TESTS PASSED");

else 
    $display("FINAL RESULT: TEST FAILED");

$finish;
end

endmodule
