----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/12/2021 12:02:02 PM
-- Design Name: ALU
-- Module Name: ALU_pkg 
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This package contains the component of the ALU module.
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
package ALU_pkg is
----------------------------------------------------------------------------------
--components
----------------------------------------------------------------------------------
component ALU is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- operation code from control unit
    alu_op: in std_logic_vector(3 downto 0);
    -- input registers
    -- in_a: 4, immediate, register A
    -- in_b: program counter, register B
    in_a, in_b: in std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    alu_result: out std_logic_vector(31 downto 0);
    branch_re: out std_logic
);
end component;

end package;