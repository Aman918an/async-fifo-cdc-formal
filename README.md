# Asynchronous FIFO — CDC & Formal Verification

A parameterized asynchronous FIFO project developed in SystemVerilog, focusing on clock-domain crossing (CDC), metastability-safe control transfer, formal verification, and FPGA synthesis analysis.

## Project Status

**In Progress**

### Completed

- [x] CDC fundamentals
- [x] Metastability concepts
- [x] 2-FF synchronizer
- [x] Active-low asynchronous reset
- [x] RTL simulation of the synchronizer
- [x] Binary FIFO pointer counter
- [x] Binary-to-Gray conversion
- [x] Gray-code transition verification
- [x] Asynchronous FIFO pointer architecture
- [x] Two-way Gray-pointer synchronization
- [x] Write-pointer next-state logic
- [x] Read-pointer next-state logic
- [x] Empty detection and registered empty flag
- [x] Full detection and registered full flag
- [x] RTL simulation of pointer CDC and FIFO control logic

### Upcoming

- [ ] FIFO data memory
- [ ] Complete asynchronous FIFO integration
- [ ] Randomized verification
- [ ] SystemVerilog Assertions
- [ ] Formal verification
- [ ] Vivado synthesis and timing analysis
- [ ] Resource utilization analysis
- [ ] Parameterized design-space exploration

---

## 1. Objective

The objective of this project is to design and verify an asynchronous FIFO capable of safely transferring data between two independent clock domains.

The project focuses on:

- Clock-domain crossing
- Metastability mitigation
- Gray-coded FIFO pointers
- Asynchronous FIFO architecture
- Assertion-based verification
- Formal verification
- FPGA synthesis and timing analysis

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

The testbench applies asynchronous transitions to `async_in` while the destination clock continues independently.

The simulation verifies:

- Reset behavior
- Two-stage synchronization
- Correct propagation of the asynchronous input
- Destination output following the second synchronizer stage

### Simulation

Simulation is performed using AMD/Xilinx Vivado XSim.

> RTL simulation cannot reproduce physical metastability. The synchronizer architecture is intended to reduce the probability of metastability propagating into destination-domain logic.

---

## 4. Project Structure

```text
async-fifo-cdc-formal/
│
├── rtl/
│   ├── bin_to_gray.sv
│   ├── binary_counter.sv
│   ├── cdc_synchronizer.sv
│   ├── gray_pointer_sync.sv
│   ├── read_pointer.sv
│   └── write_pointer.sv
│
├── testbench/
│   ├── tb_bin_to_gray.sv
│   ├── tb_binary_counter.sv
│   ├── tb_cdc_synchronizer.sv
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
| FIFO data memory | ⬜ |
| Complete asynchronous FIFO | ⬜ |
| Stress and randomized verification | ⬜ |
| Formal verification | ⬜ |
| Vivado synthesis and PPA analysis | ⬜ |

---

## 7. Validation Scope

The final design will be validated through:

1. RTL simulation
2. Self-checking testbench
3. Randomized testing
4. SystemVerilog Assertions
5. Formal verification
6. Vivado synthesis
7. Static timing analysis
8. Resource utilization analysis

Physical FPGA hardware validation is outside the scope of this project.

---

## Author

Aman Singh
