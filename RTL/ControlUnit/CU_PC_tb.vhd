----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 21.05.2021 20:36:33
-- Design Name: CU_PC_tb
-- Module Name: CU_PC_tb
-- Project Name: EDRICO
-- Target Devices: Arty Z7
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity CU_PC_tb is
end CU_PC_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_PC_tb is
component CU_PC
port(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PCdra and write signal
    PC_dra : in STD_LOGIC_VECTOR (31 downto 0);
    PC_write : in STD_LOGIC;
    --PC load signal
    PC_load : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    --incrementation control signals
    branch_re : in STD_LOGIC;
    type_of_instruction : in STD_LOGIC_VECTOR (3 downto 0);
    --data inputs
    immediate : in STD_LOGIC_VECTOR (31 downto 0);
    data_bus_B : in STD_LOGIC_VECTOR (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    PC_out : out STD_LOGIC_VECTOR (31 downto 0)
);
end component;
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PCdra and write signal
    signal PC_dra : STD_LOGIC_VECTOR (31 downto 0);
    signal PC_write : STD_LOGIC;
    --PC load signal
    signal PC_load : STD_LOGIC;
    --clock and reset
    signal clk : STD_LOGIC;
    signal reset : STD_LOGIC;
    --incrementation control signals
    signal branch_re : STD_LOGIC;
    signal type_of_instruction : STD_LOGIC_VECTOR (3 downto 0);
    --data inputs
    signal immediate : STD_LOGIC_VECTOR (31 downto 0);
    signal data_bus_B : STD_LOGIC_VECTOR (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    signal PC_out : STD_LOGIC_VECTOR (31 downto 0);

begin
clk <= no clk after 5ns;
dut:CU_PC port map(
    PC_dra => Pc_dra,
    PC_write => PC_write,
    PC_load => PC_load,
    clk => clk,
    reset => reset,
    branch_re => branch_re,
    type_of_instruction => type_of_instruction,
    immediate => immediate,
    data_bus_B => data_bus,
    PC_out => PC_out
);

stim: process
begin


end process;
end architecture;