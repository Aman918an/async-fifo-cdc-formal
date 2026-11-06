###############################################################################
# Created by write_sdc
###############################################################################
current_design async_fifo
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name write_clk -period 10.0000 [get_ports {write_clk}]
set_propagated_clock [get_clocks {write_clk}]
create_clock -name read_clk -period 14.0000 [get_ports {read_clk}]
set_propagated_clock [get_clocks {read_clk}]
set_clock_groups -name group1 -asynchronous \
 -group [get_clocks {read_clk}]\
 -group [get_clocks {write_clk}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
