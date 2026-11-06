# Design identification
export DESIGN_NAME = async_fifo
export DESIGN_NICKNAME = async_fifo
export PLATFORM = nangate45

# RTL source files (relative to repository root)
export VERILOG_FILES = \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/../../../../rtl/async_fifo.sv \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/../../../../rtl/bin_to_gray.sv \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/../../../../rtl/fifo_memory.sv \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/../../../../rtl/fifo_status.sv \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/../../../../rtl/gray_pointer_sync.sv \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/../../../../rtl/read_pointer.sv \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/../../../../rtl/write_pointer.sv

# Use Yosys Slang for SystemVerilog elaboration
export SYNTH_HDL_FRONTEND = slang

# Timing constraints
export SDC_FILE = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

# Synthesis settings
export ABC_AREA = 1
export SYNTH_REPEATABLE_BUILD = 1

# Initial floorplanning settings
export CORE_UTILIZATION = 50
export PLACE_DENSITY_LB_ADDON = 0.20
export TNS_END_PERCENT = 100
