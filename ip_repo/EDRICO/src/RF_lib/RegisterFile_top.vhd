----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/11/2021 07:08:31 PM
-- Design Name: RegisterFile_top
-- Module Name: RegisterFile_top - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this is the top module of the register file for EDRICO
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

library PMP_lib;
use PMP_lib.PMP_PMA_pkg.ALL;

library RF_lib;
use RF_lib.RF_pkg.ALL;
use RF_lib.CSR_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity RegisterFile_top is
port ( 
    -----------------------------------------------------------------------------
    --input signals
    -----------------------------------------------------------------------------#
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    --data inputs
    data_in : in STD_LOGIC_VECTOR (31 downto 0);
    msip_dra : in STD_LOGIC;
    mtip_dra : in STD_LOGIC;
    --CSR controll signals
    CSR_save : in STD_LOGIC;
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_write : in STD_LOGIC;
    CSR_read : in STD_LOGIC;
    --instruction finished flag
    instr_finished : in STD_LOGIC;
    --RV32I register controll signals
    register_write : in STD_LOGIC_VECTOR (4 downto 0);
    register_read_A : in STD_LOGIC_VECTOR (4 downto 0);
    register_read_B : in STD_LOGIC_VECTOR (4 downto 0);
    -----------------------------------------------------------------------------
    --output signals
    -----------------------------------------------------------------------------
    --interrupt/exception outputs
    iie_CSR : out STD_LOGIC;
    mti_CSR : out STD_LOGIC;
    msi_CSR : out STD_LOGIC;
    --data outputs
    data_bus_A : out STD_LOGIC_VECTOR (31 downto 0);
    data_bus_B : out STD_LOGIC_VECTOR (31 downto 0);
    pmpcfg_0 : out std_logic_vector(7 downto 0);
    pmpcfg_1 : out std_logic_vector(7 downto 0);
    pmpcfg_2 : out std_logic_vector(7 downto 0);
    pmpcfg_3 : out std_logic_vector(7 downto 0);
    pmpcfg_4 : out std_logic_vector(7 downto 0);
    pmpcfg_5 : out std_logic_vector(7 downto 0);
    pmpcfg_6 : out std_logic_vector(7 downto 0);
    pmpcfg_7 : out std_logic_vector(7 downto 0);
    pmpcfg_8 : out std_logic_vector(7 downto 0);
    pmpcfg_9 : out std_logic_vector(7 downto 0);
    pmpcfg_10 : out std_logic_vector(7 downto 0);
    pmpcfg_11 : out std_logic_vector(7 downto 0);
    pmpcfg_12 : out std_logic_vector(7 downto 0);
    pmpcfg_13 : out std_logic_vector(7 downto 0);
    pmpcfg_14 : out std_logic_vector(7 downto 0);
    pmpcfg_15 : out std_logic_vector(7 downto 0);
    pmpaddr_0: out std_logic_vector(31 downto 0);
    pmpaddr_1: out std_logic_vector(31 downto 0);
    pmpaddr_2: out std_logic_vector(31 downto 0);
    pmpaddr_3: out std_logic_vector(31 downto 0);
    pmpaddr_4: out std_logic_vector(31 downto 0);
    pmpaddr_5: out std_logic_vector(31 downto 0);
    pmpaddr_6: out std_logic_vector(31 downto 0);
    pmpaddr_7: out std_logic_vector(31 downto 0);
    pmpaddr_8: out std_logic_vector(31 downto 0);
    pmpaddr_9: out std_logic_vector(31 downto 0);
    pmpaddr_10: out std_logic_vector(31 downto 0);
    pmpaddr_11: out std_logic_vector(31 downto 0);
    pmpaddr_12: out std_logic_vector(31 downto 0);
    pmpaddr_13: out std_logic_vector(31 downto 0);
    pmpaddr_14: out std_logic_vector(31 downto 0);
    pmpaddr_15: out std_logic_vector(31 downto 0)
);
end RegisterFile_top;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of RegisterFile_top is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal pmpaddr : type_pmpaddr;
signal pmpcfg : type_pmpcfg;
signal CSR_data_bus_B, RV32I_data_bus_B : std_logic_vector(31 downto 0);
signal RV32I_data_in : std_logic_vector(31 downto 0);

begin
----------------------------------------------------------------------------------
--pmp signal associations
----------------------------------------------------------------------------------
pmpcfg_0 <= pmpcfg(0);
pmpcfg_1 <= pmpcfg(1);
pmpcfg_2 <= pmpcfg(2);
pmpcfg_3 <= pmpcfg(3);
pmpcfg_4 <= pmpcfg(4);
pmpcfg_5 <= pmpcfg(5);
pmpcfg_6 <= pmpcfg(6);
pmpcfg_7 <= pmpcfg(7);
pmpcfg_8 <= pmpcfg(8);
pmpcfg_9 <= pmpcfg(9);
pmpcfg_10 <= pmpcfg(10);
pmpcfg_11 <= pmpcfg(11);
pmpcfg_12 <= pmpcfg(12);
pmpcfg_13 <= pmpcfg(13);
pmpcfg_14 <= pmpcfg(14);
pmpcfg_15 <= pmpcfg(15);
pmpaddr_0 <= pmpaddr(0);
pmpaddr_1 <= pmpaddr(1);
pmpaddr_2 <= pmpaddr(2);
pmpaddr_3 <= pmpaddr(3);
pmpaddr_4 <= pmpaddr(4);
pmpaddr_5 <= pmpaddr(5);
pmpaddr_6 <= pmpaddr(6);
pmpaddr_7 <= pmpaddr(7);
pmpaddr_8 <= pmpaddr(8);
pmpaddr_9 <= pmpaddr(9);
pmpaddr_10 <= pmpaddr(10);
pmpaddr_11 <= pmpaddr(11);
pmpaddr_12 <= pmpaddr(12);
pmpaddr_13 <= pmpaddr(13);
pmpaddr_14 <= pmpaddr(14);
pmpaddr_15 <= pmpaddr(15);

----------------------------------------------------------------------------------
--RV32I register file
----------------------------------------------------------------------------------
RV32I_RF_mod: RV32I_RF
port map(
    ------------------------------------------------------------------------------
    --input signals 
    ------------------------------------------------------------------------------
    --control singlas
    register_write => register_write,
    register_read_A => register_read_A,
    register_read_B => register_read_B,
    --data in
    data_in => RV32I_data_in,
    --clock and reset
    clk => clk,
    reset => reset,
    ------------------------------------------------------------------------------
    --output signals 
    ------------------------------------------------------------------------------
    data_bus_A => data_bus_A,
    data_bus_B => RV32I_data_bus_B
);

----------------------------------------------------------------------------------
--CSR register file
----------------------------------------------------------------------------------
CSR_mod: CSR_top
port map( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --data input
    data_in => RV32I_data_in,
    --interrupt pending bit dra's
    MSIP_dra => msip_dra,
    MTIP_dra => mtip_dra,
    --clock and reset
    clk => clk,
    reset => reset,
    --instruction finished flag
    instr_finished => instr_finished,
    --CSR controll signals
    CSR_address => CSR_address,
    CSR_read => CSR_read,
    CSR_write => CSR_write,
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    data_bus_B => CSR_data_bus_B,
    --pmp dra outputs
    pmpcfg_dra => pmpcfg,
    pmpaddr_dra => pmpaddr,
    --interrupt pending flags
    iie_CSR => iie_CSR,
    mtime_interrupt => mti_CSR,
    mSW_interrupt => msi_CSR
);

----------------------------------------------------------------------------------
--data_bus_B output mux
----------------------------------------------------------------------------------
data_bus_B <=   RV32I_data_bus_B when CSR_read = '0' else
                CSR_data_bus_B;
                
----------------------------------------------------------------------------------
--data_in RV32I RF mux
----------------------------------------------------------------------------------
RV32I_data_in <=    data_in when CSR_save = '0' else
                    CSR_data_bus_B;

end rtl;
