# Generate a CDL reference netlist from the final OpenROAD database.
#
# Required environment:
#   PLATFORM_DIR - Nangate45 platform directory
#   RESULTS_DIR  - OpenROAD final results directory
#   OUTPUT_DIR   - Directory for generated CDL

set platform $::env(PLATFORM_DIR)
set results  $::env(RESULTS_DIR)
set output   $::env(OUTPUT_DIR)

read_lef $platform/lef/NangateOpenCellLibrary.tech.lef
read_lef $platform/lef/NangateOpenCellLibrary.macro.mod.lef

read_db $results/6_final.odb

write_cdl 
    -masters $platform/cdl/NangateOpenCellLibrary.cdl 
    $output/async_fifo_reference.cdl
