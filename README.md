# Asynchronous FIFO — CDC, Formal Verification & RTL-to-GDS

A parameterized asynchronous FIFO designed in SystemVerilog, with a focus on clock-domain crossing (CDC), metastability mitigation, formal verification, FPGA implementation, and ASIC physical design.

The project covers the design and verification process from RTL development through simulation, formal property checking, FPGA synthesis, and ASIC RTL-to-GDS implementation.

## Project Status

**Core RTL implementation, simulation, formal verification, FPGA implementation, and ASIC physical-design flow completed.**

### Completed

- [x] Two-flop synchronizer with active-low asynchronous reset
- [x] Binary FIFO pointers and binary-to-Gray conversion
- [x] Two-way Gray-pointer synchronization
- [x] Write/read pointer next-state logic
- [x] Registered full and empty status logic
- [x] Dual-clock FIFO memory and top-level integration
- [x] Directed self-checking simulation
- [x] Overflow and underflow protection checks
- [x] Pointer stability checks during blocked operations
- [x] FIFO wrap-around, reuse, and recovery checks
- [x] Randomized traffic with a queue-based data-order scoreboard
- [x] Simulation-time SystemVerilog Assertions (SVA)
- [x] Repeated fill-and-drain stress testing
- [x] Reset during operation and recovery testing
- [x] Formal verification using SymbiYosys and Boolector
- [x] Vivado synthesis, implementation, and timing analysis
- [x] OpenROAD ASIC physical-design flow
- [x] Final GDS generation
- [x] DRC and LVS validation using the available community verification decks

---

## 1. Project Overview

The objective is to design and verify an asynchronous FIFO capable of transferring data between two independent clock domains.

The FIFO uses separate write and read clocks. Gray-coded pointers are synchronized between the clock domains to support full and empty detection while reducing the risk of incoherent multi-bit pointer sampling.

### Design configuration

| Parameter | Configuration |
|---|---|
| Design | Asynchronous FIFO |
| Top module | `async_fifo` |
| Data width | 8 bits |
| Address width | 3 bits |
| FIFO depth | 8 entries |
| Logical storage capacity | 64 bits |
| Write clock | 10 ns (100 MHz) |
| Read clock | 14 ns (~71.43 MHz) |
| Reset | Active-low asynchronous reset |
| ASIC platform | Nangate45 |

The design is parameterized, but the reported implementation results correspond to the configuration listed above.

## 2. Architecture and CDC Design

### 2.1 Two-flop synchronizer

The initial implementation is a basic two-flop synchronizer for transferring a single-bit asynchronous signal into a destination clock domain.

```text
                 Destination Clock

async_in ───────► FF1 ─────────► FF2 ─────────► sync_out
                   │               │
              First sampling   Destination
                 stage           signal
```

The first flip-flop samples the asynchronous input and may experience metastability if an input transition occurs close to the destination clock edge.

The second flip-flop provides additional time for the first stage to resolve before the signal is used by destination-domain logic.

The synchronizer uses an active-low asynchronous reset:

- `rst_n = 0`: reset
- `rst_n = 1`: normal operation

### 2.2 Gray-coded pointer synchronization

The FIFO uses binary pointers for memory addressing and Gray-coded pointers for clock-domain transfer.

The binary-to-Gray conversion is:

\[
G = B \oplus (B >> 1)
\]

Gray coding ensures that adjacent pointer values differ by one bit during normal sequential advancement. This reduces the risk of incoherent multi-bit sampling when pointers cross clock domains.

Separate synchronizer paths transfer the write pointer into the read clock domain and the read pointer into the write clock domain.

### 2.3 Full and empty detection

The synchronized Gray pointers are used by the FIFO status logic to determine whether the FIFO is full or empty.

The design uses registered status logic and next-state pointer calculations to control accepted write and read operations.

The FIFO prevents writes while full and reads while empty.

## 3. Simulation and Verification

The project uses focused module-level testbenches and a top-level FIFO testbench with independent write and read clocks.

The top-level testbench is named `tb_fifo_memory.sv`, although it instantiates and verifies the complete `async_fifo` DUT.

### 3.1 Directed tests

The directed sequence checks:

- Filling the FIFO and waiting for `full`.
- Rejecting a write while full.
- Confirming write-pointer stability during overflow.
- Reading an entry to free a slot and reusing the slot.
- Rejecting a read while empty.
- Writing and reading a recovery value after the FIFO becomes empty.

### 3.2 Randomized tests

Random write and read requests are generated on the negative edges of their respective clocks.

A queue-based reference model records accepted writes and compares accepted read data against the oldest expected value.

Counters track:

- Accepted writes
- Accepted reads
- Overflow attempts
- Underflow attempts

After random stimulus stops, the testbench drains outstanding reference-model entries using a bounded loop and checks that the DUT returns to empty.

**Scoreboard limitation:** The reference model uses the DUT's `full` and `empty` flags to identify accepted transactions. Therefore, it primarily checks data ordering for transactions accepted according to those flags. Directed protection checks and assertions provide additional control-logic checks.

### 3.3 Simulation-time assertions

Simulation-time SVA checks cover:

- Pointer stability during blocked operations.
- Gray-pointer transitions.
- Full and empty next-state equations.
- Pointer increments on accepted operations.

Bounded tasks prevent directed full/empty waits from waiting indefinitely.

The assertions passed in the recorded simulation run. They are not all independently proven by the formal verification configurations.

### 3.4 Latest recorded regression

| Metric | Result |
|---|---:|
| Total checks | 478 |
| Passed | 478 |
| Failed | 0 |
| Accepted randomized writes | 411 |
| Accepted randomized reads | 408 |
| Overflow attempts | 93 |
| Underflow attempts | 3 |

The recorded regression passed with **478/478 checks and zero failures**. Randomized counts can vary between runs.

These are simulation results, not a formal proof.

## 4. Formal Verification

Formal verification was performed using SymbiYosys (`sby`) with the Boolector SMT solver.

All nine listed proof configurations completed successfully.

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

The `formal/` directory contains the SymbiYosys configurations and their corresponding formal harnesses.

These proofs establish the properties encoded in those harnesses under their assumptions. They do not automatically prove every possible behavior of the complete design, nor do they establish physical metastability immunity.

## 5. FPGA Implementation — Vivado

The design was synthesized and implemented using AMD/Xilinx Vivado.

The implementation target reported by Vivado is an Artix-7 device, `7a12ti-csg325`, speed grade `-1L`.

### 5.1 Resource utilization

| Resource | Used | Available | Utilization |
|---|---:|---:|---:|
| LUT | 25 | 8,000 | 0.31% |
| LUTRAM | 6 | 5,000 | 0.12% |
| Flip-flops | 34 | 16,000 | 0.21% |
| I/O | 23 | 150 | 15.33% |

### 5.2 Timing and power estimates

| Metric | Result |
|---|---:|
| Worst Negative Slack (WNS) | +7.471 ns |
| Total Negative Slack (TNS) | 0.000 ns |
| Worst Hold Slack (WHS) | +0.122 ns |
| Total Hold Slack (THS) | 0.000 ns |
| Worst Pulse Width Slack (WPWS) | +3.750 ns |
| Total Pulse Width Negative Slack (TPWS) | 0.000 ns |
| Dynamic power estimate | 0.002 W |
| Static power estimate | 0.059 W |

The final timing summary reported zero failing setup, hold, and pulse-width endpoints for paths remaining under timing analysis.

Power values are Vivado estimates, not measurements from a physical FPGA board.

## 6. Timing Constraints and Clock-Domain Considerations

The project contains constraints for FPGA implementation and ASIC physical design. They serve related purposes but belong to different tool flows.

### 6.1 FPGA constraints — XDC

The file `constraints/async_fifo.xdc` is intended for the Vivado FPGA implementation flow.

It defines the two clocks:

```tcl
# Write clock: 100 MHz
create_clock -name write_clk -period 10.000 [get_ports write_clk]

# Read clock: approximately 71.43 MHz
create_clock -name read_clk -period 14.000 [get_ports read_clk]

# These clocks are asynchronous to each other
set_clock_groups -asynchronous \
    -group [get_clocks write_clk] \
    -group [get_clocks read_clk]
```

The constraints specify:

- `write_clk`: 10 ns period, corresponding to 100 MHz.
- `read_clk`: 14 ns period, corresponding to approximately 71.43 MHz.
- The two clocks are asynchronous and are declared as separate clock groups.

### 6.2 ASIC constraints — SDC

The ASIC flow uses Synopsys Design Constraints (SDC) for OpenROAD timing analysis.

The generated final constraint artifact is included at:

`asic/final/6_final.sdc`

It records the timing constraints associated with the final implementation.

The clock definitions and asynchronous relationship are important because the write and read domains are not synchronous to one another.

### 6.3 Important timing-analysis limitations

Declaring the clocks asynchronous excludes ordinary setup and hold timing analysis between paths belonging to those unrelated clock domains.

This is appropriate for the intended CDC architecture, but it also means that a clean timing summary does not prove that all CDC paths are physically safe.

The current constraint setup has the following limitations:

- No explicit input or output delay constraints are defined.
- No explicit Gray-pointer maximum-delay or bus-skew constraints are defined.
- Asynchronous clock grouping removes ordinary inter-clock setup/hold analysis.
- The reported timing results therefore do not constitute complete CDC timing signoff.

For a more complete implementation, Gray-pointer crossing paths should be evaluated with appropriate physical constraints, such as maximum-delay and bus-skew requirements, based on the implementation methodology and target platform.

CDC correctness also depends on the synchronizer structure, Gray-pointer transfer, reset behavior, and dual-clock memory implementation.

Physical metastability cannot be reproduced by ordinary RTL simulation or proved impossible by the formal checks in this project.

## 7. ASIC Physical Design — RTL to GDS

The design was taken through an ASIC physical-design flow using OpenROAD and the Nangate45 standard-cell platform.

The flow covers the major implementation stages:

<escape>RTL → Synthesis → Floorplanning → Global Placement → Clock Tree Synthesis → Global Routing → Detailed Routing → Final GDS</escape>

### 7.1 Implementation stages

| Stage | Description |
|---|---|
| Synthesis | Converts the RTL design into a standard-cell netlist. |
| Floorplanning | Establishes the core area, rows, and initial power-distribution planning. |
| Global placement | Places standard cells within the floorplan. |
| Clock tree synthesis | Builds the clock distribution network. |
| Global routing | Estimates routing paths and resource usage. |
| Detailed routing | Completes physical interconnections. |
| Final GDS generation | Produces the layout database for the implemented design. |

### 7.2 ASIC implementation configuration

| Parameter | Configuration |
|---|---|
| Top module | `async_fifo` |
| Platform | Nangate45 |
| Data width | 8 bits |
| FIFO depth | 8 entries |
| Write clock | 10 ns |
| Read clock | 14 ns |
| Core utilization target | 50% |

The logical FIFO storage is 64 bits. In this implementation, the memory is mapped to standard cells rather than a dedicated SRAM macro.

### 7.3 Final implementation results

| Metric | Result |
|---|---:|
| Synthesis cell area | 857.85 µm² |
| Final placed cell area | 885 µm² |
| Critical path delay | 0.4692 ns |
| Estimated total power | 0.315 mW |
| Worst Negative Slack (WNS) | 0.00 ns |
| Total Negative Slack (TNS) | 0.00 ns |
| Setup violations | 0 |
| Hold violations | 0 |
| Slew violations | 0 |
| Capacitance violations | 0 |
| Fanout violations | 0 |

These are tool-reported implementation results under the configured constraints. They should not be interpreted as complete CDC or signoff timing results.

Power is an implementation estimate, not a measured silicon value.

### 7.4 DRC and LVS validation

The final GDS was checked using the available FreePDK45 design-rule verification deck.

- DRC: zero reported violations.
- LVS: the full-chip GDS and CDL comparison reported matching netlists.

The LVS comparison used a project-specific modified community FreePDK45 deck, including a power/well global-connect adjustment.

These results demonstrate validation using the available community verification setup. They are not official foundry signoff results.

### 7.5 Final physical-design artifacts

The `asic/final/` directory contains:

- `6_final.gds` — final GDS layout.
- `6_final.def` — final design exchange format.
- `6_final.v` — final standard-cell netlist.
- `6_final.sdc` — final timing constraint artifact.

The `reports/` directory contains stage reports, synthesis statistics, DRC data, and selected physical-design visualizations.

## 8. Repository Structure

```text
async-fifo-cdc-formal/
│
├── asic/   
│   ├── final/
│   │   ├── 6_final.def
│   │   ├── 6_final.gds
│   │   ├── 6_final.sdc
│   │   └── 6_final.v
│   ├── lvs/
│   │   ├── async_fifo_extracted_test.cir
│   │   ├── async_fifo_lvs_reference.cdl
│   │   ├── async_fifo_reference.cdl
│   │   ├── generate_cdl.tcl
│   │   └── lvs_freepdk45_test.lylvs
│   ├── pdn/
│   │    └── README.md
│   └──── config.mk
│
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
├── reports/
│   ├── visualizations/
│   │   ├── .gitkeep
│   │   ├── final_congestion.webp.png
│   │   ├── final_ir_drop.webp.png
│   │   ├── final_routing.webp.png
│   │   └── final_worst_path.webp.png
│   ├── 1_Post_synthesis.rpt
│   ├── 2_floorplan_final.rpt
│   ├── 3_global_place.rpt
│   ├── 4_cts_final.rpt
│   ├── 5_global_route.rpt
│   ├── 6_drc.lyrdb
│   ├── 6_finish.rpt
│   ├── README.md
│   └── synth_stat.txt
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
├── screenshots/
│   ├── .gitkeep
│   ├── 01_Floorplan.png
│   ├── 02_Global_Placement.png
│   ├── 03_Clock_Tree_Synthesis.png
│   ├── 04_Global_Routing.png
│   ├── 05_Detailed_Routing.png
│   └── 06_Final_gds_Layout.png
│
├── scripts/
│   ├── README.md
│   ├── check_gds_geometry.rb
│   ├── check_layer_table.rb
│   ├── create_fifo_lyp.py
│   ├── list_gds_layers.rb
│   ├── view_cts.tcl
│   ├── view_detailed_route.tcl
│   ├── view_floorplan.tcl
│   ├── view_global_placement.tcl
│   └── view_global_route.tcl
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

## 9. Tools and Technologies

### RTL design and simulation
- SystemVerilog
- AMD/Xilinx Vivado 2026.1
- XSim

### Formal verification
- OSS CAD Suite
- SymbiYosys (`sby`)
- Boolector SMT solver

### ASIC physical design
- OpenROAD
- OpenROAD-flow-scripts
- Nangate45 standard-cell platform
- KLayout
- Ruby with the KLayout `RBA` API
- Python

## 10. Validation Scope and Limitations

### Completed validation

1. Module-level RTL simulation.
2. Directed self-checking top-level FIFO simulation.
3. Randomized queue-based data-order checking.
4. Four rounds of fill-and-drain stress testing.
5. Reset during operation, active requests, and partial occupancy.
6. Simulation-time SystemVerilog Assertions.
7. Formal proofs for the listed standalone modules and integrated FIFO properties.
8. Vivado synthesis and implementation.
9. FPGA timing summary and resource utilization review.
10. OpenROAD ASIC physical-design flow through final GDS generation.
11. DRC and LVS validation using the available community decks.

### Known limitations

- The simulation scoreboard uses the DUT's `full` and `empty` flags to determine accepted transactions.
- Formal verification proves only the properties encoded in the harnesses and under their assumptions.
- Asynchronous clock groups exclude ordinary timing analysis between clock domains.
- Explicit Gray-pointer maximum-delay and bus-skew constraints have not been added.
- Input and output delay constraints are not defined in the current clock constraint setup.
- RTL simulation and formal proofs do not establish that physical metastability is impossible.
- Power values are tool estimates, not physical measurements.
- No physical FPGA board validation has been performed.
- The ASIC implementation uses a community platform and verification decks; it is not a foundry-qualified tapeout or signoff flow.
- Additional parameter configurations and FIFO depths have not yet been explored.

## 11. Future Work

- Explore additional FIFO depths and parameter configurations.
- Add and evaluate explicit Gray-pointer crossing constraints.
- Extend formal properties and assumptions for additional parameter configurations.
- Investigate dedicated SRAM macro integration.
- Perform physical FPGA board validation if suitable hardware becomes available.
- Explore further optimization of area, timing, and power.

## Author

**Aman Singh**
