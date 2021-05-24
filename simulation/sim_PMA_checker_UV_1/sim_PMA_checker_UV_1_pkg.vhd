----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 02:52:06 PM
-- Design Name: PMA_checker
-- Module Name: sim_PMA_checker_UV_1_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module contains the stimulation and verification data for the
--  PMA_checker component.
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
package sim_PMA_checker_UV_1_pkg is
----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
type address_stim is array(natural range <>) of std_logic_vector(31 downto 0);
--control_stim(3) = readWrite, control_stim(2) = instruction, control_stim(1 downto 0) = size
type control_stim is array(natural range <>) of std_logic_vector(3 downto 0);
--result_vect(3) = enable_PMA, result_vect(2) = load_ame_P, result_vect(1) = storeAMO_ame_P. result_vect(0) = instruction_ame_P
type result_vect is array(natural range <>) of std_logic_vector(3 downto 0);
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
constant stimulus_address : address_stim(2 downto 0) :=
    (
        0 => x"DECAFBAD", --address(1 downto 0) = "01"  --byte alligned
        1 => x"DEADAFFE", --address(1 downto 0) = "10"  --half word alligned
        2 => x"ABBA3210"  --address(1 downto 0) = "00"  --worda alligned
    );

--control_stim(3) = readWrite, control_stim(2) = instruction, control_stim(1 downto 0) = size
constant stimulus_control : control_stim(5 downto 0) :=
    (
    --functionality test
    0 => "0001",    --enable
    1 => "0010",    --enable
    2 => "0011",    --enable
    --error test
    3 => "0110",    --load_ame_P, instruction_ame_P
    4 => "1011",    --storeAMO_ame_P
    5 => "1110"     --enable
    );

--result_vect(3) = enable_PMA, result_vect(2) = load_ame_P, result_vect(1) = storeAMO_ame_P. result_vect(0) = instruction_ame_P
constant results: result_vect(5 downto 0) :=
    (
    --functionality test
    0 => "1000",    --enable
    1 => "1000",    --enable
    2 => "1000",    --enable
    --error test
    3 => "0101",    --load_ame_P, instruction_ame_P
    4 => "0010",    --storeAMO_ame_P
    5 => "1000"     --enable
    );

end sim_PMA_checker_UV_1_pkg;

