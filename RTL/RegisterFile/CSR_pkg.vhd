----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/10/2021 09:59:59 PM
-- Design Name: CSR_RF
-- Module Name: CSR_pkg - 
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package contains all components for the CSR_RF design.
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library PMP_PMA_lib;
use PMP_PMA_lib.PMP_PMA_pkg.all;

package CSR_pkg is

----------------------------------------------------------------------------------
--components
----------------------------------------------------------------------------------
component CSR_interrupt_gen is
port ( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --enable signals
    MSIE : in STD_LOGIC;
    MTIE : in STD_LOGIC;
    MIE : in STD_LOGIC;
    --pending signals
    MSIP : in STD_LOGIC;
    MTIP : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --interrupt outputs
    mtime_interrupt : out STD_LOGIC;
    mSW_interrupt : out STD_LOGIC
);
end component;

component CSR_controller is
Port ( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --CSR control signals
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_write : in STD_LOGIC;
    CSR_read : in STD_LOGIC;
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --CSR select signals
    CSR_read_sel : out STD_LOGIC_VECTOR (5 downto 0);
    CSR_write_sel : out STD_LOGIC_VECTOR (32 downto 0);
    --exception signals
    illegal_instruction_exception : out STD_LOGIC
);
end component;

component CSR_top is
port ( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --data input
    data_in : in STD_LOGIC_VECTOR (31 downto 0);
    --interrupt pending bit dra's
    MSIP_dra : in STD_LOGIC;
    MTIP_dra : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset: in STD_LOGIC;
    --instruction finished flag
    instr_finished : in STD_LOGIC;
    --CSR controll signals
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_read : in STD_LOGIC;
    CSR_write : in STD_LOGIC;
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    data_bus_B : out STD_LOGIC_VECTOR (31 downto 0);
    --pmp dra outputs
    pmpcfg_dra : out type_pmpcfg;
    pmpaddr_dra : out type_pmpaddr;
    --interrupt pending flags
    iie_CSR: out STD_LOGIC;
    mtime_interrupt : out STD_LOGIC;
    mSW_interrupt : out STD_LOGIC
);
end component;


end package;
