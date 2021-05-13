

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "mmCSR_AXI4_slave" "NUM_INSTANCES" "DEVICE_ID"  "C_mmCSR_AXI4_s_BASEADDR" "C_mmCSR_AXI4_s_HIGHADDR"
}
