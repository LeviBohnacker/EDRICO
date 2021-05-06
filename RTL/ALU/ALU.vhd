----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 05/01/2021 09:10:02 AM
-- Design Name: ALU
-- Module Name: ALU
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  ALU performs arithmetic operation with the two input
--  registers depending on Control Unit signal (alu_op) from decoded 
--  instruction.
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
entity ALU is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- operation code from control unit
    alu_op: in std_logic_vector(3 downto 0);
    -- input registers
    in_a: in std_logic_vector(31 downto 0);
    in_b: in std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    alu_result: out std_logic_vector(31 downto 0)
);
end entity;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of ALU is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------


begin

end architecture;