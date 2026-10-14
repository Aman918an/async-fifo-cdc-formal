# Asynchronous FIFO clock constraints

# Write clock: 10 ns period = 100 MHz
create_clock -name write_clk -period 10.000 [get_ports write_clk]

# Read clock: 14 ns period = approximately 71.43 MHz
create_clock -name read_clk -period 14.000 [get_ports read_clk]

# The write and read clocks are asynchronous.
set_clock_groups -asynchronous \
    -group [get_clocks write_clk] \
    -group [get_clocks read_clk]
