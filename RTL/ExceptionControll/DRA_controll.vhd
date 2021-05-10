----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/02/2021 07:45:29 PM
-- Design Name: Exception_controll
-- Module Name: DRA_controll - Behavioral
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module manages accesses to the direct register ports of the design.
--  These include the PC, IR and PMP address register.
-- 
-- Dependencies: 
--  <none>
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
entity DRA_controll is
port(
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --dra access signals
    PC_dra_read : in std_logic_vector (31 downto 0);
    IR_dra : in std_logic_vector (31 downto 0);
    PMP_dra : in std_logic_vector (31 downto 0);
    --control signals
    load_PC : in std_logic;
    load_IR : in std_logic;
    load_PMP : in std_logic;
    --data input
    data_out : in std_logic_vector(31 downto 0);
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    PC_dra_write : out std_logic_vector (31 downto 0);
    data_in_dra : out std_logic_vector (31 downto 0)
);
end DRA_controll;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of DRA_controll is

begin

PC_dra_write <= data_out;

----------------------------------------------------------------------------------
--data input multiplexer
----------------------------------------------------------------------------------
data_in_dra <=  PC_dra_read when load_PC = '1' else
                IR_dra when load_IR = '1' else
                PMP_dra when load_PMP = '1' else
                x"00000000";

end rtl;
