----------------------------------------------------------------------------------
-- Company: DHBW Ravensburg
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 07/07/2021 01:14:25 PM
-- Design Name: MUX_32_2
-- Module Name: MUX_32_2
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This is a multiplexer with two inputs and a 32-Bit output:
--      control: '0' => C_out: A_in
--      control: '1' => C_out: B_in 
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
--ENTITY
----------------------------------------------------------------------------------
entity MUX_32_2 is
    port(
        control : in std_logic;
        A_in, B_in : in std_logic_vector(31 downto 0);
        C_out : out std_logic_vector(31 downto 0)
    );
end entity;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of MUX_32_2 is 
begin

    ------------------------------------------------------------------------------
    --Multiplexer
    ------------------------------------------------------------------------------
    MUX: process(control, A_in, B_in) 
    begin
        if(control = '1') then
            C_out <= B_in;
        else
            C_out <= A_in;
        end if;
    end process;


end architecture; 