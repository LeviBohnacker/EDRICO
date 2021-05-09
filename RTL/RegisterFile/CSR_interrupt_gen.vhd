----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2021 09:34:33 PM
-- Design Name: 
-- Module Name: CSR_interrupt_gen - rtl
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CSR_interrupt_gen is
    Port ( MSIE : in STD_LOGIC;
           MTIE : in STD_LOGIC;
           MSIP : in STD_LOGIC;
           MTIP : in STD_LOGIC;
           MIE : in STD_LOGIC;
           mtime_interrupt : out STD_LOGIC;
           mSW_interrupt : out STD_LOGIC);
end CSR_interrupt_gen;

architecture rtl of CSR_interrupt_gen is

begin


end Behavioral;
