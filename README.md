# Asynchronous FIFO — CDC & Formal Verification

A parameterized asynchronous FIFO project developed in SystemVerilog, focusing on clock-domain crossing (CDC), metastability-safe control transfer, formal verification, and FPGA synthesis analysis.

## Project Status

**In Progress**

### Completed

- [x] CDC fundamentals and metastability concepts
- [x] 2-FF synchronizer with active-low asynchronous reset
- [x] Binary FIFO pointer counter
- [x] Binary-to-Gray conversion and Gray-code transition verification
- [x] Asynchronous FIFO pointer architecture
- [x] Two-way Gray-pointer synchronization
- [x] Write-pointer and read-pointer next-state logic
- [x] Empty detection and registered empty flag
- [x] Full detection and registered full flag
- [x] Dual-clock FIFO data memory
- [x] Top-level asynchronous FIFO integration
- [x] Directed self-checking simulation of FIFO operation
- [x] Overflow protection and write-pointer stability check
- [x] Read ordering, wrap-around/reuse, and empty-read protection checks
- [x] Recovery after empty state
- [x] Current directed testbench run: 20 checks passed, 0 failed

### Upcoming

- [ ] Finish reviewing and extending directed test coverage
- [ ] Testbench cleanup and check-count improvements
- [ ] Randomized and stress verification
- [ ] SystemVerilog Assertions
- [ ] Formal verification
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

The project uses focused module-level testbenches as well as a top-level FIFO testbench with independent write and read clocks.

The current directed top-level simulation checks:

* FIFO writes and reads
* Full assertion and rejection of an overflow write
* Write-pointer and stored-data stability during overflow
* Read ordering after a slot is freed and reused
* Empty assertion and rejection of an empty read
* Recovery by writing and reading data after the FIFO becomes empty
* FIFO returning to the empty state after the final read

### Directed Verification Results

The self-checking testbench was executed using AMD/Xilinx Vivado XSim.

**Simulation Summary**

| Metric         | Result |
| -------------- | -----: |
| Total checks   |     21 |
| Passed         |     21 |
| Failed         |      0 |
| Overall result |   PASS |

**Verified scenarios:**

* Write-pointer stability during FIFO overflow
* Memory contents remain unchanged during rejected writes
* Correct FIFO read ordering
* FIFO address wrap-around and memory reuse
* Empty-read protection
* Recovery after the FIFO becomes empty
* Correct recovery data retrieval
* FIFO returns to the empty state after the final read

```text
--------------------------------
FIFO VERIFICATION SUMMARY
Total Checks : 21
Passed       : 21
Failed       : 0
--------------------------------
FINAL RESULT: ALL TESTS PASSED
```

> These results represent directed simulation coverage. Randomized verification, assertion-based verification, and formal verification are still pending.

### Simulation

Simulation is performed using AMD/Xilinx Vivado XSim.

> RTL simulation cannot reproduce physical metastability. The synchronizer architecture is intended to reduce the probability of metastability propagating into destination-domain logic.

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
| Additional directed/stress verification | 🔄 |
| SystemVerilog Assertions | ⬜ |
| Formal verification | ⬜ |
| Vivado synthesis and PPA analysis | ⬜ |

---

## 7. Validation Scope

Validation completed so far:

1. Module-level RTL simulation
2. Directed self-checking top-level FIFO simulation

Further planned validation:

1. Expanded directed and randomized testing
2. SystemVerilog Assertions
3. Formal verification
4. Vivado synthesis
5. Static timing analysis
6. Resource utilization analysis

Physical FPGA hardware validation is outside the scope of this project.

---

## Author

Aman Singh
