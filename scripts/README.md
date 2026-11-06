# Scripts

This directory contains utility scripts used during the physical design and GDS inspection of the asynchronous FIFO.

## 1. OpenROAD GUI Scripts

These Tcl scripts load intermediate OpenROAD databases for visual inspection at different physical-design stages.

| Script | Database |
|---|---|
| `view_floorplan.tcl` | `2_floorplan.odb` |
| `view_global_placement.tcl` | `3_place.odb` |
| `view_cts.tcl` | `4_cts.odb` |
| `view_global_route.tcl` | `5_1_grt.odb` |
| `view_detailed_route.tcl` | `5_2_route.odb` |

**Requirements:** OpenROAD and access to the Nangate45 platform files and the corresponding ORFS result databases.

Set the required environment variables:

```bash
export PLATFORM_DIR="$HOME/OpenROAD-flow-scripts/flow/platforms/nangate45"
export RESULTS_DIR="/path/to/results/nangate45/async_fifo/base"
```

Run a script from the repository root:

```bash
openroad -gui scripts/view_floorplan.tcl
```

Replace the script name to inspect another stage.

## 2. GDS Inspection Scripts

These Ruby scripts use the KLayout Ruby API (`RBA`) to inspect the generated GDS file.

| Script | Purpose |
|---|---|
| `list_gds_layers.rb` | Lists the GDS layer/datatype pairs. |
| `check_layer_table.rb` | Displays layer indices and their corresponding layer/datatype pairs. |
| `check_gds_geometry.rb` | Counts shapes present on each GDS layer. |

Set the GDS file path:

```bash
export GDS_FILE="/path/to/6_final.gds"
```

Run using KLayout in batch mode:

```bash
klayout -b -r scripts/list_gds_layers.rb
klayout -b -r scripts/check_layer_table.rb
klayout -b -r scripts/check_gds_geometry.rb
```

## 3. Custom KLayout Layer Properties

`create_fifo_lyp.py` generates a custom KLayout layer-properties file (`async_fifo_custom.lyp`) with visibility settings and colors for the major routing, via, and process layers.

Run:

```bash
python3 scripts/create_fifo_lyp.py
```

The generated `.lyp` file can be loaded in KLayout to improve GDS visualization.

## Notes

- The OpenROAD Tcl scripts expect the relevant intermediate databases to exist in the specified results directory.
- The Ruby scripts require KLayout's scripting environment because they use the `RBA` API.
- The GDS inspection scripts require a valid GDS file supplied through `GDS_FILE`.
- These scripts are intended for inspection and visualization; they do not independently perform synthesis, placement, clock-tree synthesis, routing, or signoff.
