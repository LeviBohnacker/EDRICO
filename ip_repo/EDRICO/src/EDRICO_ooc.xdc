################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name M_AXI_ACLK_0 -period 10 [get_ports M_AXI_ACLK_0]
create_clock -name system_clk -period 10 [get_ports system_clk]
create_clock -name s00_axi_aclk_0 -period 10 [get_ports s00_axi_aclk_0]

################################################################################