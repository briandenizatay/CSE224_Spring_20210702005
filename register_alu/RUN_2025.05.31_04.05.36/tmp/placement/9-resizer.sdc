###############################################################################
# Created by write_sdc
# Sat May 31 04:06:02 2025
###############################################################################
current_design register_alu
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name core_clock -period 10.0000 [get_ports {clk}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
