# View asynchronous FIFO global placement in OpenROAD GUI

set platform $::env(PLATFORM_DIR)
set results  $::env(RESULTS_DIR)

read_lef $platform/lef/NangateOpenCellLibrary.tech.lef
read_lef $platform/lef/NangateOpenCellLibrary.macro.lef

read_db $results/3_place.odb

gui::show
