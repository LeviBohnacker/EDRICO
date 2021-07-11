--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
--Date        : Sun Jul 11 11:32:06 2021
--Host        : dickerlaptop running 64-bit Manjaro Linux
--Command     : generate_target EDRICO_wrapper.bd
--Design      : EDRICO_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EDRICO_wrapper is
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
end EDRICO_wrapper;

architecture STRUCTURE of EDRICO_wrapper is
  component EDRICO is
  port (
    IR_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_ACLK_0 : in STD_LOGIC;
    PC_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
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
    x9_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk_0 : in STD_LOGIC;
    s00_axi_aresetn_0 : in STD_LOGIC;
    M_AXI_ARESETN_0 : in STD_LOGIC;
    M_AXI_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_0_awvalid : out STD_LOGIC;
    M_AXI_0_awready : in STD_LOGIC;
    M_AXI_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_0_wvalid : out STD_LOGIC;
    M_AXI_0_wready : in STD_LOGIC;
    M_AXI_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_0_bvalid : in STD_LOGIC;
    M_AXI_0_bready : out STD_LOGIC;
    M_AXI_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_0_arvalid : out STD_LOGIC;
    M_AXI_0_arready : in STD_LOGIC;
    M_AXI_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_0_rvalid : in STD_LOGIC;
    M_AXI_0_rready : out STD_LOGIC;
    S00_AXI_0_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_0_awvalid : in STD_LOGIC;
    S00_AXI_0_awready : out STD_LOGIC;
    S00_AXI_0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_0_wvalid : in STD_LOGIC;
    S00_AXI_0_wready : out STD_LOGIC;
    S00_AXI_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_0_bvalid : out STD_LOGIC;
    S00_AXI_0_bready : in STD_LOGIC;
    S00_AXI_0_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_0_arvalid : in STD_LOGIC;
    S00_AXI_0_arready : out STD_LOGIC;
    S00_AXI_0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_0_rvalid : out STD_LOGIC;
    S00_AXI_0_rready : in STD_LOGIC
  );
  end component EDRICO;
begin
EDRICO_i: component EDRICO
     port map (
      IR_debug(31 downto 0) => IR_debug(31 downto 0),
      M_AXI_0_araddr(31 downto 0) => M_AXI_0_araddr(31 downto 0),
      M_AXI_0_arcache(3 downto 0) => M_AXI_0_arcache(3 downto 0),
      M_AXI_0_arprot(2 downto 0) => M_AXI_0_arprot(2 downto 0),
      M_AXI_0_arready => M_AXI_0_arready,
      M_AXI_0_arvalid => M_AXI_0_arvalid,
      M_AXI_0_awaddr(31 downto 0) => M_AXI_0_awaddr(31 downto 0),
      M_AXI_0_awcache(3 downto 0) => M_AXI_0_awcache(3 downto 0),
      M_AXI_0_awprot(2 downto 0) => M_AXI_0_awprot(2 downto 0),
      M_AXI_0_awready => M_AXI_0_awready,
      M_AXI_0_awvalid => M_AXI_0_awvalid,
      M_AXI_0_bready => M_AXI_0_bready,
      M_AXI_0_bresp(1 downto 0) => M_AXI_0_bresp(1 downto 0),
      M_AXI_0_bvalid => M_AXI_0_bvalid,
      M_AXI_0_rdata(31 downto 0) => M_AXI_0_rdata(31 downto 0),
      M_AXI_0_rready => M_AXI_0_rready,
      M_AXI_0_rresp(1 downto 0) => M_AXI_0_rresp(1 downto 0),
      M_AXI_0_rvalid => M_AXI_0_rvalid,
      M_AXI_0_wdata(31 downto 0) => M_AXI_0_wdata(31 downto 0),
      M_AXI_0_wready => M_AXI_0_wready,
      M_AXI_0_wstrb(3 downto 0) => M_AXI_0_wstrb(3 downto 0),
      M_AXI_0_wvalid => M_AXI_0_wvalid,
      M_AXI_ACLK_0 => M_AXI_ACLK_0,
      M_AXI_ARESETN_0 => M_AXI_ARESETN_0,
      PC_debug(31 downto 0) => PC_debug(31 downto 0),
      S00_AXI_0_araddr(15 downto 0) => S00_AXI_0_araddr(15 downto 0),
      S00_AXI_0_arprot(2 downto 0) => S00_AXI_0_arprot(2 downto 0),
      S00_AXI_0_arready => S00_AXI_0_arready,
      S00_AXI_0_arvalid => S00_AXI_0_arvalid,
      S00_AXI_0_awaddr(15 downto 0) => S00_AXI_0_awaddr(15 downto 0),
      S00_AXI_0_awprot(2 downto 0) => S00_AXI_0_awprot(2 downto 0),
      S00_AXI_0_awready => S00_AXI_0_awready,
      S00_AXI_0_awvalid => S00_AXI_0_awvalid,
      S00_AXI_0_bready => S00_AXI_0_bready,
      S00_AXI_0_bresp(1 downto 0) => S00_AXI_0_bresp(1 downto 0),
      S00_AXI_0_bvalid => S00_AXI_0_bvalid,
      S00_AXI_0_rdata(31 downto 0) => S00_AXI_0_rdata(31 downto 0),
      S00_AXI_0_rready => S00_AXI_0_rready,
      S00_AXI_0_rresp(1 downto 0) => S00_AXI_0_rresp(1 downto 0),
      S00_AXI_0_rvalid => S00_AXI_0_rvalid,
      S00_AXI_0_wdata(31 downto 0) => S00_AXI_0_wdata(31 downto 0),
      S00_AXI_0_wready => S00_AXI_0_wready,
      S00_AXI_0_wstrb(3 downto 0) => S00_AXI_0_wstrb(3 downto 0),
      S00_AXI_0_wvalid => S00_AXI_0_wvalid,
      mcause_debug_0(31 downto 0) => mcause_debug_0(31 downto 0),
      mcountinhibit_debug_0(31 downto 0) => mcountinhibit_debug_0(31 downto 0),
      mcycleH_debug_0(31 downto 0) => mcycleH_debug_0(31 downto 0),
      mcycle_debug_0(31 downto 0) => mcycle_debug_0(31 downto 0),
      mepc_debug_0(31 downto 0) => mepc_debug_0(31 downto 0),
      mie_debug_0(31 downto 0) => mie_debug_0(31 downto 0),
      minstretH_debug_0(31 downto 0) => minstretH_debug_0(31 downto 0),
      minstret_debug_0(31 downto 0) => minstret_debug_0(31 downto 0),
      mip_debug_0(31 downto 0) => mip_debug_0(31 downto 0),
      misa_debug_0(31 downto 0) => misa_debug_0(31 downto 0),
      mscratch_debug_0(31 downto 0) => mscratch_debug_0(31 downto 0),
      mstatus_debug_0(31 downto 0) => mstatus_debug_0(31 downto 0),
      mtval_debug_0(31 downto 0) => mtval_debug_0(31 downto 0),
      mtvec_debug_0(31 downto 0) => mtvec_debug_0(31 downto 0),
      s00_axi_aclk_0 => s00_axi_aclk_0,
      s00_axi_aresetn_0 => s00_axi_aresetn_0,
      system_clk => system_clk,
      system_reset_async => system_reset_async,
      x10_0(31 downto 0) => x10_0(31 downto 0),
      x11_0(31 downto 0) => x11_0(31 downto 0),
      x12_0(31 downto 0) => x12_0(31 downto 0),
      x13_0(31 downto 0) => x13_0(31 downto 0),
      x14_0(31 downto 0) => x14_0(31 downto 0),
      x15_0(31 downto 0) => x15_0(31 downto 0),
      x16_0(31 downto 0) => x16_0(31 downto 0),
      x17_0(31 downto 0) => x17_0(31 downto 0),
      x18_0(31 downto 0) => x18_0(31 downto 0),
      x19_0(31 downto 0) => x19_0(31 downto 0),
      x1_0(31 downto 0) => x1_0(31 downto 0),
      x20_0(31 downto 0) => x20_0(31 downto 0),
      x21_0(31 downto 0) => x21_0(31 downto 0),
      x22_0(31 downto 0) => x22_0(31 downto 0),
      x23_0(31 downto 0) => x23_0(31 downto 0),
      x24_0(31 downto 0) => x24_0(31 downto 0),
      x25_0(31 downto 0) => x25_0(31 downto 0),
      x26_0(31 downto 0) => x26_0(31 downto 0),
      x27_0(31 downto 0) => x27_0(31 downto 0),
      x28_0(31 downto 0) => x28_0(31 downto 0),
      x29_0(31 downto 0) => x29_0(31 downto 0),
      x2_0(31 downto 0) => x2_0(31 downto 0),
      x30_0(31 downto 0) => x30_0(31 downto 0),
      x31_0(31 downto 0) => x31_0(31 downto 0),
      x3_0(31 downto 0) => x3_0(31 downto 0),
      x4_0(31 downto 0) => x4_0(31 downto 0),
      x5_0(31 downto 0) => x5_0(31 downto 0),
      x6_0(31 downto 0) => x6_0(31 downto 0),
      x7_0(31 downto 0) => x7_0(31 downto 0),
      x8_0(31 downto 0) => x8_0(31 downto 0),
      x9_0(31 downto 0) => x9_0(31 downto 0)
    );
end STRUCTURE;
