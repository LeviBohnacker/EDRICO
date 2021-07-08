----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/01/2021 10:26:20 PM
-- Design Name: PMP_PMA_checker
-- Module Name: PMA_checker - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module checks if an address is aligned or not and generates
--  the corresponding enable and exception signals.
-- 
-- Dependencies: <none>
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
entity PMA_checker is
port ( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --control signals
    size : in std_logic_vector(1 downto 0);
    readWrite : in std_logic;
    instruction : in std_logic;
    enable : in std_logic;
    --address to check
    address : in std_logic_vector (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --enable signals
    enable_PMA : out std_logic;
    --exception signals
    load_ame_P : out std_logic;
    storeAMO_ame_P : out std_logic;
    instruction_ame_P : out std_logic
);
end PMA_checker;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of PMA_checker is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal enable_int : std_logic;
begin

----------------------------------------------------------------------------------
--enable generation
--  set enable signal if the address is alligend (according to the size)
---------------------------------------------------------------------------------
enable_int <=   '1' when size = "01" and address(0) = '0' else
                '1' when size = "10" and address(1 downto 0) = "00" else
                '1' when size = "00" else
                '0';
--set enable output only high if global enable is high               
enable_PMA <= enable_int and enable;

----------------------------------------------------------------------------------
--exception gen
--  generate exception signals, if the enable_int signal is not high, whilest
--  global enable is high
---------------------------------------------------------------------------------
load_ame_P <= not enable_int and enable and not readWrite;
storeAMO_ame_P <= not enable_int and enable and readWrite;
instruction_ame_P <= not enable_int and enable and instruction;

end rtl;
