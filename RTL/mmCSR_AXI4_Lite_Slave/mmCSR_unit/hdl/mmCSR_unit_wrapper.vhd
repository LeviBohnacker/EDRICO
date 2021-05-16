--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Thu May 13 17:05:06 2021
--Host        : levi-macbookpro152 running 64-bit Manjaro Linux
--Command     : generate_target mmCSR_unit_wrapper.bd
--Design      : mmCSR_unit_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mmCSR_unit_wrapper is
  port (
    mmCSR_AXI4_s_0_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    mmCSR_AXI4_s_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mmCSR_AXI4_s_0_arready : out STD_LOGIC;
    mmCSR_AXI4_s_0_arvalid : in STD_LOGIC;
    mmCSR_AXI4_s_0_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    mmCSR_AXI4_s_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mmCSR_AXI4_s_0_awready : out STD_LOGIC;
    mmCSR_AXI4_s_0_awvalid : in STD_LOGIC;
    mmCSR_AXI4_s_0_bready : in STD_LOGIC;
    mmCSR_AXI4_s_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mmCSR_AXI4_s_0_bvalid : out STD_LOGIC;
    mmCSR_AXI4_s_0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mmCSR_AXI4_s_0_rready : in STD_LOGIC;
    mmCSR_AXI4_s_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mmCSR_AXI4_s_0_rvalid : out STD_LOGIC;
    mmCSR_AXI4_s_0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mmCSR_AXI4_s_0_wready : out STD_LOGIC;
    mmCSR_AXI4_s_0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    mmCSR_AXI4_s_0_wvalid : in STD_LOGIC;
    mmcsr_axi4_s_aclk_0 : in STD_LOGIC;
    mmcsr_axi4_s_aresetn_0 : in STD_LOGIC;
    msip_0 : out STD_LOGIC;
    mtip_0 : out STD_LOGIC
  );
end mmCSR_unit_wrapper;

architecture STRUCTURE of mmCSR_unit_wrapper is
  component mmCSR_unit is
  port (
    mmCSR_AXI4_s_0_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    mmCSR_AXI4_s_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mmCSR_AXI4_s_0_awvalid : in STD_LOGIC;
    mmCSR_AXI4_s_0_awready : out STD_LOGIC;
    mmCSR_AXI4_s_0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mmCSR_AXI4_s_0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    mmCSR_AXI4_s_0_wvalid : in STD_LOGIC;
    mmCSR_AXI4_s_0_wready : out STD_LOGIC;
    mmCSR_AXI4_s_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mmCSR_AXI4_s_0_bvalid : out STD_LOGIC;
    mmCSR_AXI4_s_0_bready : in STD_LOGIC;
    mmCSR_AXI4_s_0_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    mmCSR_AXI4_s_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mmCSR_AXI4_s_0_arvalid : in STD_LOGIC;
    mmCSR_AXI4_s_0_arready : out STD_LOGIC;
    mmCSR_AXI4_s_0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mmCSR_AXI4_s_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mmCSR_AXI4_s_0_rvalid : out STD_LOGIC;
    mmCSR_AXI4_s_0_rready : in STD_LOGIC;
    mmcsr_axi4_s_aclk_0 : in STD_LOGIC;
    mmcsr_axi4_s_aresetn_0 : in STD_LOGIC;
    msip_0 : out STD_LOGIC;
    mtip_0 : out STD_LOGIC
  );
  end component mmCSR_unit;
begin
mmCSR_unit_i: component mmCSR_unit
     port map (
      mmCSR_AXI4_s_0_araddr(4 downto 0) => mmCSR_AXI4_s_0_araddr(4 downto 0),
      mmCSR_AXI4_s_0_arprot(2 downto 0) => mmCSR_AXI4_s_0_arprot(2 downto 0),
      mmCSR_AXI4_s_0_arready => mmCSR_AXI4_s_0_arready,
      mmCSR_AXI4_s_0_arvalid => mmCSR_AXI4_s_0_arvalid,
      mmCSR_AXI4_s_0_awaddr(4 downto 0) => mmCSR_AXI4_s_0_awaddr(4 downto 0),
      mmCSR_AXI4_s_0_awprot(2 downto 0) => mmCSR_AXI4_s_0_awprot(2 downto 0),
      mmCSR_AXI4_s_0_awready => mmCSR_AXI4_s_0_awready,
      mmCSR_AXI4_s_0_awvalid => mmCSR_AXI4_s_0_awvalid,
      mmCSR_AXI4_s_0_bready => mmCSR_AXI4_s_0_bready,
      mmCSR_AXI4_s_0_bresp(1 downto 0) => mmCSR_AXI4_s_0_bresp(1 downto 0),
      mmCSR_AXI4_s_0_bvalid => mmCSR_AXI4_s_0_bvalid,
      mmCSR_AXI4_s_0_rdata(31 downto 0) => mmCSR_AXI4_s_0_rdata(31 downto 0),
      mmCSR_AXI4_s_0_rready => mmCSR_AXI4_s_0_rready,
      mmCSR_AXI4_s_0_rresp(1 downto 0) => mmCSR_AXI4_s_0_rresp(1 downto 0),
      mmCSR_AXI4_s_0_rvalid => mmCSR_AXI4_s_0_rvalid,
      mmCSR_AXI4_s_0_wdata(31 downto 0) => mmCSR_AXI4_s_0_wdata(31 downto 0),
      mmCSR_AXI4_s_0_wready => mmCSR_AXI4_s_0_wready,
      mmCSR_AXI4_s_0_wstrb(3 downto 0) => mmCSR_AXI4_s_0_wstrb(3 downto 0),
      mmCSR_AXI4_s_0_wvalid => mmCSR_AXI4_s_0_wvalid,
      mmcsr_axi4_s_aclk_0 => mmcsr_axi4_s_aclk_0,
      mmcsr_axi4_s_aresetn_0 => mmcsr_axi4_s_aresetn_0,
      msip_0 => msip_0,
      mtip_0 => mtip_0
    );
end STRUCTURE;
