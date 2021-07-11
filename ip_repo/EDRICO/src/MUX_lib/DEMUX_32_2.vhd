----------------------------------------------------------------------------------
-- Company: DHBW Ravensburg
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 07/09/2021 09:28:09 AM
-- Design Name: DEMUX_32_2
-- Module Name: DEMUX_32_2 - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  Simple 1:2 DEMUX with 32-Bit in-/outputs
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
entity DEMUX_32_2 is
    Port ( C_in : in STD_LOGIC_VECTOR (31 downto 0);
           control : in STD_LOGIC;
           A_out : out STD_LOGIC_VECTOR (31 downto 0);
           B_out : out STD_LOGIC_VECTOR (31 downto 0));
end DEMUX_32_2;

----------------------------------------------------------------------------------
--ARCHITECTURE   
----------------------------------------------------------------------------------
architecture rtl of DEMUX_32_2 is

begin

----------------------------------------------------------------------------------
--Demultiplexer   
----------------------------------------------------------------------------------
DEMUX:process(control, C_in)
begin
    if(control = '1') then
        B_out <= C_in;
        A_out <= x"00000000";
    else
        A_out <= C_in;
        B_out <= x"00000000";
    end if;
end process;

end rtl;
