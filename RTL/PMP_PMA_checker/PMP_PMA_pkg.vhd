----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2021 09:10:02 AM
-- Design Name: 
-- Module Name:  - 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

package PMP_PMA_pkg is

----------------------------------------------------------------------------------
--TYPES
----------------------------------------------------------------------------------
type type_pmpcfg is array (15 downto 0) of std_logic_vector(7 downto 0);
type type_pmpaddr is array (15 downto 0) of std_logic_vector(31 downto 0);

----------------------------------------------------------------------------------
--COMPONENTS
----------------------------------------------------------------------------------
component PMP_unit is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP register inputs
    pmpcfg : in std_logic_vector(7 downto 0);
    pmpaddr : in std_logic_vector(31 downto 0);
    pmpaddrLow : in std_logic_vector(31 downto 0);
    --control signal inputs
    address_upper: in std_logic_vector(31 downto 0);
    readWrite, instruction : in std_logic;
    --address to check
    address : in std_logic_vector(31 downto 0);
    
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    address_hit: out std_logic;
    exception_hit: out std_logic
);
end component;

end package;