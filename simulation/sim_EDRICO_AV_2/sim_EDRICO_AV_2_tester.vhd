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

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_EDRICO_AV_2_tester is
port ( 
    ----------------------------------------------------------------------------------
    --input signals
    ----------------------------------------------------------------------------------
    --RV32I Register
    x10_0 : in  STD_LOGIC_VECTOR ( 31 downto 0 );
    x11_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x12_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x13_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x14_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x15_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x16_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x17_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x18_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x19_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x1_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x20_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x21_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x22_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x23_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x24_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x25_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x26_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x27_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x28_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x29_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x2_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x30_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x31_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x3_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x4_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x5_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x6_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x7_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x8_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    x9_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    --Control Unit Register
    IR_debug : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PC_debug : in STD_LOGIC_VECTOR ( 31 downto 0 );
    --CSR Register
    mcause_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mcountinhibit_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mcycleH_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mcycle_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mepc_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mie_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    minstretH_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    minstret_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mip_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    misa_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mscratch_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mstatus_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mtval_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mtvec_debug_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    --AXI master bus
--    araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
--    arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
--    arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
--    arready : in STD_LOGIC;
--    arvalid : in STD_LOGIC;
--    awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
--    awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
--    awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
--    awready : in STD_LOGIC;
--    awvalid : in STD_LOGIC;
--    bready : in STD_LOGIC;
--    bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
--    bvalid : in STD_LOGIC;
--    rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
--    rready : in STD_LOGIC;
--    rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
--    rvalid : in STD_LOGIC;
--    wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
--    wready : in STD_LOGIC;
--    wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
--    wvalid : in STD_LOGIC;
    ----------------------------------------------------------------------------------
    --output signals
    ----------------------------------------------------------------------------------
    M_AXI_ARSTN_0 : out STD_LOGIC := '0';
   
    
    system_clk : out STD_LOGIC := '0';
    system_reset_async : out STD_LOGIC := '1'
);
end sim_EDRICO_AV_2_tester;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_EDRICO_AV_2_tester is

----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
constant T : time := 10 ns;
    
begin

----------------------------------------------------------------------------------
--clock generation
----------------------------------------------------------------------------------
system_clk <= not system_clk after T/2;

----------------------------------------------------------------------------------
--reset generation
----------------------------------------------------------------------------------
test: process
begin
    wait for 31 ns;
    system_reset_async <= '0';
    M_AXI_ARSTN_0 <= '1';
    wait;
end process;


end rtl;
