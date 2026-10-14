# Asynchronous FIFO — CDC & Formal Verification

A parameterized asynchronous FIFO project developed in SystemVerilog, focusing on clock-domain crossing (CDC), metastability-safe control transfer, formal verification, and FPGA synthesis analysis.

## Project Status

**Core implementation and verification complete**

### Completed

- [x] CDC fundamentals and metastability concepts
- [x] Two-flop synchronizer with active-low asynchronous reset
- [x] Binary FIFO pointers and binary-to-Gray conversion
- [x] Two-way Gray-pointer synchronization
- [x] Write/read pointer next-state logic
- [x] Registered full and empty status logic
- [x] Dual-clock FIFO memory and top-level integration
- [x] Directed self-checking simulation
- [x] Overflow protection and write-pointer stability checks
- [x] Empty-read protection and read-pointer stability checks
- [x] Wrap-around/reuse and recovery-after-empty checks
- [x] Randomized traffic with a queue-based data-order scoreboard
- [x] Randomized counters for accepted writes/reads and overflow/underflow attempts
- [x] Bounded waits for directed full/empty transitions
- [x] Simulation-time SystemVerilog Assertions (SVA)
- [x] Repeated fill-and-drain stress test across four rounds
- [x] Reset during operation with unread data and recovery
- [x] Reset while read/write requests are active and recovery
- [x] Reset with a partially filled FIFO and nonzero pointer offset

### Latest recorded regression

| Metric | Result |
|---|---:|
| Total checks | 478 |
| Passed | 478 |
| Failed | 0 |
| Accepted randomized writes | 411 |
| Accepted randomized reads | 408 |
| Overflow attempts | 93 |
| Underflow attempts | 3 |

The regression passed with **478/478 checks and zero failures**. Randomized counts can vary between runs. These are simulation results, not a formal proof.

### Formal verification results

Formal verification was performed using SymbiYosys (`sby`) with the Boolector SMT solver. All nine listed proof configurations completed successfully.

| Formal configuration | Result |
|---|---|
| `async_fifo.sby` | Passed |
| `async_fifo_empty.sby` | Passed |
| `async_fifo_full.sby` | Passed |
| `async_fifo_read_ptr.sby` | Passed |
| `bin_to_gray.sby` | Passed |
| `fifo_status.sby` | Passed |
| `gray_pointer_sync.sby` | Passed |
| `read_pointer.sby` | Passed |
| `write_pointer.sby` | Passed |

The `formal/` directory contains the `.sby` configurations and corresponding formal harnesses. These proofs establish the properties encoded in those harnesses under their assumptions; they do not automatically prove every possible behavior of the design.

### Vivado implementation results

The implementation target reported by Vivado is an Artix-7 device, `7a12ti-csg325`, speed grade `-1L`.

| Metric | Result |
|---|---:|
| LUT | 25 / 8,000 (0.31%) |
| LUTRAM | 6 / 5,000 (0.12%) |
| Flip-flops (FF) | 34 / 16,000 (0.21%) |
| I/O | 23 / 150 (15.33%) |
| Worst Negative Slack (WNS) | +7.471 ns |
| Total Negative Slack (TNS) | 0.000 ns |
| Worst Hold Slack (WHS) | +0.122 ns |
| Total Hold Slack (THS) | 0.000 ns |
| Worst Pulse Width Slack (WPWS) | +3.750 ns |
| Total Pulse Width Negative Slack (TPWS) | 0.000 ns |
| Dynamic power estimate | 0.002 W |
| Static power estimate | 0.059 W |

The final timing summary reported zero failing setup, hold, and pulse-width endpoints for paths remaining under timing analysis. Power values are Vivado estimates, not measurements from a physical FPGA board.

The XDC defines `write_clk` with a 10 ns period (100 MHz) and `read_clk` with a 14 ns period (approximately 71.43 MHz). The clocks are asynchronous and are declared as separate asynchronous clock groups.

**Timing-analysis caveat:** asynchronous clock-group constraints exclude ordinary setup/hold analysis between these unrelated clock domains. A clean timing summary does not, by itself, prove CDC safety or metastability immunity. CDC correctness depends on the synchronizer structure, Gray-pointer transfer, and correct dual-clock memory behavior. Physical metastability cannot be reproduced by RTL simulation or proved impossible by these formal checks.


### Completed implementation and verification

- [x] Formal verification using SymbiYosys and Boolector
- [x] Standalone formal proofs for binary-to-Gray conversion, write pointer, read pointer, Gray-pointer synchronizer, and FIFO status logic
- [x] Integrated FIFO proof and targeted read-pointer, empty, and full proofs
- [x] Vivado synthesis, implementation, resource utilization, and timing analysis

### Optional future work

- [ ] Explore additional FIFO depths and parameter configurations
- [ ] Physical FPGA board validation, if suitable hardware becomes available

---

## 1. Objective

The objective of this project is to design and verify an asynchronous FIFO capable of safely transferring data between two independent clock domains.

The project focuses on:

- Clock-domain crossing and metastability mitigation
- Gray-coded FIFO pointers and synchronized pointer transfer
- Independent write and read clock domains
- FIFO data storage and full/empty flow control
- Self-checking RTL simulation
- Assertion-based simulation and formal verification
- FPGA synthesis, implementation, resource utilization, and timing analysis

No physical FPGA board is required for the validation planned in this project.

---

## 2. CDC Synchronizer

The initial implementation is a basic two-flip-flop synchronizer for transferring a single-bit asynchronous signal into a destination clock domain.

### Architecture

```text
                 Destination Clock
                        │
                        │
async_in ───────────► FF1 ─────────► FF2 ─────────► sync_out
                       │              │
                       │              │
                  First sampling   Destination
                    stage           signal
```

The first flip-flop samples the asynchronous input and may potentially experience metastability if the input transition occurs close to the destination clock edge.

The second flip-flop provides an additional clock period for the first stage to resolve before the signal is used by destination-domain logic.

### Reset

The synchronizer uses an active-low asynchronous reset:

```text
rst_n = 0 → reset
rst_n = 1 → normal operation
```

---

## 3. Verification

The project uses focused module-level testbenches and a top-level FIFO testbench with independent write and read clocks. The top-level testbench is currently named `tb_fifo_memory.sv`, although it instantiates and verifies the complete `async_fifo` DUT.

### Directed tests

The directed sequence checks:

- Filling the FIFO and waiting for `full`
- Rejecting a write while full
- Confirming the write pointer and stored memory remain unchanged during overflow
- Reading an entry to free a slot and reusing the slot
- Rejecting a read while empty
- Writing and reading a recovery value after the FIFO becomes empty

### Randomized tests

Random write and read requests are generated on the negative edges of their respective clocks. A queue-based reference model records accepted writes and compares accepted read data against the oldest expected value. Counters track accepted writes, accepted reads, overflow attempts, and underflow attempts.

After random stimulus stops, the testbench drains outstanding reference-model entries using a bounded loop and checks that the DUT returns to empty.

**Scoreboard limitation:** the reference model uses the DUT's `full` and `empty` flags to identify accepted transactions. Therefore, it primarily checks data ordering for transactions accepted according to those flags. Directed protection checks and assertions provide additional control-logic checks.

### Assertions and timeouts

Simulation-time SVA checks cover pointer stability during blocked operations, Gray-pointer transitions, full/empty next-state equations, and pointer increments on accepted operations. Bounded tasks prevent directed full/empty waits from waiting indefinitely.

The assertions have passed in the recorded simulation run. They have **not** yet been proven using a formal verification engine.

### Simulation environment

Simulation is performed using AMD/Xilinx Vivado XSim. RTL simulation cannot reproduce physical metastability; the synchronizer architecture is intended to reduce the probability of metastability propagating into destination-domain logic.

---

## 4. Project Structure

```text
async-fifo-cdc-formal/
├── constraints/
│   └── async_fifo.xdc
│
├── formal/
│   ├── async_fifo.sby
│   ├── async_fifo_empty.sby
│   ├── async_fifo_formal.sv
│   ├── async_fifo_full.sby
│   ├── async_fifo_read_ptr.sby
│   ├── bin_to_gray.sby
│   ├── bin_to_gray_formal.sv
│   ├── fifo_status.sby
│   ├── fifo_status_formal.sv
│   ├── gray_pointer_sync.sby
│   ├── gray_pointer_sync_formal.sv
│   ├── read_pointer.sby
│   ├── read_pointer_formal.sv
│   ├── write_pointer.sby
│   └── write_pointer_formal.sv
│
├── rtl/
│   ├── async_fifo.sv
│   ├── bin_to_gray.sv
│   ├── binary_counter.sv
│   ├── cdc_synchronizer.sv
│   ├── fifo_memory.sv
│   ├── fifo_status.sv
│   ├── gray_pointer_sync.sv
│   ├── read_pointer.sv
│   └── write_pointer.sv
│
├── testbench/
│   ├── tb_bin_to_gray.sv
│   ├── tb_binary_counter.sv
│   ├── tb_cdc_synchronizer.sv
│   ├── tb_fifo_memory.sv
│   ├── tb_fifo_status.sv
│   ├── tb_gray_pointer_sync.sv
│   ├── tb_pointer_cdc.sv
│   ├── tb_pointer_gray.sv
│   ├── tb_read_pointer.sv
│   ├── tb_read_pointer_gray.sv
│   ├── tb_write_pointer.sv
│   └── tb_write_pointer_gray.sv
│
├── .gitignore
├── LICENSE
└── README.md
```

---

## 5. Tools

- SystemVerilog
- AMD/Xilinx Vivado 2026.1
- XSim
- OSS CAD Suite
- SymbiYosys (`sby`)
- Boolector SMT solver

---

## 6. Project Roadmap

| Focus | Status |
|---|---|
| CDC and 2-FF synchronizer | ✅ |
| Binary counter and Gray code | ✅ |
| Asynchronous FIFO pointer architecture | ✅ |
| Two-way pointer synchronization | ✅ |
| Write-domain pointer control | ✅ |
| Read-domain pointer control | ✅ |
| Full/empty detection | ✅ |
| Dual-clock FIFO data memory | ✅ |
| Top-level asynchronous FIFO integration | ✅ |
| Directed self-checking simulation | ✅ |
| Overflow, empty-read, ordering, wrap-around, recovery checks | ✅ |
| Repeated fill-and-drain stress and reset verification | ✅ |
| Simulation-time SystemVerilog Assertions | ✅ |
| Formal verification proof | ✅ |
| Vivado synthesis, implementation, timing, and resource analysis | ✅ |

---

## 7. Validation Scope

Validation completed:

1. Module-level RTL simulation
2. Directed self-checking top-level FIFO simulation
3. Randomized queue-based data-order checking
4. Four rounds of fill-and-drain stress testing
5. Reset during operation, active requests, and partial occupancy
6. Simulation-time SystemVerilog Assertions
7. Formal proofs for the listed standalone modules
8. Integrated FIFO and targeted read-pointer, empty, and full proofs
9. Vivado synthesis and implementation
10. Timing summary and resource utilization review

The recorded simulation regression passed 478 checks with zero failures. All nine listed SymbiYosys configurations completed successfully. The implemented design reported no failing setup, hold, or pulse-width endpoints under the active timing constraints.

Limitations:

- The scoreboard uses the DUT's `full` and `empty` flags to determine accepted transactions, so directed protection checks and assertions complement the data-order scoreboard.
- Formal verification proves only the properties encoded in the harnesses and only under their assumptions.
- Asynchronous clock groups exclude ordinary timing analysis between clock domains; CDC correctness still depends on the design structure.
- RTL simulation and formal proofs do not establish that physical metastability is impossible.
- Power values are tool estimates. No physical FPGA board validation has been performed.
- Parameterized design-space exploration has not yet been completed.

Physical FPGA hardware validation is outside the current project scope.

---

## Author

Aman Singh
