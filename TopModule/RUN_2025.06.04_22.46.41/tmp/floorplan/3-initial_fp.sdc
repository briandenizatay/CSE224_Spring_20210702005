###############################################################################
# Created by write_sdc
# Wed Jun  4 22:46:49 2025
###############################################################################
current_design TopModule
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
