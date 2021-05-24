----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 11:12:41 AM
-- Design Name: RegisterFile
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package contains stimuli and verification dat for the 
--  sim_CSR_interrupt_gen_UV_1_tb.vhd testbench.
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
package sim_CSR_interrupt_gen_UV_1_pkg is
----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
--input_stim(4) = MSIE, input_stim(3) = MTIE, input_stim(2) = MIE, input_stim(1) = MSIP, input_stim(0) = MTIP
type input_stim is array(natural range <>) of std_logic_vector(4 downto 0);
--result_vect(1) = mtime_interrupt, result_vect(0) = mSW_interrupt(0)
type result_vect is array(natural range <>) of std_logic_vector(1 downto 0);
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
constant stimulus_input : input_stim(7 downto 0) :=
    (
    0 => "00000",
    1 => "00100",
    2 => "11100",
    3 => "11111",
    4 => "00111",
    5 => "00011",
    6 => "11000",
    7 => "11011"
    );
    
constant results : result_vect(7 downto 0) :=
    (
    0 => "00",
    1 => "00",
    2 => "00",
    3 => "11",
    4 => "00",
    5 => "00",
    6 => "00",
    7 => "00"    
    );

end package;
