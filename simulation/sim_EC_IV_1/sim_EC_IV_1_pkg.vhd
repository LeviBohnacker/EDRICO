----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 11:12:41 AM
-- Design Name: sim_EC_IV_1
-- Module Name: sim_EC_IV_1_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package contains stimuli and verification dat for the 
--  sim_EC_IV_1_tb.vhd testbench.
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
--PACKAGE
----------------------------------------------------------------------------------
package sim_EC_IV_1_pkg is

----------------------------------------------------------------------------------
--COMPONENTS
----------------------------------------------------------------------------------
component sim_EC_IV_1_registers is
generic(
    IR_data : std_logic_vector(31 downto 0) := x"DEADAFFE";
    PMP_data : std_logic_vector(31 downto 0) := x"BADC0DED"
);
port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --CSR signals
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_read : in STD_LOGIC;
    CSR_write : in STD_LOGIC;
    CSR_data_in : in STD_LOGIC_VECTOR (31 downto 0);
    --PC write
    PC_write : in STD_LOGIC;
    PC_dra_write : in STD_LOGIC_VECTOR (31 downto 0);
    --halt core = enable signal
    halt_core : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR data output
    CSR_data_out : out STD_LOGIC_VECTOR (31 downto 0);
    MEPC : out STD_LOGIC_VECTOR (31 downto 0);
    MTVAL : out STD_LOGIC_VECTOR (31 downto 0);
    MSTATUS : out STD_LOGIC_VECTOR (31 downto 0);
    MTVEC : out STD_LOGIC_VECTOR (31 downto 0);
    MCAUSE : out STD_LOGIC_VECTOR (31 downto 0);
    --dra registers
    PC_dra : out STD_LOGIC_VECTOR (31 downto 0);
    IR_dra : out STD_LOGIC_VECTOR (31 downto 0);
    PMP_dra : out STD_LOGIC_VECTOR (31 downto 0)
);
end component;


----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

end package;
