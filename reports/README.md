# Physical Design Reports

This directory contains reports generated during the RTL-to-GDS implementation of the asynchronous FIFO using OpenROAD-flow-scripts and the Nangate45 standard-cell platform.

## Implementation Stages

| Report | Stage |
|---|---|
| `1_Post_synthesis.rpt` | Post-synthesis |
| `2_floorplan_final.rpt` | Floorplanning |
| `3_global_place.rpt` | Global placement |
| `4_cts_final.rpt` | Clock tree synthesis |
| `5_global_route.rpt` | Global routing |
| `6_finish.rpt` | Final implementation and timing analysis |
| `6_drc.lyrdb` | Detailed routing design-rule checks |
| `synth_stat.txt` | Synthesis statistics |

## Final Implementation Results

| Metric | Result |
|---|---:|
| Worst negative slack (WNS) | 0.00 ns |
| Total negative slack (TNS) | 0.00 ns |
| Worst positive slack | +9.58 ns |
| Setup violations | 0 |
| Hold violations | 0 |
| Max slew violations | 0 |
| Max capacitance violations | 0 |
| Max fanout violations | 0 |
| Estimated total power | 0.315 mW |
| Critical path delay | 0.4692 ns |

## Clock Analysis

| Clock | Period |
|---|---:|
| Write clock | 10 ns |
| Read clock | 14 ns |

The final report estimates minimum clock periods of 0.42 ns for the write clock and 0.49 ns for the read clock. These are tool-derived register-to-register STA estimates, not independently validated operating frequencies.

## Visualizations

The `visualizations/` directory contains OpenROAD-generated physical-design views:

- Final congestion
- IR-drop estimation
- Final routing
- Worst timing path

## Verification Scope and Limitations

- Timing results apply to the paths covered by the configured timing constraints.
- The asynchronous clock domains are declared asynchronous. Their cross-domain setup paths are therefore not covered by ordinary synchronous setup analysis.
- No explicit Gray-pointer bus-skew or maximum-delay constraints were applied.
- The power value is an OpenROAD estimate, not a measured silicon result.
- Zero reported violations should not be interpreted as complete CDC, timing, or foundry signoff.

These reports document the implementation results obtained from the Nangate45-based OpenROAD flow.
