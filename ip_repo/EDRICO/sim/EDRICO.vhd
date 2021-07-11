--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
--Date        : Sun Jul 11 11:32:05 2021
--Host        : dickerlaptop running 64-bit Manjaro Linux
--Command     : generate_target EDRICO.bd
--Design      : EDRICO
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EDRICO is
  port (
    IR_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_0_arready : in STD_LOGIC;
    M_AXI_0_arvalid : out STD_LOGIC;
    M_AXI_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_0_awready : in STD_LOGIC;
    M_AXI_0_awvalid : out STD_LOGIC;
    M_AXI_0_bready : out STD_LOGIC;
    M_AXI_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_0_bvalid : in STD_LOGIC;
    M_AXI_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_rready : out STD_LOGIC;
    M_AXI_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_0_rvalid : in STD_LOGIC;
    M_AXI_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_wready : in STD_LOGIC;
    M_AXI_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_0_wvalid : out STD_LOGIC;
    M_AXI_ACLK_0 : in STD_LOGIC;
    M_AXI_ARESETN_0 : in STD_LOGIC;
    PC_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_0_arready : out STD_LOGIC;
    S00_AXI_0_arvalid : in STD_LOGIC;
    S00_AXI_0_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_0_awready : out STD_LOGIC;
    S00_AXI_0_awvalid : in STD_LOGIC;
    S00_AXI_0_bready : in STD_LOGIC;
    S00_AXI_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_0_bvalid : out STD_LOGIC;
    S00_AXI_0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_rready : in STD_LOGIC;
    S00_AXI_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_0_rvalid : out STD_LOGIC;
    S00_AXI_0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_wready : out STD_LOGIC;
    S00_AXI_0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_0_wvalid : in STD_LOGIC;
    mcause_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mcountinhibit_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mcycleH_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mcycle_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mepc_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mie_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    minstretH_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    minstret_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mip_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    misa_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mscratch_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mstatus_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mtval_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mtvec_debug_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk_0 : in STD_LOGIC;
    s00_axi_aresetn_0 : in STD_LOGIC;
    system_clk : in STD_LOGIC;
    system_reset_async : in STD_LOGIC;
    x10_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x11_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x12_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x13_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x14_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x15_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x16_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x17_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x18_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x19_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x1_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x20_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x21_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x22_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x23_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x24_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x25_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x26_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x27_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x28_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x29_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x2_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x30_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x31_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x3_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x4_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x5_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x6_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x7_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x8_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x9_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of EDRICO : entity is "EDRICO,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=EDRICO,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=16,numReposBlks=16,numNonXlnxBlks=8,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=8,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of EDRICO : entity is "EDRICO.hwdef";
end EDRICO;

architecture STRUCTURE of EDRICO is
  component EDRICO_ALU_0_0 is
  port (
    alu_op : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_a : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_b : in STD_LOGIC_VECTOR ( 31 downto 0 );
    alu_result : out STD_LOGIC_VECTOR ( 31 downto 0 );
    branch_re : out STD_LOGIC
  );
  end component EDRICO_ALU_0_0;
  component EDRICO_DEMUX_32_2_0_0 is
  port (
    C_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    control : in STD_LOGIC;
    A_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    B_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_DEMUX_32_2_0_0;
  component EDRICO_DataMaskUnit_0_0 is
  port (
    DMU_IN_MUX_ctrl : in STD_LOGIC;
    DMU_OUT_MUX_ctrl : in STD_LOGIC;
    mask_ctrl : in STD_LOGIC_VECTOR ( 2 downto 0 );
    data_bus_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    LoadBufferRegister : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_load : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data_store : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_DataMaskUnit_0_0;
  component EDRICO_LoadBufferRegister_0_0 is
  port (
    data_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    store_systemData : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_LoadBufferRegister_0_0;
  component EDRICO_MUX_A_0 is
  port (
    control : in STD_LOGIC_VECTOR ( 1 downto 0 );
    A_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_MUX_A_0;
  component EDRICO_MUX_B_0 is
  port (
    control : in STD_LOGIC;
    A_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_MUX_B_0;
  component EDRICO_MUX_EC_CSR_0 is
  port (
    control : in STD_LOGIC;
    read_CSR_CU : in STD_LOGIC;
    read_CSR_EC : in STD_LOGIC;
    write_CSR_CU : in STD_LOGIC;
    write_CSR_EC : in STD_LOGIC;
    CSR_address_CU : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CSR_address_EC : in STD_LOGIC_VECTOR ( 11 downto 0 );
    read_CSR : out STD_LOGIC;
    write_CSR : out STD_LOGIC;
    CSR_address : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component EDRICO_MUX_EC_CSR_0;
  component EDRICO_MUX_EC_RF_in_0 is
  port (
    control : in STD_LOGIC;
    A_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_MUX_EC_RF_in_0;
  component EDRICO_MUX_PMP_0 is
  port (
    control : in STD_LOGIC;
    A_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_MUX_PMP_0;
  component EDRICO_MUX_R_0 is
  port (
    control : in STD_LOGIC;
    A_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_MUX_R_0;
  component EDRICO_Exception_Control_0_0 is
  port (
    load_afe_P : in STD_LOGIC;
    storeAMO_afe_P : in STD_LOGIC;
    instruction_afe_P : in STD_LOGIC;
    load_ame_P : in STD_LOGIC;
    storeAMO_ame_P : in STD_LOGIC;
    instruction_ame_P : in STD_LOGIC;
    load_afe_AXI : in STD_LOGIC;
    storeAMO_afe_AXI : in STD_LOGIC;
    instruction_afe_AXI : in STD_LOGIC;
    iie_CU : in STD_LOGIC;
    ece_CU : in STD_LOGIC;
    be_CU : in STD_LOGIC;
    iie_CSR : in STD_LOGIC;
    si_CSR : in STD_LOGIC;
    ti_CSR : in STD_LOGIC;
    data_in_EC : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IR_dra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PMP_dra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PC_dra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ret : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    CSR_read_EC : out STD_LOGIC;
    CSR_write_EC : out STD_LOGIC;
    CSR_address_EC : out STD_LOGIC_VECTOR ( 11 downto 0 );
    data_out_EC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PC_dra_write : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PC_write : out STD_LOGIC;
    halt_core : out STD_LOGIC
  );
  end component EDRICO_Exception_Control_0_0;
  component EDRICO_PMP_PMA_checker_0_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    size : in STD_LOGIC_VECTOR ( 1 downto 0 );
    readWrite : in STD_LOGIC;
    instruction : in STD_LOGIC;
    enable : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpcfg_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_5 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_6 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_7 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_8 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_9 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_10 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_11 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_12 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_13 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_14 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_15 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpaddr_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_8 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_9 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_11 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_12 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_13 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_14 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_15 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    address_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    address_dra : out STD_LOGIC_VECTOR ( 31 downto 0 );
    enable_out : out STD_LOGIC;
    readWrite_out : out STD_LOGIC;
    instruction_out : out STD_LOGIC;
    size_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    load_ame_P : out STD_LOGIC;
    storeAMO_ame_P : out STD_LOGIC;
    instruction_ame_P : out STD_LOGIC;
    load_afe_P : out STD_LOGIC;
    storeAMO_afe_P : out STD_LOGIC;
    instruction_afe_P : out STD_LOGIC
  );
  end component EDRICO_PMP_PMA_checker_0_0;
  component EDRICO_RegisterFile_1_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    msip_dra : in STD_LOGIC;
    mtip_dra : in STD_LOGIC;
    CSR_save : in STD_LOGIC;
    CSR_address : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CSR_write : in STD_LOGIC;
    CSR_read : in STD_LOGIC;
    instr_finished : in STD_LOGIC;
    register_write : in STD_LOGIC_VECTOR ( 4 downto 0 );
    register_read_A : in STD_LOGIC_VECTOR ( 4 downto 0 );
    register_read_B : in STD_LOGIC_VECTOR ( 4 downto 0 );
    iie_CSR : out STD_LOGIC;
    mti_CSR : out STD_LOGIC;
    msi_CSR : out STD_LOGIC;
    data_bus_A : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data_bus_B : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpcfg_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_4 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_5 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_6 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_7 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_8 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_9 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_10 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_11 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_12 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_13 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_14 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpcfg_15 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmpaddr_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_4 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_5 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_6 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_7 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_8 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_9 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_11 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_12 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_13 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_14 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pmpaddr_15 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x4 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x5 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x6 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x7 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x8 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x9 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x11 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x12 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x13 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x14 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x15 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x16 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x17 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x18 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x19 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x21 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x22 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x23 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x24 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x25 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x26 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x27 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x28 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x29 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x30 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    x31 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mcycle_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mcycleH_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    minstret_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    minstretH_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mcountinhibit_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mstatus_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    misa_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mie_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mtvec_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mscratch_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mepc_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mcause_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mtval_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mip_debug : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_RegisterFile_1_0;
  component EDRICO_ControlUnit_0_0 is
  port (
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    memOP_finished : in STD_LOGIC;
    halt_core : in STD_LOGIC;
    store_systemData : in STD_LOGIC;
    IR_inp : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_bus_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    branch_re : in STD_LOGIC;
    PC_dra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pc_write : in STD_LOGIC;
    IR_dra : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PC_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PMP_enable : out STD_LOGIC;
    PMP_instruction : out STD_LOGIC;
    PMP_size : out STD_LOGIC_VECTOR ( 1 downto 0 );
    PMP_rw : out STD_LOGIC;
    DMU_IN_MUX_ctrl : out STD_LOGIC;
    DMU_OUT_MUX_ctrl : out STD_LOGIC;
    R_MUX_ctrl : out STD_LOGIC;
    PMP_MUX_ctrl : out STD_LOGIC;
    B_MUX_ctrl : out STD_LOGIC;
    A_MUX_ctrl : out STD_LOGIC_VECTOR ( 1 downto 0 );
    register_read_A : out STD_LOGIC_VECTOR ( 4 downto 0 );
    register_read_B : out STD_LOGIC_VECTOR ( 4 downto 0 );
    register_write : out STD_LOGIC_VECTOR ( 4 downto 0 );
    CSR_address : out STD_LOGIC_VECTOR ( 11 downto 0 );
    save_CSR : out STD_LOGIC;
    write_CSR : out STD_LOGIC;
    read_CSR : out STD_LOGIC;
    ALU_OP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    mask_ctrl : out STD_LOGIC_VECTOR ( 2 downto 0 );
    iie_CU : out STD_LOGIC;
    ece_CU : out STD_LOGIC;
    be_CU : out STD_LOGIC;
    ret : out STD_LOGIC;
    immediate : out STD_LOGIC_VECTOR ( 31 downto 0 );
    instr_finished : out STD_LOGIC
  );
  end component EDRICO_ControlUnit_0_0;
  component EDRICO_AXI4_lite_master_0_0 is
  port (
    M_AXI_ACLK : in STD_LOGIC;
    M_AXI_ARESETN : in STD_LOGIC;
    M_AXI_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    M_AXI_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC;
    M_AXI_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    M_AXI_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    M_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_BVALID : in STD_LOGIC;
    M_AXI_BREADY : out STD_LOGIC;
    enable : in STD_LOGIC;
    readWrite : in STD_LOGIC;
    instruction : in STD_LOGIC;
    size : in STD_LOGIC_VECTOR ( 1 downto 0 );
    halt_core : in STD_LOGIC;
    reset : in STD_LOGIC;
    address_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    memOp_finished : out STD_LOGIC;
    store_systemData : out STD_LOGIC;
    instruction_afe_AXI : out STD_LOGIC;
    storeAMO_afe_AXI : out STD_LOGIC;
    load_afe_AXI : out STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component EDRICO_AXI4_lite_master_0_0;
  component EDRICO_mmCSR_0_0 is
  port (
    msip : out STD_LOGIC;
    mtip : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  end component EDRICO_mmCSR_0_0;
  signal ALU_0_alu_result : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ALU_0_branch_re : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXI4_lite_master_0_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal AXI4_lite_master_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal AXI4_lite_master_0_M_AXI_ARREADY : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_ARVALID : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXI4_lite_master_0_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal AXI4_lite_master_0_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal AXI4_lite_master_0_M_AXI_AWREADY : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_AWVALID : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_BREADY : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal AXI4_lite_master_0_M_AXI_BVALID : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXI4_lite_master_0_M_AXI_RREADY : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal AXI4_lite_master_0_M_AXI_RVALID : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXI4_lite_master_0_M_AXI_WREADY : STD_LOGIC;
  signal AXI4_lite_master_0_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal AXI4_lite_master_0_M_AXI_WVALID : STD_LOGIC;
  signal AXI4_lite_master_0_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXI4_lite_master_0_instruction_afe_AXI : STD_LOGIC;
  signal AXI4_lite_master_0_load_afe_AXI : STD_LOGIC;
  signal AXI4_lite_master_0_memOp_finished : STD_LOGIC;
  signal AXI4_lite_master_0_storeAMO_afe_AXI : STD_LOGIC;
  signal AXI4_lite_master_0_store_systemData : STD_LOGIC;
  signal ControlUnit_0_ALU_OP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ControlUnit_0_A_MUX_ctrl : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ControlUnit_0_B_MUX_ctrl : STD_LOGIC;
  signal ControlUnit_0_CSR_address : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ControlUnit_0_DMU_IN_MUX_ctrl : STD_LOGIC;
  signal ControlUnit_0_DMU_OUT_MUX_ctrl : STD_LOGIC;
  signal ControlUnit_0_IR_dra : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ControlUnit_0_PC_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ControlUnit_0_PMP_MUX_ctrl : STD_LOGIC;
  signal ControlUnit_0_PMP_enable : STD_LOGIC;
  signal ControlUnit_0_PMP_instruction : STD_LOGIC;
  signal ControlUnit_0_PMP_rw : STD_LOGIC;
  signal ControlUnit_0_PMP_size : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ControlUnit_0_R_MUX_ctrl : STD_LOGIC;
  signal ControlUnit_0_be_CU : STD_LOGIC;
  signal ControlUnit_0_ece_CU : STD_LOGIC;
  signal ControlUnit_0_iie_CU : STD_LOGIC;
  signal ControlUnit_0_immediate : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ControlUnit_0_instr_finished : STD_LOGIC;
  signal ControlUnit_0_mask_ctrl : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ControlUnit_0_read_CSR : STD_LOGIC;
  signal ControlUnit_0_register_read_A : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ControlUnit_0_register_read_B : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ControlUnit_0_register_write : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ControlUnit_0_ret : STD_LOGIC;
  signal ControlUnit_0_save_CSR : STD_LOGIC;
  signal ControlUnit_0_write_CSR : STD_LOGIC;
  signal DEMUX_32_2_0_A_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DEMUX_32_2_0_B_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DataMaskUnit_0_data_load : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DataMaskUnit_0_data_store : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Exception_Control_0_CSR_address_EC : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal Exception_Control_0_CSR_read_EC : STD_LOGIC;
  signal Exception_Control_0_CSR_write_EC : STD_LOGIC;
  signal Exception_Control_0_PC_dra_write : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Exception_Control_0_PC_write : STD_LOGIC;
  signal Exception_Control_0_data_out_EC : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Exception_Control_0_halt_core : STD_LOGIC;
  signal LoadBufferRegister_0_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MUX_A_C_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MUX_B_C_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MUX_EC_CSR_CSR_address : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal MUX_EC_CSR_read_CSR : STD_LOGIC;
  signal MUX_EC_CSR_write_CSR : STD_LOGIC;
  signal MUX_EC_RF_in_C_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MUX_PMP_C_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MUX_R_C_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal M_AXI_ACLK_0_1 : STD_LOGIC;
  signal M_AXI_ARESETN_0_1 : STD_LOGIC;
  signal PMP_PMA_checker_0_address_dra : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PMP_PMA_checker_0_address_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PMP_PMA_checker_0_enable_out : STD_LOGIC;
  signal PMP_PMA_checker_0_instruction_afe_P : STD_LOGIC;
  signal PMP_PMA_checker_0_instruction_ame_P : STD_LOGIC;
  signal PMP_PMA_checker_0_instruction_out : STD_LOGIC;
  signal PMP_PMA_checker_0_load_afe_P : STD_LOGIC;
  signal PMP_PMA_checker_0_load_ame_P : STD_LOGIC;
  signal PMP_PMA_checker_0_readWrite_out : STD_LOGIC;
  signal PMP_PMA_checker_0_size_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PMP_PMA_checker_0_storeAMO_afe_P : STD_LOGIC;
  signal PMP_PMA_checker_0_storeAMO_ame_P : STD_LOGIC;
  signal RegisterFile_1_data_bus_A : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_data_bus_B : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_iie_CSR : STD_LOGIC;
  signal RegisterFile_1_mcause_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mcountinhibit_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mcycleH_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mcycle_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mepc_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mie_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_minstretH_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_minstret_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mip_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_misa_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mscratch_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_msi_CSR : STD_LOGIC;
  signal RegisterFile_1_mstatus_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mti_CSR : STD_LOGIC;
  signal RegisterFile_1_mtval_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_mtvec_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_11 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_12 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_13 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_14 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_15 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_4 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_5 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_6 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_7 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_8 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpaddr_9 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_pmpcfg_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_10 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_11 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_12 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_13 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_14 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_15 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_4 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_5 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_6 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_7 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_8 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_pmpcfg_9 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RegisterFile_1_x1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x11 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x12 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x13 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x14 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x15 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x16 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x17 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x18 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x19 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x20 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x21 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x22 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x23 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x24 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x25 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x26 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x27 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x28 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x29 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x30 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x31 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x4 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x5 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x6 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x7 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x8 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegisterFile_1_x9 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S00_AXI_0_1_ARADDR : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_0_1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_0_1_ARREADY : STD_LOGIC;
  signal S00_AXI_0_1_ARVALID : STD_LOGIC;
  signal S00_AXI_0_1_AWADDR : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal S00_AXI_0_1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S00_AXI_0_1_AWREADY : STD_LOGIC;
  signal S00_AXI_0_1_AWVALID : STD_LOGIC;
  signal S00_AXI_0_1_BREADY : STD_LOGIC;
  signal S00_AXI_0_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_0_1_BVALID : STD_LOGIC;
  signal S00_AXI_0_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S00_AXI_0_1_RREADY : STD_LOGIC;
  signal S00_AXI_0_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXI_0_1_RVALID : STD_LOGIC;
  signal S00_AXI_0_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S00_AXI_0_1_WREADY : STD_LOGIC;
  signal S00_AXI_0_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXI_0_1_WVALID : STD_LOGIC;
  signal clk_0_1 : STD_LOGIC;
  signal mmCSR_0_msip : STD_LOGIC;
  signal mmCSR_0_mtip : STD_LOGIC;
  signal reset_0_1 : STD_LOGIC;
  signal s00_axi_aclk_0_1 : STD_LOGIC;
  signal s00_axi_aresetn_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of M_AXI_0_arready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 ARREADY";
  attribute X_INTERFACE_INFO of M_AXI_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 ARVALID";
  attribute X_INTERFACE_INFO of M_AXI_0_awready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 AWREADY";
  attribute X_INTERFACE_INFO of M_AXI_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 AWVALID";
  attribute X_INTERFACE_INFO of M_AXI_0_bready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 BREADY";
  attribute X_INTERFACE_INFO of M_AXI_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 BVALID";
  attribute X_INTERFACE_INFO of M_AXI_0_rready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 RREADY";
  attribute X_INTERFACE_INFO of M_AXI_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 RVALID";
  attribute X_INTERFACE_INFO of M_AXI_0_wready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 WREADY";
  attribute X_INTERFACE_INFO of M_AXI_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 WVALID";
  attribute X_INTERFACE_INFO of M_AXI_ACLK_0 : signal is "xilinx.com:signal:clock:1.0 CLK.M_AXI_ACLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of M_AXI_ACLK_0 : signal is "XIL_INTERFACENAME CLK.M_AXI_ACLK_0, ASSOCIATED_BUSIF M_AXI_0, ASSOCIATED_RESET M_AXI_ARESETN_0:system_reset_async, CLK_DOMAIN EDRICO_M_AXI_ACLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of M_AXI_ARESETN_0 : signal is "xilinx.com:signal:reset:1.0 RST.M_AXI_ARESETN_0 RST";
  attribute X_INTERFACE_PARAMETER of M_AXI_ARESETN_0 : signal is "XIL_INTERFACENAME RST.M_AXI_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of S00_AXI_0_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARREADY";
  attribute X_INTERFACE_INFO of S00_AXI_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARVALID";
  attribute X_INTERFACE_INFO of S00_AXI_0_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWREADY";
  attribute X_INTERFACE_INFO of S00_AXI_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWVALID";
  attribute X_INTERFACE_INFO of S00_AXI_0_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 BREADY";
  attribute X_INTERFACE_INFO of S00_AXI_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 BVALID";
  attribute X_INTERFACE_INFO of S00_AXI_0_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 RREADY";
  attribute X_INTERFACE_INFO of S00_AXI_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 RVALID";
  attribute X_INTERFACE_INFO of S00_AXI_0_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 WREADY";
  attribute X_INTERFACE_INFO of S00_AXI_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 WVALID";
  attribute X_INTERFACE_INFO of s00_axi_aclk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.S00_AXI_ACLK_0 CLK";
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk_0 : signal is "XIL_INTERFACENAME CLK.S00_AXI_ACLK_0, ASSOCIATED_BUSIF S00_AXI_0, ASSOCIATED_RESET s00_axi_aresetn_0, CLK_DOMAIN EDRICO_s00_axi_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn_0 : signal is "xilinx.com:signal:reset:1.0 RST.S00_AXI_ARESETN_0 RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn_0 : signal is "XIL_INTERFACENAME RST.S00_AXI_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of system_clk : signal is "xilinx.com:signal:clock:1.0 CLK.SYSTEM_CLK CLK";
  attribute X_INTERFACE_PARAMETER of system_clk : signal is "XIL_INTERFACENAME CLK.SYSTEM_CLK, ASSOCIATED_RESET system_reset_async:system_reset_async, CLK_DOMAIN EDRICO_system_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of system_reset_async : signal is "xilinx.com:signal:reset:1.0 RST.SYSTEM_RESET_ASYNC RST";
  attribute X_INTERFACE_PARAMETER of system_reset_async : signal is "XIL_INTERFACENAME RST.SYSTEM_RESET_ASYNC, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of IR_debug : signal is "xilinx.com:signal:data:1.0 DATA.IR_DEBUG DATA";
  attribute X_INTERFACE_PARAMETER of IR_debug : signal is "XIL_INTERFACENAME DATA.IR_DEBUG, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of M_AXI_0_araddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 ARADDR";
  attribute X_INTERFACE_PARAMETER of M_AXI_0_araddr : signal is "XIL_INTERFACENAME M_AXI_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN EDRICO_M_AXI_ACLK_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXI_0_arcache : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 ARCACHE";
  attribute X_INTERFACE_INFO of M_AXI_0_arprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 ARPROT";
  attribute X_INTERFACE_INFO of M_AXI_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 AWADDR";
  attribute X_INTERFACE_INFO of M_AXI_0_awcache : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 AWCACHE";
  attribute X_INTERFACE_INFO of M_AXI_0_awprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 AWPROT";
  attribute X_INTERFACE_INFO of M_AXI_0_bresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 BRESP";
  attribute X_INTERFACE_INFO of M_AXI_0_rdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 RDATA";
  attribute X_INTERFACE_INFO of M_AXI_0_rresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 RRESP";
  attribute X_INTERFACE_INFO of M_AXI_0_wdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 WDATA";
  attribute X_INTERFACE_INFO of M_AXI_0_wstrb : signal is "xilinx.com:interface:aximm:1.0 M_AXI_0 WSTRB";
  attribute X_INTERFACE_INFO of PC_debug : signal is "xilinx.com:signal:data:1.0 DATA.PC_DEBUG DATA";
  attribute X_INTERFACE_PARAMETER of PC_debug : signal is "XIL_INTERFACENAME DATA.PC_DEBUG, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of S00_AXI_0_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARADDR";
  attribute X_INTERFACE_PARAMETER of S00_AXI_0_araddr : signal is "XIL_INTERFACENAME S00_AXI_0, ADDR_WIDTH 26, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN EDRICO_s00_axi_aclk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of S00_AXI_0_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARPROT";
  attribute X_INTERFACE_INFO of S00_AXI_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWADDR";
  attribute X_INTERFACE_INFO of S00_AXI_0_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWPROT";
  attribute X_INTERFACE_INFO of S00_AXI_0_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 BRESP";
  attribute X_INTERFACE_INFO of S00_AXI_0_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 RDATA";
  attribute X_INTERFACE_INFO of S00_AXI_0_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 RRESP";
  attribute X_INTERFACE_INFO of S00_AXI_0_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 WDATA";
  attribute X_INTERFACE_INFO of S00_AXI_0_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_0 WSTRB";
begin
  AXI4_lite_master_0_M_AXI_ARREADY <= M_AXI_0_arready;
  AXI4_lite_master_0_M_AXI_AWREADY <= M_AXI_0_awready;
  AXI4_lite_master_0_M_AXI_BRESP(1 downto 0) <= M_AXI_0_bresp(1 downto 0);
  AXI4_lite_master_0_M_AXI_BVALID <= M_AXI_0_bvalid;
  AXI4_lite_master_0_M_AXI_RDATA(31 downto 0) <= M_AXI_0_rdata(31 downto 0);
  AXI4_lite_master_0_M_AXI_RRESP(1 downto 0) <= M_AXI_0_rresp(1 downto 0);
  AXI4_lite_master_0_M_AXI_RVALID <= M_AXI_0_rvalid;
  AXI4_lite_master_0_M_AXI_WREADY <= M_AXI_0_wready;
  IR_debug(31 downto 0) <= ControlUnit_0_IR_dra(31 downto 0);
  M_AXI_0_araddr(31 downto 0) <= AXI4_lite_master_0_M_AXI_ARADDR(31 downto 0);
  M_AXI_0_arcache(3 downto 0) <= AXI4_lite_master_0_M_AXI_ARCACHE(3 downto 0);
  M_AXI_0_arprot(2 downto 0) <= AXI4_lite_master_0_M_AXI_ARPROT(2 downto 0);
  M_AXI_0_arvalid <= AXI4_lite_master_0_M_AXI_ARVALID;
  M_AXI_0_awaddr(31 downto 0) <= AXI4_lite_master_0_M_AXI_AWADDR(31 downto 0);
  M_AXI_0_awcache(3 downto 0) <= AXI4_lite_master_0_M_AXI_AWCACHE(3 downto 0);
  M_AXI_0_awprot(2 downto 0) <= AXI4_lite_master_0_M_AXI_AWPROT(2 downto 0);
  M_AXI_0_awvalid <= AXI4_lite_master_0_M_AXI_AWVALID;
  M_AXI_0_bready <= AXI4_lite_master_0_M_AXI_BREADY;
  M_AXI_0_rready <= AXI4_lite_master_0_M_AXI_RREADY;
  M_AXI_0_wdata(31 downto 0) <= AXI4_lite_master_0_M_AXI_WDATA(31 downto 0);
  M_AXI_0_wstrb(3 downto 0) <= AXI4_lite_master_0_M_AXI_WSTRB(3 downto 0);
  M_AXI_0_wvalid <= AXI4_lite_master_0_M_AXI_WVALID;
  M_AXI_ACLK_0_1 <= M_AXI_ACLK_0;
  M_AXI_ARESETN_0_1 <= M_AXI_ARESETN_0;
  PC_debug(31 downto 0) <= ControlUnit_0_PC_out(31 downto 0);
  S00_AXI_0_1_ARADDR(15 downto 0) <= S00_AXI_0_araddr(15 downto 0);
  S00_AXI_0_1_ARPROT(2 downto 0) <= S00_AXI_0_arprot(2 downto 0);
  S00_AXI_0_1_ARVALID <= S00_AXI_0_arvalid;
  S00_AXI_0_1_AWADDR(15 downto 0) <= S00_AXI_0_awaddr(15 downto 0);
  S00_AXI_0_1_AWPROT(2 downto 0) <= S00_AXI_0_awprot(2 downto 0);
  S00_AXI_0_1_AWVALID <= S00_AXI_0_awvalid;
  S00_AXI_0_1_BREADY <= S00_AXI_0_bready;
  S00_AXI_0_1_RREADY <= S00_AXI_0_rready;
  S00_AXI_0_1_WDATA(31 downto 0) <= S00_AXI_0_wdata(31 downto 0);
  S00_AXI_0_1_WSTRB(3 downto 0) <= S00_AXI_0_wstrb(3 downto 0);
  S00_AXI_0_1_WVALID <= S00_AXI_0_wvalid;
  S00_AXI_0_arready <= S00_AXI_0_1_ARREADY;
  S00_AXI_0_awready <= S00_AXI_0_1_AWREADY;
  S00_AXI_0_bresp(1 downto 0) <= S00_AXI_0_1_BRESP(1 downto 0);
  S00_AXI_0_bvalid <= S00_AXI_0_1_BVALID;
  S00_AXI_0_rdata(31 downto 0) <= S00_AXI_0_1_RDATA(31 downto 0);
  S00_AXI_0_rresp(1 downto 0) <= S00_AXI_0_1_RRESP(1 downto 0);
  S00_AXI_0_rvalid <= S00_AXI_0_1_RVALID;
  S00_AXI_0_wready <= S00_AXI_0_1_WREADY;
  clk_0_1 <= system_clk;
  mcause_debug_0(31 downto 0) <= RegisterFile_1_mcause_debug(31 downto 0);
  mcountinhibit_debug_0(31 downto 0) <= RegisterFile_1_mcountinhibit_debug(31 downto 0);
  mcycleH_debug_0(31 downto 0) <= RegisterFile_1_mcycleH_debug(31 downto 0);
  mcycle_debug_0(31 downto 0) <= RegisterFile_1_mcycle_debug(31 downto 0);
  mepc_debug_0(31 downto 0) <= RegisterFile_1_mepc_debug(31 downto 0);
  mie_debug_0(31 downto 0) <= RegisterFile_1_mie_debug(31 downto 0);
  minstretH_debug_0(31 downto 0) <= RegisterFile_1_minstretH_debug(31 downto 0);
  minstret_debug_0(31 downto 0) <= RegisterFile_1_minstret_debug(31 downto 0);
  mip_debug_0(31 downto 0) <= RegisterFile_1_mip_debug(31 downto 0);
  misa_debug_0(31 downto 0) <= RegisterFile_1_misa_debug(31 downto 0);
  mscratch_debug_0(31 downto 0) <= RegisterFile_1_mscratch_debug(31 downto 0);
  mstatus_debug_0(31 downto 0) <= RegisterFile_1_mstatus_debug(31 downto 0);
  mtval_debug_0(31 downto 0) <= RegisterFile_1_mtval_debug(31 downto 0);
  mtvec_debug_0(31 downto 0) <= RegisterFile_1_mtvec_debug(31 downto 0);
  reset_0_1 <= system_reset_async;
  s00_axi_aclk_0_1 <= s00_axi_aclk_0;
  s00_axi_aresetn_0_1 <= s00_axi_aresetn_0;
  x10_0(31 downto 0) <= RegisterFile_1_x10(31 downto 0);
  x11_0(31 downto 0) <= RegisterFile_1_x11(31 downto 0);
  x12_0(31 downto 0) <= RegisterFile_1_x12(31 downto 0);
  x13_0(31 downto 0) <= RegisterFile_1_x13(31 downto 0);
  x14_0(31 downto 0) <= RegisterFile_1_x14(31 downto 0);
  x15_0(31 downto 0) <= RegisterFile_1_x15(31 downto 0);
  x16_0(31 downto 0) <= RegisterFile_1_x16(31 downto 0);
  x17_0(31 downto 0) <= RegisterFile_1_x17(31 downto 0);
  x18_0(31 downto 0) <= RegisterFile_1_x18(31 downto 0);
  x19_0(31 downto 0) <= RegisterFile_1_x19(31 downto 0);
  x1_0(31 downto 0) <= RegisterFile_1_x1(31 downto 0);
  x20_0(31 downto 0) <= RegisterFile_1_x20(31 downto 0);
  x21_0(31 downto 0) <= RegisterFile_1_x21(31 downto 0);
  x22_0(31 downto 0) <= RegisterFile_1_x22(31 downto 0);
  x23_0(31 downto 0) <= RegisterFile_1_x23(31 downto 0);
  x24_0(31 downto 0) <= RegisterFile_1_x24(31 downto 0);
  x25_0(31 downto 0) <= RegisterFile_1_x25(31 downto 0);
  x26_0(31 downto 0) <= RegisterFile_1_x26(31 downto 0);
  x27_0(31 downto 0) <= RegisterFile_1_x27(31 downto 0);
  x28_0(31 downto 0) <= RegisterFile_1_x28(31 downto 0);
  x29_0(31 downto 0) <= RegisterFile_1_x29(31 downto 0);
  x2_0(31 downto 0) <= RegisterFile_1_x2(31 downto 0);
  x30_0(31 downto 0) <= RegisterFile_1_x30(31 downto 0);
  x31_0(31 downto 0) <= RegisterFile_1_x31(31 downto 0);
  x3_0(31 downto 0) <= RegisterFile_1_x3(31 downto 0);
  x4_0(31 downto 0) <= RegisterFile_1_x4(31 downto 0);
  x5_0(31 downto 0) <= RegisterFile_1_x5(31 downto 0);
  x6_0(31 downto 0) <= RegisterFile_1_x6(31 downto 0);
  x7_0(31 downto 0) <= RegisterFile_1_x7(31 downto 0);
  x8_0(31 downto 0) <= RegisterFile_1_x8(31 downto 0);
  x9_0(31 downto 0) <= RegisterFile_1_x9(31 downto 0);
ALU_0: component EDRICO_ALU_0_0
     port map (
      alu_op(3 downto 0) => ControlUnit_0_ALU_OP(3 downto 0),
      alu_result(31 downto 0) => ALU_0_alu_result(31 downto 0),
      branch_re => ALU_0_branch_re,
      in_a(31 downto 0) => MUX_A_C_out(31 downto 0),
      in_b(31 downto 0) => MUX_B_C_out(31 downto 0)
    );
AXI4_lite_master_0: component EDRICO_AXI4_lite_master_0_0
     port map (
      M_AXI_ACLK => M_AXI_ACLK_0_1,
      M_AXI_ARADDR(31 downto 0) => AXI4_lite_master_0_M_AXI_ARADDR(31 downto 0),
      M_AXI_ARCACHE(3 downto 0) => AXI4_lite_master_0_M_AXI_ARCACHE(3 downto 0),
      M_AXI_ARESETN => M_AXI_ARESETN_0_1,
      M_AXI_ARPROT(2 downto 0) => AXI4_lite_master_0_M_AXI_ARPROT(2 downto 0),
      M_AXI_ARREADY => AXI4_lite_master_0_M_AXI_ARREADY,
      M_AXI_ARVALID => AXI4_lite_master_0_M_AXI_ARVALID,
      M_AXI_AWADDR(31 downto 0) => AXI4_lite_master_0_M_AXI_AWADDR(31 downto 0),
      M_AXI_AWCACHE(3 downto 0) => AXI4_lite_master_0_M_AXI_AWCACHE(3 downto 0),
      M_AXI_AWPROT(2 downto 0) => AXI4_lite_master_0_M_AXI_AWPROT(2 downto 0),
      M_AXI_AWREADY => AXI4_lite_master_0_M_AXI_AWREADY,
      M_AXI_AWVALID => AXI4_lite_master_0_M_AXI_AWVALID,
      M_AXI_BREADY => AXI4_lite_master_0_M_AXI_BREADY,
      M_AXI_BRESP(1 downto 0) => AXI4_lite_master_0_M_AXI_BRESP(1 downto 0),
      M_AXI_BVALID => AXI4_lite_master_0_M_AXI_BVALID,
      M_AXI_RDATA(31 downto 0) => AXI4_lite_master_0_M_AXI_RDATA(31 downto 0),
      M_AXI_RREADY => AXI4_lite_master_0_M_AXI_RREADY,
      M_AXI_RRESP(1 downto 0) => AXI4_lite_master_0_M_AXI_RRESP(1 downto 0),
      M_AXI_RVALID => AXI4_lite_master_0_M_AXI_RVALID,
      M_AXI_WDATA(31 downto 0) => AXI4_lite_master_0_M_AXI_WDATA(31 downto 0),
      M_AXI_WREADY => AXI4_lite_master_0_M_AXI_WREADY,
      M_AXI_WSTRB(3 downto 0) => AXI4_lite_master_0_M_AXI_WSTRB(3 downto 0),
      M_AXI_WVALID => AXI4_lite_master_0_M_AXI_WVALID,
      address_in(31 downto 0) => PMP_PMA_checker_0_address_out(31 downto 0),
      data_in(31 downto 0) => DataMaskUnit_0_data_store(31 downto 0),
      data_out(31 downto 0) => AXI4_lite_master_0_data_out(31 downto 0),
      enable => PMP_PMA_checker_0_enable_out,
      halt_core => Exception_Control_0_halt_core,
      instruction => PMP_PMA_checker_0_instruction_out,
      instruction_afe_AXI => AXI4_lite_master_0_instruction_afe_AXI,
      load_afe_AXI => AXI4_lite_master_0_load_afe_AXI,
      memOp_finished => AXI4_lite_master_0_memOp_finished,
      readWrite => PMP_PMA_checker_0_readWrite_out,
      reset => reset_0_1,
      size(1 downto 0) => PMP_PMA_checker_0_size_out(1 downto 0),
      storeAMO_afe_AXI => AXI4_lite_master_0_storeAMO_afe_AXI,
      store_systemData => AXI4_lite_master_0_store_systemData
    );
ControlUnit_0: component EDRICO_ControlUnit_0_0
     port map (
      ALU_OP(3 downto 0) => ControlUnit_0_ALU_OP(3 downto 0),
      A_MUX_ctrl(1 downto 0) => ControlUnit_0_A_MUX_ctrl(1 downto 0),
      B_MUX_ctrl => ControlUnit_0_B_MUX_ctrl,
      CSR_address(11 downto 0) => ControlUnit_0_CSR_address(11 downto 0),
      DMU_IN_MUX_ctrl => ControlUnit_0_DMU_IN_MUX_ctrl,
      DMU_OUT_MUX_ctrl => ControlUnit_0_DMU_OUT_MUX_ctrl,
      IR_dra(31 downto 0) => ControlUnit_0_IR_dra(31 downto 0),
      IR_inp(31 downto 0) => AXI4_lite_master_0_data_out(31 downto 0),
      PC_dra(31 downto 0) => Exception_Control_0_PC_dra_write(31 downto 0),
      PC_out(31 downto 0) => ControlUnit_0_PC_out(31 downto 0),
      PMP_MUX_ctrl => ControlUnit_0_PMP_MUX_ctrl,
      PMP_enable => ControlUnit_0_PMP_enable,
      PMP_instruction => ControlUnit_0_PMP_instruction,
      PMP_rw => ControlUnit_0_PMP_rw,
      PMP_size(1 downto 0) => ControlUnit_0_PMP_size(1 downto 0),
      R_MUX_ctrl => ControlUnit_0_R_MUX_ctrl,
      be_CU => ControlUnit_0_be_CU,
      branch_re => ALU_0_branch_re,
      clk => clk_0_1,
      data_bus_B(31 downto 0) => DEMUX_32_2_0_A_out(31 downto 0),
      ece_CU => ControlUnit_0_ece_CU,
      halt_core => Exception_Control_0_halt_core,
      iie_CU => ControlUnit_0_iie_CU,
      immediate(31 downto 0) => ControlUnit_0_immediate(31 downto 0),
      instr_finished => ControlUnit_0_instr_finished,
      mask_ctrl(2 downto 0) => ControlUnit_0_mask_ctrl(2 downto 0),
      memOP_finished => AXI4_lite_master_0_memOp_finished,
      pc_write => Exception_Control_0_PC_write,
      read_CSR => ControlUnit_0_read_CSR,
      register_read_A(4 downto 0) => ControlUnit_0_register_read_A(4 downto 0),
      register_read_B(4 downto 0) => ControlUnit_0_register_read_B(4 downto 0),
      register_write(4 downto 0) => ControlUnit_0_register_write(4 downto 0),
      reset => reset_0_1,
      ret => ControlUnit_0_ret,
      save_CSR => ControlUnit_0_save_CSR,
      store_systemData => AXI4_lite_master_0_store_systemData,
      write_CSR => ControlUnit_0_write_CSR
    );
DEMUX_32_2_0: component EDRICO_DEMUX_32_2_0_0
     port map (
      A_out(31 downto 0) => DEMUX_32_2_0_A_out(31 downto 0),
      B_out(31 downto 0) => DEMUX_32_2_0_B_out(31 downto 0),
      C_in(31 downto 0) => RegisterFile_1_data_bus_B(31 downto 0),
      control => Exception_Control_0_halt_core
    );
DataMaskUnit_0: component EDRICO_DataMaskUnit_0_0
     port map (
      DMU_IN_MUX_ctrl => ControlUnit_0_DMU_IN_MUX_ctrl,
      DMU_OUT_MUX_ctrl => ControlUnit_0_DMU_OUT_MUX_ctrl,
      LoadBufferRegister(31 downto 0) => LoadBufferRegister_0_data_out(31 downto 0),
      data_bus_A(31 downto 0) => RegisterFile_1_data_bus_A(31 downto 0),
      data_load(31 downto 0) => DataMaskUnit_0_data_load(31 downto 0),
      data_store(31 downto 0) => DataMaskUnit_0_data_store(31 downto 0),
      mask_ctrl(2 downto 0) => ControlUnit_0_mask_ctrl(2 downto 0)
    );
Exception_Control_0: component EDRICO_Exception_Control_0_0
     port map (
      CSR_address_EC(11 downto 0) => Exception_Control_0_CSR_address_EC(11 downto 0),
      CSR_read_EC => Exception_Control_0_CSR_read_EC,
      CSR_write_EC => Exception_Control_0_CSR_write_EC,
      IR_dra(31 downto 0) => ControlUnit_0_IR_dra(31 downto 0),
      PC_dra(31 downto 0) => ControlUnit_0_PC_out(31 downto 0),
      PC_dra_write(31 downto 0) => Exception_Control_0_PC_dra_write(31 downto 0),
      PC_write => Exception_Control_0_PC_write,
      PMP_dra(31 downto 0) => PMP_PMA_checker_0_address_dra(31 downto 0),
      be_CU => ControlUnit_0_be_CU,
      clk => clk_0_1,
      data_in_EC(31 downto 0) => DEMUX_32_2_0_B_out(31 downto 0),
      data_out_EC(31 downto 0) => Exception_Control_0_data_out_EC(31 downto 0),
      ece_CU => ControlUnit_0_ece_CU,
      halt_core => Exception_Control_0_halt_core,
      iie_CSR => RegisterFile_1_iie_CSR,
      iie_CU => ControlUnit_0_iie_CU,
      instruction_afe_AXI => AXI4_lite_master_0_instruction_afe_AXI,
      instruction_afe_P => PMP_PMA_checker_0_instruction_afe_P,
      instruction_ame_P => PMP_PMA_checker_0_instruction_ame_P,
      load_afe_AXI => AXI4_lite_master_0_load_afe_AXI,
      load_afe_P => PMP_PMA_checker_0_load_afe_P,
      load_ame_P => PMP_PMA_checker_0_load_ame_P,
      reset => reset_0_1,
      ret => ControlUnit_0_ret,
      si_CSR => RegisterFile_1_msi_CSR,
      storeAMO_afe_AXI => AXI4_lite_master_0_storeAMO_afe_AXI,
      storeAMO_afe_P => PMP_PMA_checker_0_storeAMO_afe_P,
      storeAMO_ame_P => PMP_PMA_checker_0_storeAMO_ame_P,
      ti_CSR => RegisterFile_1_mti_CSR
    );
LoadBufferRegister_0: component EDRICO_LoadBufferRegister_0_0
     port map (
      clk => clk_0_1,
      data_in(31 downto 0) => AXI4_lite_master_0_data_out(31 downto 0),
      data_out(31 downto 0) => LoadBufferRegister_0_data_out(31 downto 0),
      reset => reset_0_1,
      store_systemData => AXI4_lite_master_0_store_systemData
    );
MUX_A: component EDRICO_MUX_A_0
     port map (
      A_in(31 downto 0) => ControlUnit_0_immediate(31 downto 0),
      B_in(31 downto 0) => RegisterFile_1_data_bus_A(31 downto 0),
      C_out(31 downto 0) => MUX_A_C_out(31 downto 0),
      control(1 downto 0) => ControlUnit_0_A_MUX_ctrl(1 downto 0)
    );
MUX_B: component EDRICO_MUX_B_0
     port map (
      A_in(31 downto 0) => ControlUnit_0_PC_out(31 downto 0),
      B_in(31 downto 0) => DEMUX_32_2_0_A_out(31 downto 0),
      C_out(31 downto 0) => MUX_B_C_out(31 downto 0),
      control => ControlUnit_0_B_MUX_ctrl
    );
MUX_EC_CSR: component EDRICO_MUX_EC_CSR_0
     port map (
      CSR_address(11 downto 0) => MUX_EC_CSR_CSR_address(11 downto 0),
      CSR_address_CU(11 downto 0) => ControlUnit_0_CSR_address(11 downto 0),
      CSR_address_EC(11 downto 0) => Exception_Control_0_CSR_address_EC(11 downto 0),
      control => Exception_Control_0_halt_core,
      read_CSR => MUX_EC_CSR_read_CSR,
      read_CSR_CU => ControlUnit_0_read_CSR,
      read_CSR_EC => Exception_Control_0_CSR_read_EC,
      write_CSR => MUX_EC_CSR_write_CSR,
      write_CSR_CU => ControlUnit_0_write_CSR,
      write_CSR_EC => Exception_Control_0_CSR_write_EC
    );
MUX_EC_RF_in: component EDRICO_MUX_EC_RF_in_0
     port map (
      A_in(31 downto 0) => MUX_R_C_out(31 downto 0),
      B_in(31 downto 0) => Exception_Control_0_data_out_EC(31 downto 0),
      C_out(31 downto 0) => MUX_EC_RF_in_C_out(31 downto 0),
      control => Exception_Control_0_halt_core
    );
MUX_PMP: component EDRICO_MUX_PMP_0
     port map (
      A_in(31 downto 0) => ControlUnit_0_PC_out(31 downto 0),
      B_in(31 downto 0) => ALU_0_alu_result(31 downto 0),
      C_out(31 downto 0) => MUX_PMP_C_out(31 downto 0),
      control => ControlUnit_0_PMP_MUX_ctrl
    );
MUX_R: component EDRICO_MUX_R_0
     port map (
      A_in(31 downto 0) => DataMaskUnit_0_data_load(31 downto 0),
      B_in(31 downto 0) => ALU_0_alu_result(31 downto 0),
      C_out(31 downto 0) => MUX_R_C_out(31 downto 0),
      control => ControlUnit_0_R_MUX_ctrl
    );
PMP_PMA_checker_0: component EDRICO_PMP_PMA_checker_0_0
     port map (
      address(31 downto 0) => MUX_PMP_C_out(31 downto 0),
      address_dra(31 downto 0) => PMP_PMA_checker_0_address_dra(31 downto 0),
      address_out(31 downto 0) => PMP_PMA_checker_0_address_out(31 downto 0),
      clk => clk_0_1,
      enable => ControlUnit_0_PMP_enable,
      enable_out => PMP_PMA_checker_0_enable_out,
      instruction => ControlUnit_0_PMP_instruction,
      instruction_afe_P => PMP_PMA_checker_0_instruction_afe_P,
      instruction_ame_P => PMP_PMA_checker_0_instruction_ame_P,
      instruction_out => PMP_PMA_checker_0_instruction_out,
      load_afe_P => PMP_PMA_checker_0_load_afe_P,
      load_ame_P => PMP_PMA_checker_0_load_ame_P,
      pmpaddr_0(31 downto 0) => RegisterFile_1_pmpaddr_0(31 downto 0),
      pmpaddr_1(31 downto 0) => RegisterFile_1_pmpaddr_1(31 downto 0),
      pmpaddr_10(31 downto 0) => RegisterFile_1_pmpaddr_10(31 downto 0),
      pmpaddr_11(31 downto 0) => RegisterFile_1_pmpaddr_11(31 downto 0),
      pmpaddr_12(31 downto 0) => RegisterFile_1_pmpaddr_12(31 downto 0),
      pmpaddr_13(31 downto 0) => RegisterFile_1_pmpaddr_13(31 downto 0),
      pmpaddr_14(31 downto 0) => RegisterFile_1_pmpaddr_14(31 downto 0),
      pmpaddr_15(31 downto 0) => RegisterFile_1_pmpaddr_15(31 downto 0),
      pmpaddr_2(31 downto 0) => RegisterFile_1_pmpaddr_2(31 downto 0),
      pmpaddr_3(31 downto 0) => RegisterFile_1_pmpaddr_3(31 downto 0),
      pmpaddr_4(31 downto 0) => RegisterFile_1_pmpaddr_4(31 downto 0),
      pmpaddr_5(31 downto 0) => RegisterFile_1_pmpaddr_5(31 downto 0),
      pmpaddr_6(31 downto 0) => RegisterFile_1_pmpaddr_6(31 downto 0),
      pmpaddr_7(31 downto 0) => RegisterFile_1_pmpaddr_7(31 downto 0),
      pmpaddr_8(31 downto 0) => RegisterFile_1_pmpaddr_8(31 downto 0),
      pmpaddr_9(31 downto 0) => RegisterFile_1_pmpaddr_9(31 downto 0),
      pmpcfg_0(7 downto 0) => RegisterFile_1_pmpcfg_0(7 downto 0),
      pmpcfg_1(7 downto 0) => RegisterFile_1_pmpcfg_1(7 downto 0),
      pmpcfg_10(7 downto 0) => RegisterFile_1_pmpcfg_10(7 downto 0),
      pmpcfg_11(7 downto 0) => RegisterFile_1_pmpcfg_11(7 downto 0),
      pmpcfg_12(7 downto 0) => RegisterFile_1_pmpcfg_12(7 downto 0),
      pmpcfg_13(7 downto 0) => RegisterFile_1_pmpcfg_13(7 downto 0),
      pmpcfg_14(7 downto 0) => RegisterFile_1_pmpcfg_14(7 downto 0),
      pmpcfg_15(7 downto 0) => RegisterFile_1_pmpcfg_15(7 downto 0),
      pmpcfg_2(7 downto 0) => RegisterFile_1_pmpcfg_2(7 downto 0),
      pmpcfg_3(7 downto 0) => RegisterFile_1_pmpcfg_3(7 downto 0),
      pmpcfg_4(7 downto 0) => RegisterFile_1_pmpcfg_4(7 downto 0),
      pmpcfg_5(7 downto 0) => RegisterFile_1_pmpcfg_5(7 downto 0),
      pmpcfg_6(7 downto 0) => RegisterFile_1_pmpcfg_6(7 downto 0),
      pmpcfg_7(7 downto 0) => RegisterFile_1_pmpcfg_7(7 downto 0),
      pmpcfg_8(7 downto 0) => RegisterFile_1_pmpcfg_8(7 downto 0),
      pmpcfg_9(7 downto 0) => RegisterFile_1_pmpcfg_9(7 downto 0),
      readWrite => ControlUnit_0_PMP_rw,
      readWrite_out => PMP_PMA_checker_0_readWrite_out,
      reset => reset_0_1,
      size(1 downto 0) => ControlUnit_0_PMP_size(1 downto 0),
      size_out(1 downto 0) => PMP_PMA_checker_0_size_out(1 downto 0),
      storeAMO_afe_P => PMP_PMA_checker_0_storeAMO_afe_P,
      storeAMO_ame_P => PMP_PMA_checker_0_storeAMO_ame_P
    );
RegisterFile_1: component EDRICO_RegisterFile_1_0
     port map (
      CSR_address(11 downto 0) => MUX_EC_CSR_CSR_address(11 downto 0),
      CSR_read => MUX_EC_CSR_read_CSR,
      CSR_save => ControlUnit_0_save_CSR,
      CSR_write => MUX_EC_CSR_write_CSR,
      clk => clk_0_1,
      data_bus_A(31 downto 0) => RegisterFile_1_data_bus_A(31 downto 0),
      data_bus_B(31 downto 0) => RegisterFile_1_data_bus_B(31 downto 0),
      data_in(31 downto 0) => MUX_EC_RF_in_C_out(31 downto 0),
      iie_CSR => RegisterFile_1_iie_CSR,
      instr_finished => ControlUnit_0_instr_finished,
      mcause_debug(31 downto 0) => RegisterFile_1_mcause_debug(31 downto 0),
      mcountinhibit_debug(31 downto 0) => RegisterFile_1_mcountinhibit_debug(31 downto 0),
      mcycleH_debug(31 downto 0) => RegisterFile_1_mcycleH_debug(31 downto 0),
      mcycle_debug(31 downto 0) => RegisterFile_1_mcycle_debug(31 downto 0),
      mepc_debug(31 downto 0) => RegisterFile_1_mepc_debug(31 downto 0),
      mie_debug(31 downto 0) => RegisterFile_1_mie_debug(31 downto 0),
      minstretH_debug(31 downto 0) => RegisterFile_1_minstretH_debug(31 downto 0),
      minstret_debug(31 downto 0) => RegisterFile_1_minstret_debug(31 downto 0),
      mip_debug(31 downto 0) => RegisterFile_1_mip_debug(31 downto 0),
      misa_debug(31 downto 0) => RegisterFile_1_misa_debug(31 downto 0),
      mscratch_debug(31 downto 0) => RegisterFile_1_mscratch_debug(31 downto 0),
      msi_CSR => RegisterFile_1_msi_CSR,
      msip_dra => mmCSR_0_msip,
      mstatus_debug(31 downto 0) => RegisterFile_1_mstatus_debug(31 downto 0),
      mti_CSR => RegisterFile_1_mti_CSR,
      mtip_dra => mmCSR_0_mtip,
      mtval_debug(31 downto 0) => RegisterFile_1_mtval_debug(31 downto 0),
      mtvec_debug(31 downto 0) => RegisterFile_1_mtvec_debug(31 downto 0),
      pmpaddr_0(31 downto 0) => RegisterFile_1_pmpaddr_0(31 downto 0),
      pmpaddr_1(31 downto 0) => RegisterFile_1_pmpaddr_1(31 downto 0),
      pmpaddr_10(31 downto 0) => RegisterFile_1_pmpaddr_10(31 downto 0),
      pmpaddr_11(31 downto 0) => RegisterFile_1_pmpaddr_11(31 downto 0),
      pmpaddr_12(31 downto 0) => RegisterFile_1_pmpaddr_12(31 downto 0),
      pmpaddr_13(31 downto 0) => RegisterFile_1_pmpaddr_13(31 downto 0),
      pmpaddr_14(31 downto 0) => RegisterFile_1_pmpaddr_14(31 downto 0),
      pmpaddr_15(31 downto 0) => RegisterFile_1_pmpaddr_15(31 downto 0),
      pmpaddr_2(31 downto 0) => RegisterFile_1_pmpaddr_2(31 downto 0),
      pmpaddr_3(31 downto 0) => RegisterFile_1_pmpaddr_3(31 downto 0),
      pmpaddr_4(31 downto 0) => RegisterFile_1_pmpaddr_4(31 downto 0),
      pmpaddr_5(31 downto 0) => RegisterFile_1_pmpaddr_5(31 downto 0),
      pmpaddr_6(31 downto 0) => RegisterFile_1_pmpaddr_6(31 downto 0),
      pmpaddr_7(31 downto 0) => RegisterFile_1_pmpaddr_7(31 downto 0),
      pmpaddr_8(31 downto 0) => RegisterFile_1_pmpaddr_8(31 downto 0),
      pmpaddr_9(31 downto 0) => RegisterFile_1_pmpaddr_9(31 downto 0),
      pmpcfg_0(7 downto 0) => RegisterFile_1_pmpcfg_0(7 downto 0),
      pmpcfg_1(7 downto 0) => RegisterFile_1_pmpcfg_1(7 downto 0),
      pmpcfg_10(7 downto 0) => RegisterFile_1_pmpcfg_10(7 downto 0),
      pmpcfg_11(7 downto 0) => RegisterFile_1_pmpcfg_11(7 downto 0),
      pmpcfg_12(7 downto 0) => RegisterFile_1_pmpcfg_12(7 downto 0),
      pmpcfg_13(7 downto 0) => RegisterFile_1_pmpcfg_13(7 downto 0),
      pmpcfg_14(7 downto 0) => RegisterFile_1_pmpcfg_14(7 downto 0),
      pmpcfg_15(7 downto 0) => RegisterFile_1_pmpcfg_15(7 downto 0),
      pmpcfg_2(7 downto 0) => RegisterFile_1_pmpcfg_2(7 downto 0),
      pmpcfg_3(7 downto 0) => RegisterFile_1_pmpcfg_3(7 downto 0),
      pmpcfg_4(7 downto 0) => RegisterFile_1_pmpcfg_4(7 downto 0),
      pmpcfg_5(7 downto 0) => RegisterFile_1_pmpcfg_5(7 downto 0),
      pmpcfg_6(7 downto 0) => RegisterFile_1_pmpcfg_6(7 downto 0),
      pmpcfg_7(7 downto 0) => RegisterFile_1_pmpcfg_7(7 downto 0),
      pmpcfg_8(7 downto 0) => RegisterFile_1_pmpcfg_8(7 downto 0),
      pmpcfg_9(7 downto 0) => RegisterFile_1_pmpcfg_9(7 downto 0),
      register_read_A(4 downto 0) => ControlUnit_0_register_read_A(4 downto 0),
      register_read_B(4 downto 0) => ControlUnit_0_register_read_B(4 downto 0),
      register_write(4 downto 0) => ControlUnit_0_register_write(4 downto 0),
      reset => reset_0_1,
      x1(31 downto 0) => RegisterFile_1_x1(31 downto 0),
      x10(31 downto 0) => RegisterFile_1_x10(31 downto 0),
      x11(31 downto 0) => RegisterFile_1_x11(31 downto 0),
      x12(31 downto 0) => RegisterFile_1_x12(31 downto 0),
      x13(31 downto 0) => RegisterFile_1_x13(31 downto 0),
      x14(31 downto 0) => RegisterFile_1_x14(31 downto 0),
      x15(31 downto 0) => RegisterFile_1_x15(31 downto 0),
      x16(31 downto 0) => RegisterFile_1_x16(31 downto 0),
      x17(31 downto 0) => RegisterFile_1_x17(31 downto 0),
      x18(31 downto 0) => RegisterFile_1_x18(31 downto 0),
      x19(31 downto 0) => RegisterFile_1_x19(31 downto 0),
      x2(31 downto 0) => RegisterFile_1_x2(31 downto 0),
      x20(31 downto 0) => RegisterFile_1_x20(31 downto 0),
      x21(31 downto 0) => RegisterFile_1_x21(31 downto 0),
      x22(31 downto 0) => RegisterFile_1_x22(31 downto 0),
      x23(31 downto 0) => RegisterFile_1_x23(31 downto 0),
      x24(31 downto 0) => RegisterFile_1_x24(31 downto 0),
      x25(31 downto 0) => RegisterFile_1_x25(31 downto 0),
      x26(31 downto 0) => RegisterFile_1_x26(31 downto 0),
      x27(31 downto 0) => RegisterFile_1_x27(31 downto 0),
      x28(31 downto 0) => RegisterFile_1_x28(31 downto 0),
      x29(31 downto 0) => RegisterFile_1_x29(31 downto 0),
      x3(31 downto 0) => RegisterFile_1_x3(31 downto 0),
      x30(31 downto 0) => RegisterFile_1_x30(31 downto 0),
      x31(31 downto 0) => RegisterFile_1_x31(31 downto 0),
      x4(31 downto 0) => RegisterFile_1_x4(31 downto 0),
      x5(31 downto 0) => RegisterFile_1_x5(31 downto 0),
      x6(31 downto 0) => RegisterFile_1_x6(31 downto 0),
      x7(31 downto 0) => RegisterFile_1_x7(31 downto 0),
      x8(31 downto 0) => RegisterFile_1_x8(31 downto 0),
      x9(31 downto 0) => RegisterFile_1_x9(31 downto 0)
    );
mmCSR_0: component EDRICO_mmCSR_0_0
     port map (
      msip => mmCSR_0_msip,
      mtip => mmCSR_0_mtip,
      s00_axi_aclk => s00_axi_aclk_0_1,
      s00_axi_araddr(15 downto 0) => S00_AXI_0_1_ARADDR(15 downto 0),
      s00_axi_aresetn => s00_axi_aresetn_0_1,
      s00_axi_arprot(2 downto 0) => S00_AXI_0_1_ARPROT(2 downto 0),
      s00_axi_arready => S00_AXI_0_1_ARREADY,
      s00_axi_arvalid => S00_AXI_0_1_ARVALID,
      s00_axi_awaddr(15 downto 0) => S00_AXI_0_1_AWADDR(15 downto 0),
      s00_axi_awprot(2 downto 0) => S00_AXI_0_1_AWPROT(2 downto 0),
      s00_axi_awready => S00_AXI_0_1_AWREADY,
      s00_axi_awvalid => S00_AXI_0_1_AWVALID,
      s00_axi_bready => S00_AXI_0_1_BREADY,
      s00_axi_bresp(1 downto 0) => S00_AXI_0_1_BRESP(1 downto 0),
      s00_axi_bvalid => S00_AXI_0_1_BVALID,
      s00_axi_rdata(31 downto 0) => S00_AXI_0_1_RDATA(31 downto 0),
      s00_axi_rready => S00_AXI_0_1_RREADY,
      s00_axi_rresp(1 downto 0) => S00_AXI_0_1_RRESP(1 downto 0),
      s00_axi_rvalid => S00_AXI_0_1_RVALID,
      s00_axi_wdata(31 downto 0) => S00_AXI_0_1_WDATA(31 downto 0),
      s00_axi_wready => S00_AXI_0_1_WREADY,
      s00_axi_wstrb(3 downto 0) => S00_AXI_0_1_WSTRB(3 downto 0),
      s00_axi_wvalid => S00_AXI_0_1_WVALID
    );
end STRUCTURE;
