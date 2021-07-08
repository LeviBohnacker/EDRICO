----------------------------------------------------------------------------------
-- Company: DHBW Ravensburg
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 07/07/2021 01:14:25 PM
-- Design Name: MUX_32_3
-- Module Name: MUX_32_3
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This is a multiplexer with two inputs and three 32-Bit outputs:
--      control: "00" => output: 4
--      control: "01" => output: A_in
--      control: "10" | "11" => output: B_in
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
entity MUX_32_3 is
    port(
        control : in std_logic_vector(1 downto 0);
        A_in, B_in : in std_logic_vector(31 downto 0);
        C_out : out std_logic_vector(31 downto 0)
    );
end entity;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of MUX_32_3 is 
begin

    ------------------------------------------------------------------------------
    --Multiplexer
    ------------------------------------------------------------------------------
    MUX: process(control, A_in, B_in) 
    begin
        if(control = "00") then
            C_out <= x"00000004";
        elsif(control = "01") then
            C_out <= A_in;
        else
            C_out <= B_in;
        end if;
    end process;


end architecture; 