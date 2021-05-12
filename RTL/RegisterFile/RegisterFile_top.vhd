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
    pmpaddr : out type_pmpaddr;
    pmpcfg : out type_pmpcfg
);
end RegisterFile_top;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of RegisterFile_top is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal CSR_data_bus_B, RV32I_data_bus_B : std_logic_vector(31 downto 0);
signal RV32I_data_in : std_logic_vector(31 downto 0);

begin

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
