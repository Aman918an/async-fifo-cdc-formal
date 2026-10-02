`timescale 1ns / 1ps

module tb_fifo_memory;

logic write_clk;
logic read_clk;
logic rst_n;

logic write_en;
logic read_en;

logic [7:0] write_data;
logic [7:0] read_data;

logic full;
logic empty;

integer i,j,k;
integer pass_count;
integer fail_count;

logic [7:0] expected_data [0:7];
logic [7:0] memory_snapshot [0:7];
logic [3:0] pointer_snapshot;
logic [3:0] read_pointer_snapshot;

logic [7:0] recovery_data;

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

// Write clock: 10 ns period
initial begin
write_clk = 0;
forever #5 write_clk = ~write_clk;
end

// Read clock: 14 ns period
initial begin
read_clk = 0;
forever #7 read_clk = ~read_clk;
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

wait (rst_n == 1);

// Allow reset state to settle
repeat (2) @(negedge write_clk);

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
wait (full == 1);

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


// Read one entry to create space
wait (empty == 0);

@(negedge read_clk);
read_en = 1;

@(negedge read_clk);
read_en = 0;

// Wait for full flag to deassert
wait (full == 0);

// Write a new entry
@(negedge write_clk);
write_en = 1;
write_data = 8'hAA;

@(negedge write_clk);
write_en = 0;

// Allow final signals to settle
repeat (2) @(negedge write_clk);

// Expected FIFO output sequence
expected_data[0] = 8'h11;
expected_data[1] = 8'h12;
expected_data[2] = 8'h13;
expected_data[3] = 8'h14;
expected_data[4] = 8'h15;
expected_data[5] = 8'h16;
expected_data[6] = 8'h17;
expected_data[7] = 8'hAA;

// Read and verify FIFO contents
for (j = 0; j < 8; j = j + 1) begin

@(negedge read_clk);
read_en = 1;

@(posedge read_clk);
#1;

if (read_data === expected_data[j]) begin
    $display("PASS: Read[%0d] = %h", j, read_data);
    pass_count = pass_count + 1;
end
else begin
    $display("FAIL: Read[%0d] = %h, Expected = %h",j, read_data, expected_data[j]);
    fail_count = fail_count + 1;
end

@(negedge read_clk);
read_en = 0;

end

// Verify empty-read protection

// Wait until FIFO becomes empty
wait (empty == 1);

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

// Verify recovery after empty

// Wait for write clock edge
@(negedge write_clk);

write_en = 1;
write_data = recovery_data;

// Allow write to be accepted
@(negedge write_clk);
write_en = 0;

// Wait for write pointer synchronization
wait (empty == 0);

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
wait (empty == 1'b1);

if (empty === 1'b1) begin
    $display("PASS: FIFO returned to empty after recovery read");
    pass_count = pass_count + 1;
end
else begin
    $display("FAIL: FIFO did not return to empty");
    fail_count = fail_count + 1;
end


$display("--------------------------------");
$display("FIFO VERIFICATION SUMMARY");
$display("Total Checks : %0d", pass_count + fail_count);
$display("Passed       : %0d", pass_count);
$display("Failed       : %0d", fail_count);
$display("--------------------------------");

if (fail_count == 0 && pass_count == 21) 
    $display("FINAL RESULT: ALL TESTS PASSED");

else 
    $display("FINAL RESULT: TEST FAILED");

$finish;
end

endmodule
