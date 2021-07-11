----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/13/2021 03:48:12 PM
-- Design Name: data_mask_unit
-- Module Name: data_mask_unit - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this unit is used to mask incoming and outcoming data in the case of byte 
--  and halfword data accesses
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
use IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity data_mask_unit is
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
end data_mask_unit;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of data_mask_unit is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal data_in, data_out : std_logic_vector(31 downto 0);
begin

----------------------------------------------------------------------------------
--DMU IN MUX
----------------------------------------------------------------------------------
data_in <=  data_bus_A when DMU_IN_MUX_ctrl = '1' else
            LoadBufferRegister;
            
----------------------------------------------------------------------------------
--DMU OUT DEMUX
----------------------------------------------------------------------------------
data_load <=    data_out when DMU_OUT_MUX_ctrl = '1' else
                (others => '0');

data_store <=   data_out when DMU_OUT_MUX_ctrl = '0' else
                (others => '0');
                
----------------------------------------------------------------------------------
--DataMaskUnit
--  mask_ctrl:
--  "000" = byte sign extend
--  "001" = byte zero extend
--  "010" = halfword sign extend
--  "011" = halfword zero extend
--  "1xx" = pass through
----------------------------------------------------------------------------------
data_out <= std_logic_vector(resize(signed(data_in(7 downto 0)), data_out'length)) when mask_ctrl = "000" else
            std_logic_vector(resize(unsigned(data_in(7 downto 0)), data_out'length)) when mask_ctrl = "001" else
            std_logic_vector(resize(signed(data_in(15 downto 0)), data_out'length)) when mask_ctrl = "010" else
            std_logic_vector(resize(unsigned(data_in(15 downto 0)), data_out'length)) when mask_ctrl = "011" else
            data_in;   

end rtl;
