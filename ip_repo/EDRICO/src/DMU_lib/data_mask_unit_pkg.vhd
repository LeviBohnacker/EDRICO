----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/16/2021 01:56:15 PM
-- Design Name: data_mask_unit
-- Module Name: data_mask_unit_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This package includes the components for the DMU_lib
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
package data_mask_unit_pkg is
----------------------------------------------------------------------------------
--components
----------------------------------------------------------------------------------
component data_mask_unit is
port(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --mux control
    DMU_IN_MUX_ctrl : in std_logic;
    DMU_OUT_MUX_ctrl : in std_logic;
    --mask control
    mask_ctrl : in std_logic_vector(2 downto 0);
    --data inputs
    data_bus_A: in std_logic_vector(31 downto 0);
    LoadBufferRegister : in std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    data_load : out std_logic_vector(31 downto 0);
    data_store: out std_logic_vector(31 downto 0)
);
end component;

end package;
