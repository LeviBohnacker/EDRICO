----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/11/2021 07:12:08 PM
-- Design Name: RegisterFile_top
-- Package Name: RF_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package includes all components for the register file module 
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

----------------------------------------------------------------------------------
--PACKAGE
----------------------------------------------------------------------------------
package RF_pkg is
----------------------------------------------------------------------------------
--components
----------------------------------------------------------------------------------
component RV32I_RF is
port (
    ------------------------------------------------------------------------------
    --input signals 
    ------------------------------------------------------------------------------
    --control singlas
    register_write : in STD_LOGIC_VECTOR (4 downto 0);
    register_read_A : in STD_LOGIC_VECTOR (4 downto 0);
    register_read_B : in STD_LOGIC_VECTOR (4 downto 0);
    --data in
    data_in : in STD_LOGIC_VECTOR (31 downto 0);
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals 
    ------------------------------------------------------------------------------
    data_bus_A : out STD_LOGIC_VECTOR (31 downto 0);
    data_bus_B : out STD_LOGIC_VECTOR (31 downto 0)
);
end component;


component RegisterFile_top is
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
    register_write : in STD_LOGIC_VECTOR (31 downto 0);
    register_read_A : in STD_LOGIC_VECTOR (31 downto 0);
    register_read_B : in STD_LOGIC_VECTOR (31 downto 0);
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
    pmpaddr : out type_pmpcfg;
    pmpcfg : out type_pmpaddr
);
end component;

end package;