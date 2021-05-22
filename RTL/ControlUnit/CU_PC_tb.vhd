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
    signal clk : STD_LOGIC := '0';
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
clk <= not clk after 5ns;
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
    --define values
    PC_dra <= "00000000000000000000000000001000"
    PC_write <= '0';
    PC_load <= '1';
    reset <= '0';
    branch_re <= '0';
    type_of_instruction <= "0000";
    immediate <= "00000000000000000000000000000010";
    data_bus_B <= "00000000000000000000000000000111";
    wait for 5ns;

    --test different cases for the PC control:
    --first case: normal/memory operation -> output should be just PC + 4

    wait for 10ns;
    --second case: branch instruction with branch_re = 0
    type_of_instruction <= "0010";
    --result should be PC + immediate
    wait for 10ns;

    --third case: branch instruction with branch_re = 1
    branch_re <= '1';
    wait for 10ns;

    -- fourth case: operation is a JAL operation
    type_of_instruction <= "0100"
    --result should be PC = PC + immediate
    wait for 10ns;

    --fifth case: JALR operation 
    type_of_instruction <= "1000";
    --result should be PC = data_bus_B + immediate
    wait for 10ns;

    --test if PC_write works
    PC_write <= '1';
    --output should be the PC_dra without any change
    wait for 10ns;
    
    -- test asynchronus reset:
    type_of_instruction <= "0000";
    reset <= '1';
    wait for 10ns;   

end process;

--check_out: process
--begin
--end process;
end architecture;