`timescale 1ns / 1ps

module tb_fifo_status;

logic [3:0] wr_ptr_gray_next;
logic [3:0] rd_ptr_gray_next;

logic [3:0] synced_rd_ptr_gray;
logic [3:0] synced_wr_ptr_gray;

logic full_next;
logic empty_next;

fifo_status #(.PTR_WIDTH(4)) 
dut (
.wr_ptr_gray_next(wr_ptr_gray_next),
.rd_ptr_gray_next(rd_ptr_gray_next),
.synced_rd_ptr_gray(synced_rd_ptr_gray),
.synced_wr_ptr_gray(synced_wr_ptr_gray),
.full_next(full_next),
.empty_next(empty_next)
);

initial begin

// -------------------------
// EMPTY TEST
// -------------------------

synced_wr_ptr_gray = 4'b0000;
rd_ptr_gray_next   = 4'b0000;

#10;

if (empty_next !== 1'b1)
    $error("EMPTY test failed");

// Different pointers -> not empty

rd_ptr_gray_next = 4'b0001;

#10;

if (empty_next !== 1'b0)
    $error("NOT EMPTY test failed");


// -------------------------
// FULL TEST
// -------------------------

synced_rd_ptr_gray = 4'b0000;

// For synced_rd_ptr_gray = 0000
// Full comparison value = 1100

wr_ptr_gray_next = 4'b1100;

#10;

if (full_next !== 1'b1)
    $error("FULL test failed");

// Different pointer -> not full

wr_ptr_gray_next = 4'b1101;

#10;

if (full_next !== 1'b0)
    $error("NOT FULL test failed");


$display("FIFO status tests passed.");

$finish;
end

endmodule
