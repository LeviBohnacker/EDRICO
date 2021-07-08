----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2021 10:33:07 PM
-- Design Name: 
-- Module Name: LoadBufferRegister - Behavioral
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

entity LoadBufferRegister is
    Port ( data_in : in STD_LOGIC_VECTOR (31 downto 0);
           store_systemData : in STD_LOGIC;
           clk, reset : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (31 downto 0));
end LoadBufferRegister;

architecture Behavioral of LoadBufferRegister is

begin
reg:process(clk,reset,data_in)
begin
    if(reset = '1') then
        data_out <= x"00000000";
    elsif(clk'event and clk = '1') then
        data_out <= data_in;
    end if;
end process;

end Behavioral;
