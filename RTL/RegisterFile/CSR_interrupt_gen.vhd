----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/09/2021 09:34:33 PM
-- Design Name: CSR_RF
-- Module Name: CSR_interrupt_gen - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module checks the mip, mie and mstatus register and generates the
--  interrupt signals respectively.
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
entity CSR_interrupt_gen is
port ( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --enable signals
    MSIE : in STD_LOGIC;
    MTIE : in STD_LOGIC;
    MIE : in STD_LOGIC;
    --pending signals
    MSIP : in STD_LOGIC;
    MTIP : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --interrupt outputs
    mtime_interrupt : out STD_LOGIC;
    mSW_interrupt : out STD_LOGIC
);
end CSR_interrupt_gen;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CSR_interrupt_gen is

begin

mtime_interrupt <= MTIP and MTIE and MIE;
mSW_interrupt <= MSIP and MSIE and MIE;

end rtl;
