# Asynchronous FIFO — CDC & Formal Verification

A parameterized asynchronous FIFO project developed in SystemVerilog, focusing on clock-domain crossing (CDC), metastability-safe control transfer, formal verification, and FPGA synthesis analysis.

## Project Status

**In Progress**

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

### Latest recorded randomized simulation

| Metric | Result |
|---|---:|
| Total checks | 427 |
| Passed | 427 |
| Failed | 0 |
| Accepted randomized writes | 411 |
| Accepted randomized reads | 408 |
| Overflow attempts | 93 |
| Underflow attempts | 3 |

Random counts can vary between runs. These results are from simulation, not a formal proof.

### Upcoming

- [ ] Stress testing and pointer-wrap coverage
- [ ] Reset asserted during FIFO activity and recovery checks
- [ ] Formal verification using a formal engine
- [ ] Vivado synthesis and timing analysis
- [ ] Resource utilization analysis
- [ ] Parameterized design-space exploration

---

## 1. Objective

The objective of this project is to design and verify an asynchronous FIFO capable of safely transferring data between two independent clock domains.

The project focuses on:

- Clock-domain crossing and metastability mitigation
- Gray-coded FIFO pointers and synchronized pointer transfer
- Independent write and read clock domains
- FIFO data storage and full/empty flow control
- Self-checking RTL simulation
- Assertion-based and formal verification (planned)
- FPGA synthesis and timing analysis (planned)

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
- AMD/Xilinx Vivado
- XSim

Formal verification tools will be added as the project develops.

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
| Stress and reset verification | 🔄 |
| Simulation-time SystemVerilog Assertions | ✅ |
| Formal verification proof | ⬜ |
| Vivado synthesis and PPA analysis | ⬜ |

---

## 7. Validation Scope

Validation completed so far:

1. Module-level RTL simulation
2. Directed self-checking top-level FIFO simulation

Further planned validation:

1. Stress and reset-during-activity testing
2. Formal verification
3. Vivado synthesis
4. Static timing analysis
5. Resource utilization analysis

Physical FPGA hardware validation is outside the scope of this project.

---

## Author

Aman Singh
