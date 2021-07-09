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
    data_bus_B : out STD_LOGIC_VECTOR (31 downto 0);
    ------------------------------------------------------------------------------
    --debug outputs
    ------------------------------------------------------------------------------
    x1 : out STD_LOGIC_VECTOR(31 downto 0);
    x2 : out STD_LOGIC_VECTOR(31 downto 0);
    x3 : out STD_LOGIC_VECTOR(31 downto 0);
    x4 : out STD_LOGIC_VECTOR(31 downto 0);
    x5 : out STD_LOGIC_VECTOR(31 downto 0);
    x6 : out STD_LOGIC_VECTOR(31 downto 0);
    x7 : out STD_LOGIC_VECTOR(31 downto 0);
    x8 : out STD_LOGIC_VECTOR(31 downto 0);
    x9 : out STD_LOGIC_VECTOR(31 downto 0);
    x10 : out STD_LOGIC_VECTOR(31 downto 0);
    x11 : out STD_LOGIC_VECTOR(31 downto 0);
    x12 : out STD_LOGIC_VECTOR(31 downto 0);
    x13 : out STD_LOGIC_VECTOR(31 downto 0);
    x14 : out STD_LOGIC_VECTOR(31 downto 0);
    x15 : out STD_LOGIC_VECTOR(31 downto 0);
    x16 : out STD_LOGIC_VECTOR(31 downto 0);
    x17 : out STD_LOGIC_VECTOR(31 downto 0);
    x18 : out STD_LOGIC_VECTOR(31 downto 0);
    x19 : out STD_LOGIC_VECTOR(31 downto 0);
    x20 : out STD_LOGIC_VECTOR(31 downto 0);
    x21 : out STD_LOGIC_VECTOR(31 downto 0);
    x22 : out STD_LOGIC_VECTOR(31 downto 0);
    x23 : out STD_LOGIC_VECTOR(31 downto 0);
    x24 : out STD_LOGIC_VECTOR(31 downto 0);
    x25 : out STD_LOGIC_VECTOR(31 downto 0);
    x26 : out STD_LOGIC_VECTOR(31 downto 0);
    x27 : out STD_LOGIC_VECTOR(31 downto 0);
    x28 : out STD_LOGIC_VECTOR(31 downto 0);
    x29 : out STD_LOGIC_VECTOR(31 downto 0);
    x30 : out STD_LOGIC_VECTOR(31 downto 0);
    x31 : out STD_LOGIC_VECTOR(31 downto 0)
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
    pmpaddr_15: out std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --debug outputs
    ------------------------------------------------------------------------------
    x1 : out STD_LOGIC_VECTOR(31 downto 0);
    x2 : out STD_LOGIC_VECTOR(31 downto 0);
    x3 : out STD_LOGIC_VECTOR(31 downto 0);
    x4 : out STD_LOGIC_VECTOR(31 downto 0);
    x5 : out STD_LOGIC_VECTOR(31 downto 0);
    x6 : out STD_LOGIC_VECTOR(31 downto 0);
    x7 : out STD_LOGIC_VECTOR(31 downto 0);
    x8 : out STD_LOGIC_VECTOR(31 downto 0);
    x9 : out STD_LOGIC_VECTOR(31 downto 0);
    x10 : out STD_LOGIC_VECTOR(31 downto 0);
    x11 : out STD_LOGIC_VECTOR(31 downto 0);
    x12 : out STD_LOGIC_VECTOR(31 downto 0);
    x13 : out STD_LOGIC_VECTOR(31 downto 0);
    x14 : out STD_LOGIC_VECTOR(31 downto 0);
    x15 : out STD_LOGIC_VECTOR(31 downto 0);
    x16 : out STD_LOGIC_VECTOR(31 downto 0);
    x17 : out STD_LOGIC_VECTOR(31 downto 0);
    x18 : out STD_LOGIC_VECTOR(31 downto 0);
    x19 : out STD_LOGIC_VECTOR(31 downto 0);
    x20 : out STD_LOGIC_VECTOR(31 downto 0);
    x21 : out STD_LOGIC_VECTOR(31 downto 0);
    x22 : out STD_LOGIC_VECTOR(31 downto 0);
    x23 : out STD_LOGIC_VECTOR(31 downto 0);
    x24 : out STD_LOGIC_VECTOR(31 downto 0);
    x25 : out STD_LOGIC_VECTOR(31 downto 0);
    x26 : out STD_LOGIC_VECTOR(31 downto 0);
    x27 : out STD_LOGIC_VECTOR(31 downto 0);
    x28 : out STD_LOGIC_VECTOR(31 downto 0);
    x29 : out STD_LOGIC_VECTOR(31 downto 0);
    x30 : out STD_LOGIC_VECTOR(31 downto 0);
    x31 : out STD_LOGIC_VECTOR(31 downto 0);
    mcycle_debug : out std_logic_vector(31 downto 0);
    mcycleH_debug : out std_logic_vector(31 downto 0);
    minstret_debug : out std_logic_vector(31 downto 0);
    minstretH_debug : out std_logic_vector(31 downto 0);
    mcountinhibit_debug : out std_logic_vector(31 downto 0);
    mstatus_debug : out std_logic_vector(31 downto 0);
    misa_debug : out std_logic_vector(31 downto 0);
    mie_debug : out std_logic_vector(31 downto 0);
    mtvec_debug : out std_logic_vector(31 downto 0);
    mscratch_debug : out std_logic_vector(31 downto 0);
    mepc_debug : out std_logic_vector(31 downto 0);
    mcause_debug : out std_logic_vector(31 downto 0);
    mtval_debug : out std_logic_vector(31 downto 0);
    mip_debug : out std_logic_vector(31 downto 0)
);
end component;

end package;