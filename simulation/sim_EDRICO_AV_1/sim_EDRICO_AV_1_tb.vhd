----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2021 12:42:41 PM
-- Design Name: 
-- Module Name: sim_EDRICO_AV_1_tb - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_EDRICO_AV_1_tb is
--  Port ( );
end sim_EDRICO_AV_1_tb;

architecture rtl of sim_EDRICO_AV_1_tb is

component EDRICO_wrapper is
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
    M_AXI_ARSTN_0 : in STD_LOGIC;
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
    mmCSR_AXI4_s_0_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    mmCSR_AXI4_s_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    mmCSR_AXI4_s_0_arready : out STD_LOGIC;
    mmCSR_AXI4_s_0_arvalid : in STD_LOGIC;
    mmCSR_AXI4_s_0_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
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
    x9_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end component;

for all: EDRICO_wrapper use entity work.EDRICO_wrapper(STRUCTURE);

    signal IR_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M_AXI_0_araddr : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M_AXI_0_arcache : STD_LOGIC_VECTOR ( 3 downto 0 );
    signal M_AXI_0_arprot : STD_LOGIC_VECTOR ( 2 downto 0 );
    signal M_AXI_0_arready : STD_LOGIC;
    signal M_AXI_0_arvalid : STD_LOGIC;
    signal M_AXI_0_awaddr : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M_AXI_0_awcache : STD_LOGIC_VECTOR ( 3 downto 0 );
    signal M_AXI_0_awprot : STD_LOGIC_VECTOR ( 2 downto 0 );
    signal M_AXI_0_awready : STD_LOGIC;
    signal M_AXI_0_awvalid : STD_LOGIC;
    signal M_AXI_0_bready : STD_LOGIC;
    signal M_AXI_0_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
    signal M_AXI_0_bvalid : STD_LOGIC;
    signal M_AXI_0_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M_AXI_0_rready : STD_LOGIC;
    signal M_AXI_0_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
    signal M_AXI_0_rvalid : STD_LOGIC;
    signal M_AXI_0_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M_AXI_0_wready : STD_LOGIC;
    signal M_AXI_0_wstrb : STD_LOGIC_VECTOR ( 3 downto 0 );
    signal M_AXI_0_wvalid : STD_LOGIC;
    signal M_AXI_ACLK_0 : STD_LOGIC := '0';
    signal M_AXI_ARSTN_0 : STD_LOGIC := '0';
    signal PC_debug : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mcause_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mcountinhibit_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mcycleH_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mcycle_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mepc_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mie_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal minstretH_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal minstret_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mip_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal misa_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mmCSR_AXI4_s_0_araddr : STD_LOGIC_VECTOR ( 15 downto 0 );
    signal mmCSR_AXI4_s_0_arprot : STD_LOGIC_VECTOR ( 2 downto 0 );
    signal mmCSR_AXI4_s_0_arready : STD_LOGIC;
    signal mmCSR_AXI4_s_0_arvalid : STD_LOGIC;
    signal mmCSR_AXI4_s_0_awaddr : STD_LOGIC_VECTOR ( 15 downto 0 );
    signal mmCSR_AXI4_s_0_awprot : STD_LOGIC_VECTOR ( 2 downto 0 );
    signal mmCSR_AXI4_s_0_awready : STD_LOGIC;
    signal mmCSR_AXI4_s_0_awvalid : STD_LOGIC;
    signal mmCSR_AXI4_s_0_bready : STD_LOGIC;
    signal mmCSR_AXI4_s_0_bresp : STD_LOGIC_VECTOR ( 1 downto 0 );
    signal mmCSR_AXI4_s_0_bvalid : STD_LOGIC;
    signal mmCSR_AXI4_s_0_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mmCSR_AXI4_s_0_rready : STD_LOGIC;
    signal mmCSR_AXI4_s_0_rresp : STD_LOGIC_VECTOR ( 1 downto 0 );
    signal mmCSR_AXI4_s_0_rvalid : STD_LOGIC;
    signal mmCSR_AXI4_s_0_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mmCSR_AXI4_s_0_wready : STD_LOGIC;
    signal mmCSR_AXI4_s_0_wstrb : STD_LOGIC_VECTOR ( 3 downto 0 );
    signal mmCSR_AXI4_s_0_wvalid : STD_LOGIC;
    signal mmcsr_axi4_s_aclk_0 : STD_LOGIC := '0';
    signal mmcsr_axi4_s_aresetn_0 : STD_LOGIC := '1';
    signal mscratch_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mstatus_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mtval_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal mtvec_debug_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal system_clk : STD_LOGIC := '0';
    signal system_reset_async : STD_LOGIC := '1';
    signal x10_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x11_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x12_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x13_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x14_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x15_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x16_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x17_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x18_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x19_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x1_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x20_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x21_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x22_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x23_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x24_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x25_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x26_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x27_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x28_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x29_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x2_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x30_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x31_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x3_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x4_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x5_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x6_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x7_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x8_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    signal x9_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
    
constant T : time := 10 ns;
    
begin

system_clk <= not system_clk after T/2;
mmcsr_axi4_s_aclk_0 <= not mmcsr_axi4_s_aclk_0 after T/2;
M_AXI_ACLK_0 <= not M_AXI_ACLK_0 after T/2;

test: process
begin
    wait for 31 ns;
    system_reset_async <= '0';
    mmcsr_axi4_s_aresetn_0 <= '1';
    M_AXI_ARSTN_0 <= '1';
    wait;
end process;


dut: EDRICO_wrapper
  port map(
    IR_debug => IR_debug,
    M_AXI_0_araddr => M_AXI_0_araddr,
    M_AXI_0_arcache => M_AXI_0_arcache,
    M_AXI_0_arprot => M_AXI_0_arprot,
    M_AXI_0_arready => M_AXI_0_arready,
    M_AXI_0_arvalid => M_AXI_0_arvalid,
    M_AXI_0_awaddr => M_AXI_0_awaddr,
    M_AXI_0_awcache => M_AXI_0_awcache,
    M_AXI_0_awprot => M_AXI_0_awprot,
    M_AXI_0_awready => M_AXI_0_awready,
    M_AXI_0_awvalid => M_AXI_0_awvalid,
    M_AXI_0_bready => M_AXI_0_bready,
    M_AXI_0_bresp => M_AXI_0_bresp,
    M_AXI_0_bvalid => M_AXI_0_bvalid,
    M_AXI_0_rdata => M_AXI_0_rdata,
    M_AXI_0_rready => M_AXI_0_rready,
    M_AXI_0_rresp => M_AXI_0_rresp,
    M_AXI_0_rvalid => M_AXI_0_rvalid,
    M_AXI_0_wdata => M_AXI_0_wdata,
    M_AXI_0_wready => M_AXI_0_wready,
    M_AXI_0_wstrb => M_AXI_0_wstrb,
    M_AXI_0_wvalid => M_AXI_0_wvalid,
    M_AXI_ACLK_0 => M_AXI_ACLK_0,
    M_AXI_ARSTN_0 => M_AXI_ARSTN_0,
    PC_debug => PC_debug,
    mcause_debug_0 => mcause_debug_0,
    mcountinhibit_debug_0 => mcountinhibit_debug_0,
    mcycleH_debug_0 => mcycleH_debug_0,
    mcycle_debug_0 => mcycle_debug_0,
    mepc_debug_0 => mepc_debug_0,
    mie_debug_0 => mie_debug_0,
    minstretH_debug_0 => minstretH_debug_0,
    minstret_debug_0 => minstret_debug_0,
    mip_debug_0 => mip_debug_0,
    misa_debug_0 => misa_debug_0,
    mmCSR_AXI4_s_0_araddr => mmCSR_AXI4_s_0_araddr,
    mmCSR_AXI4_s_0_arprot => mmCSR_AXI4_s_0_arprot,
    mmCSR_AXI4_s_0_arready => mmCSR_AXI4_s_0_arready,
    mmCSR_AXI4_s_0_arvalid => mmCSR_AXI4_s_0_arvalid,
    mmCSR_AXI4_s_0_awaddr => mmCSR_AXI4_s_0_awaddr,
    mmCSR_AXI4_s_0_awprot => mmCSR_AXI4_s_0_awprot,
    mmCSR_AXI4_s_0_awready => mmCSR_AXI4_s_0_awready,
    mmCSR_AXI4_s_0_awvalid => mmCSR_AXI4_s_0_awvalid,
    mmCSR_AXI4_s_0_bready => mmCSR_AXI4_s_0_bready,
    mmCSR_AXI4_s_0_bresp => mmCSR_AXI4_s_0_bresp,
    mmCSR_AXI4_s_0_bvalid => mmCSR_AXI4_s_0_bvalid,
    mmCSR_AXI4_s_0_rdata => mmCSR_AXI4_s_0_rdata,
    mmCSR_AXI4_s_0_rready => mmCSR_AXI4_s_0_rready,
    mmCSR_AXI4_s_0_rresp => mmCSR_AXI4_s_0_rresp,
    mmCSR_AXI4_s_0_rvalid => mmCSR_AXI4_s_0_rvalid,
    mmCSR_AXI4_s_0_wdata => mmCSR_AXI4_s_0_wdata,
    mmCSR_AXI4_s_0_wready => mmCSR_AXI4_s_0_wready,
    mmCSR_AXI4_s_0_wstrb => mmCSR_AXI4_s_0_wstrb,
    mmCSR_AXI4_s_0_wvalid => mmCSR_AXI4_s_0_wvalid,
    mmcsr_axi4_s_aclk_0 => mmcsr_axi4_s_aclk_0,
    mmcsr_axi4_s_aresetn_0 => mmcsr_axi4_s_aresetn_0,
    mscratch_debug_0 => mscratch_debug_0,
    mstatus_debug_0 => mstatus_debug_0,
    mtval_debug_0 => mtval_debug_0,
    mtvec_debug_0 => mtvec_debug_0,
    system_clk => system_clk,
    system_reset_async => system_reset_async,
    x10_0 => x10_0,
    x11_0 => x11_0,
    x12_0 => x12_0,
    x13_0 => x13_0,
    x14_0 => x14_0,
    x15_0 => x15_0,
    x16_0 => x16_0,
    x17_0 => x17_0,
    x18_0 => x18_0,
    x19_0 => x19_0,
    x1_0 => x1_0,
    x20_0 => x20_0,
    x21_0 => x21_0,
    x22_0 => x22_0,
    x23_0 => x23_0,
    x24_0 => x24_0,
    x25_0 => x25_0,
    x26_0 => x26_0,
    x27_0 => x27_0,
    x28_0 => x28_0,
    x29_0 => x29_0,
    x2_0 => x2_0,
    x30_0 => x30_0,
    x31_0 => x31_0,
    x3_0 => x3_0,
    x4_0 => x4_0,
    x5_0 => x5_0,
    x6_0 => x6_0,
    x7_0 => x7_0,
    x8_0 => x8_0,
    x9_0 => x9_0
  );


end rtl;
