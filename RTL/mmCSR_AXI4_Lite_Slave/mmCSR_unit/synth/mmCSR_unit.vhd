--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Thu May 13 17:05:06 2021
--Host        : levi-macbookpro152 running 64-bit Manjaro Linux
--Command     : generate_target mmCSR_unit.bd
--Design      : mmCSR_unit
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mmCSR_unit is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of mmCSR_unit : entity is "mmCSR_unit,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mmCSR_unit,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of mmCSR_unit : entity is "mmCSR_unit.hwdef";
end mmCSR_unit;

architecture STRUCTURE of mmCSR_unit is
  component mmCSR_unit_mmCSR_AXI4_slave_0_0 is
  port (
    msip : out STD_LOGIC;
    mtip : out STD_LOGIC;
    mmcsr_axi4_s_aclk : in STD_LOGIC;
    mmcsr_axi4_s_aresetn : in STD_LOGIC;
    mmcsr_axi4_s_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    mmcsr_axi4_s_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mmcsr_axi4_s_awvalid : in STD_LOGIC;
    mmcsr_axi4_s_awready : out STD_LOGIC;
    mmcsr_axi4_s_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mmcsr_axi4_s_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    mmcsr_axi4_s_wvalid : in STD_LOGIC;
    mmcsr_axi4_s_wready : out STD_LOGIC;
    mmcsr_axi4_s_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mmcsr_axi4_s_bvalid : out STD_LOGIC;
    mmcsr_axi4_s_bready : in STD_LOGIC;
    mmcsr_axi4_s_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    mmcsr_axi4_s_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mmcsr_axi4_s_arvalid : in STD_LOGIC;
    mmcsr_axi4_s_arready : out STD_LOGIC;
    mmcsr_axi4_s_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    mmcsr_axi4_s_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mmcsr_axi4_s_rvalid : out STD_LOGIC;
    mmcsr_axi4_s_rready : in STD_LOGIC
  );
  end component mmCSR_unit_mmCSR_AXI4_slave_0_0;
  signal mmCSR_AXI4_s_0_1_ARADDR : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal mmCSR_AXI4_s_0_1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal mmCSR_AXI4_s_0_1_ARREADY : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_ARVALID : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_AWADDR : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal mmCSR_AXI4_s_0_1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal mmCSR_AXI4_s_0_1_AWREADY : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_AWVALID : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_BREADY : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal mmCSR_AXI4_s_0_1_BVALID : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mmCSR_AXI4_s_0_1_RREADY : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal mmCSR_AXI4_s_0_1_RVALID : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mmCSR_AXI4_s_0_1_WREADY : STD_LOGIC;
  signal mmCSR_AXI4_s_0_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal mmCSR_AXI4_s_0_1_WVALID : STD_LOGIC;
  signal mmCSR_AXI4_slave_0_msip : STD_LOGIC;
  signal mmCSR_AXI4_slave_0_mtip : STD_LOGIC;
  signal mmcsr_axi4_s_aclk_0_1 : STD_LOGIC;
  signal mmcsr_axi4_s_aresetn_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_arready : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 ARREADY";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 ARVALID";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_awready : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 AWREADY";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 AWVALID";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_bready : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 BREADY";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 BVALID";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_rready : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 RREADY";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 RVALID";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_wready : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 WREADY";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 WVALID";
  attribute X_INTERFACE_INFO of mmcsr_axi4_s_aclk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.MMCSR_AXI4_S_ACLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of mmcsr_axi4_s_aclk_0 : signal is "XIL_INTERFACENAME CLK.MMCSR_AXI4_S_ACLK_0, ASSOCIATED_BUSIF mmCSR_AXI4_s_0, ASSOCIATED_RESET mmcsr_axi4_s_aresetn_0, CLK_DOMAIN mmCSR_unit_mmcsr_axi4_s_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of mmcsr_axi4_s_aresetn_0 : signal is "xilinx.com:signal:reset:1.0 RST.MMCSR_AXI4_S_ARESETN_0 RST";
  attribute X_INTERFACE_PARAMETER of mmcsr_axi4_s_aresetn_0 : signal is "XIL_INTERFACENAME RST.MMCSR_AXI4_S_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_araddr : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 ARADDR";
  attribute X_INTERFACE_PARAMETER of mmCSR_AXI4_s_0_araddr : signal is "XIL_INTERFACENAME mmCSR_AXI4_s_0, ADDR_WIDTH 5, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN mmCSR_unit_mmcsr_axi4_s_aclk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_arprot : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 ARPROT";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 AWADDR";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_awprot : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 AWPROT";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_bresp : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 BRESP";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_rdata : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 RDATA";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_rresp : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 RRESP";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_wdata : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 WDATA";
  attribute X_INTERFACE_INFO of mmCSR_AXI4_s_0_wstrb : signal is "xilinx.com:interface:aximm:1.0 mmCSR_AXI4_s_0 WSTRB";
begin
  mmCSR_AXI4_s_0_1_ARADDR(4 downto 0) <= mmCSR_AXI4_s_0_araddr(4 downto 0);
  mmCSR_AXI4_s_0_1_ARPROT(2 downto 0) <= mmCSR_AXI4_s_0_arprot(2 downto 0);
  mmCSR_AXI4_s_0_1_ARVALID <= mmCSR_AXI4_s_0_arvalid;
  mmCSR_AXI4_s_0_1_AWADDR(4 downto 0) <= mmCSR_AXI4_s_0_awaddr(4 downto 0);
  mmCSR_AXI4_s_0_1_AWPROT(2 downto 0) <= mmCSR_AXI4_s_0_awprot(2 downto 0);
  mmCSR_AXI4_s_0_1_AWVALID <= mmCSR_AXI4_s_0_awvalid;
  mmCSR_AXI4_s_0_1_BREADY <= mmCSR_AXI4_s_0_bready;
  mmCSR_AXI4_s_0_1_RREADY <= mmCSR_AXI4_s_0_rready;
  mmCSR_AXI4_s_0_1_WDATA(31 downto 0) <= mmCSR_AXI4_s_0_wdata(31 downto 0);
  mmCSR_AXI4_s_0_1_WSTRB(3 downto 0) <= mmCSR_AXI4_s_0_wstrb(3 downto 0);
  mmCSR_AXI4_s_0_1_WVALID <= mmCSR_AXI4_s_0_wvalid;
  mmCSR_AXI4_s_0_arready <= mmCSR_AXI4_s_0_1_ARREADY;
  mmCSR_AXI4_s_0_awready <= mmCSR_AXI4_s_0_1_AWREADY;
  mmCSR_AXI4_s_0_bresp(1 downto 0) <= mmCSR_AXI4_s_0_1_BRESP(1 downto 0);
  mmCSR_AXI4_s_0_bvalid <= mmCSR_AXI4_s_0_1_BVALID;
  mmCSR_AXI4_s_0_rdata(31 downto 0) <= mmCSR_AXI4_s_0_1_RDATA(31 downto 0);
  mmCSR_AXI4_s_0_rresp(1 downto 0) <= mmCSR_AXI4_s_0_1_RRESP(1 downto 0);
  mmCSR_AXI4_s_0_rvalid <= mmCSR_AXI4_s_0_1_RVALID;
  mmCSR_AXI4_s_0_wready <= mmCSR_AXI4_s_0_1_WREADY;
  mmcsr_axi4_s_aclk_0_1 <= mmcsr_axi4_s_aclk_0;
  mmcsr_axi4_s_aresetn_0_1 <= mmcsr_axi4_s_aresetn_0;
  msip_0 <= mmCSR_AXI4_slave_0_msip;
  mtip_0 <= mmCSR_AXI4_slave_0_mtip;
mmCSR_AXI4_slave_0: component mmCSR_unit_mmCSR_AXI4_slave_0_0
     port map (
      mmcsr_axi4_s_aclk => mmcsr_axi4_s_aclk_0_1,
      mmcsr_axi4_s_araddr(4 downto 0) => mmCSR_AXI4_s_0_1_ARADDR(4 downto 0),
      mmcsr_axi4_s_aresetn => mmcsr_axi4_s_aresetn_0_1,
      mmcsr_axi4_s_arprot(2 downto 0) => mmCSR_AXI4_s_0_1_ARPROT(2 downto 0),
      mmcsr_axi4_s_arready => mmCSR_AXI4_s_0_1_ARREADY,
      mmcsr_axi4_s_arvalid => mmCSR_AXI4_s_0_1_ARVALID,
      mmcsr_axi4_s_awaddr(4 downto 0) => mmCSR_AXI4_s_0_1_AWADDR(4 downto 0),
      mmcsr_axi4_s_awprot(2 downto 0) => mmCSR_AXI4_s_0_1_AWPROT(2 downto 0),
      mmcsr_axi4_s_awready => mmCSR_AXI4_s_0_1_AWREADY,
      mmcsr_axi4_s_awvalid => mmCSR_AXI4_s_0_1_AWVALID,
      mmcsr_axi4_s_bready => mmCSR_AXI4_s_0_1_BREADY,
      mmcsr_axi4_s_bresp(1 downto 0) => mmCSR_AXI4_s_0_1_BRESP(1 downto 0),
      mmcsr_axi4_s_bvalid => mmCSR_AXI4_s_0_1_BVALID,
      mmcsr_axi4_s_rdata(31 downto 0) => mmCSR_AXI4_s_0_1_RDATA(31 downto 0),
      mmcsr_axi4_s_rready => mmCSR_AXI4_s_0_1_RREADY,
      mmcsr_axi4_s_rresp(1 downto 0) => mmCSR_AXI4_s_0_1_RRESP(1 downto 0),
      mmcsr_axi4_s_rvalid => mmCSR_AXI4_s_0_1_RVALID,
      mmcsr_axi4_s_wdata(31 downto 0) => mmCSR_AXI4_s_0_1_WDATA(31 downto 0),
      mmcsr_axi4_s_wready => mmCSR_AXI4_s_0_1_WREADY,
      mmcsr_axi4_s_wstrb(3 downto 0) => mmCSR_AXI4_s_0_1_WSTRB(3 downto 0),
      mmcsr_axi4_s_wvalid => mmCSR_AXI4_s_0_1_WVALID,
      msip => mmCSR_AXI4_slave_0_msip,
      mtip => mmCSR_AXI4_slave_0_mtip
    );
end STRUCTURE;
