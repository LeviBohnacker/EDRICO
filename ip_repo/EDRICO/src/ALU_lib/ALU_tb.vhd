----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 10/06/2021 07:10:15 AM
-- Design Name: ALU_tb
-- Module Name: ALU_tb
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  ALU performs arithmetic operation with the two input
--  registers depending on Control Unit signal (alu_op) from decoded 
--  instruction.
--  This is a testbench for ALU.vhd implementation.
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
entity ALU_tb is
end ALU_tb;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of ALU_tb is
component ALU
port(
    in_a, in_b: in std_logic_vector(31 downto 0);
    alu_op: in std_logic_vector(3 downto 0);
    alu_result: out std_logic_vector(31 downto 0);
    branch_re: out std_logic
);
end component;
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
-- inputs
signal in_a, in_b: std_logic_vector(31 downto 0);
signal alu_op: std_logic_vector(3 downto 0);
-- outputs
signal alu_result: std_logic_vector(31 downto 0);
signal branch_re: std_logic;
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

-- instantiate uut
begin
uut: ALU port map(
    in_a => in_a,
    in_b => in_b,
    alu_op => alu_op,
    alu_result => alu_result,
    branch_re => branch_re
);

stim: process
    begin
        -- set input signal
        wait for 100ns;
        in_a <= "00000000000000000000000000000010";
        in_b <= "00000000000000000000000001000000";

        -- set op signal
        alu_op <= "0000";
        wait for 100ns;
        alu_op <= "0001";
        wait for 100ns;
        alu_op <= "0010";
        wait for 100ns;
        alu_op <= "0011";
        wait for 100ns;
        alu_op <= "0100";
        wait for 100ns;
        alu_op <= "0101";
        wait for 100ns;
        alu_op <= "0110";
        wait for 100ns;
        alu_op <= "0111";
        wait for 100ns;
        alu_op <= "1000";
        wait for 100ns;
        alu_op <= "1001";
        wait for 100ns;
        alu_op <= "1010";
        wait for 100ns;
        alu_op <= "1011";
        wait for 100ns;
        alu_op <= "1100";
        wait for 100ns;
        alu_op <= "1101";
        wait for 100ns;

    end process;
    
end architecture;