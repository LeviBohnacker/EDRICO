----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/11/2021 04:36:28 PM
-- Design Name: Register_File
-- Module Name: RV32I_RF - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module implements the 32 integer general purpose register. x0 is 
--  hardwired to zero.
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
entity RV32I_RF is
    Port ( register_write : in STD_LOGIC_VECTOR (31 downto 0);
           register_read_A : in STD_LOGIC_VECTOR (31 downto 0);
           register_read_B : in STD_LOGIC_VECTOR (31 downto 0);
           data_in : in STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_bus_A : out STD_LOGIC_VECTOR (31 downto 0);
           data_bus_B : out STD_LOGIC_VECTOR (31 downto 0));
end RV32I_RF;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of RV32I_RF is
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
constant x0 : std_logic_vector(31 downto 0) := (others => '0');

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
type RV32I_regs is array (31 downto 0) of std_logic_vector(31 downto 0);
signal xReg: RV32I_regs;

begin
--tie x0 register to zero
xReg(0) <= (others => '0');

----------------------------------------------------------------------------------
--register file write
--  this process writes the RV32I registers on the falling edge
----------------------------------------------------------------------------------
rf: process(reset, clk)
begin
    if(reset = '1') then
        --reset all resetable registers
        xReg <= (others => (others => '0'));
    elsif(clk'event and clk='0') then
        --check the corresponding write bit and perform the write correspondingly
        --writes to zero are ignored
        for i in 1 to 31 loop
            if(register_write(i)='1') then
                xReg(i) <= data_in;
            end if;  
        end loop;
    end if;
end process;

----------------------------------------------------------------------------------
--output A mux
--  multiplexer to connect the right register to the corresponding data bus A
----------------------------------------------------------------------------------
data_bus_A <=   xReg(0) when register_read_A(0) = '1' else
                xReg(1) when register_read_A(1) = '1' else
                xReg(2) when register_read_A(2) = '1' else
                xReg(3) when register_read_A(3) = '1' else
                xReg(4) when register_read_A(4) = '1' else
                xReg(5) when register_read_A(5) = '1' else
                xReg(6) when register_read_A(6) = '1' else
                xReg(7) when register_read_A(7) = '1' else
                xReg(8) when register_read_A(8) = '1' else
                xReg(9) when register_read_A(9) = '1' else
                xReg(10) when register_read_A(10) = '1' else
                xReg(11) when register_read_A(11) = '1' else
                xReg(12) when register_read_A(12) = '1' else
                xReg(13) when register_read_A(13) = '1' else
                xReg(14) when register_read_A(14) = '1' else
                xReg(15) when register_read_A(15) = '1' else
                xReg(16) when register_read_A(16) = '1' else
                xReg(17) when register_read_A(17) = '1' else
                xReg(18) when register_read_A(18) = '1' else
                xReg(19) when register_read_A(19) = '1' else
                xReg(20) when register_read_A(20) = '1' else
                xReg(21) when register_read_A(21) = '1' else
                xReg(22) when register_read_A(22) = '1' else
                xReg(23) when register_read_A(23) = '1' else
                xReg(24) when register_read_A(24) = '1' else
                xReg(25) when register_read_A(25) = '1' else
                xReg(26) when register_read_A(26) = '1' else
                xReg(27) when register_read_A(27) = '1' else
                xReg(28) when register_read_A(28) = '1' else
                xReg(29) when register_read_A(29) = '1' else
                xReg(30) when register_read_A(30) = '1' else
                xReg(31) when register_read_A(31) = '1' else
                x"00000000";
                
----------------------------------------------------------------------------------
--output B mux
--  multiplexer to connect the right register to the corresponding data bus B
----------------------------------------------------------------------------------
data_bus_B <=   xReg(0) when register_read_B(0) = '1' else
                xReg(1) when register_read_B(1) = '1' else
                xReg(2) when register_read_B(2) = '1' else
                xReg(3) when register_read_B(3) = '1' else
                xReg(4) when register_read_B(4) = '1' else
                xReg(5) when register_read_B(5) = '1' else
                xReg(6) when register_read_B(6) = '1' else
                xReg(7) when register_read_B(7) = '1' else
                xReg(8) when register_read_B(8) = '1' else
                xReg(9) when register_read_B(9) = '1' else
                xReg(10) when register_read_B(10) = '1' else
                xReg(11) when register_read_B(11) = '1' else
                xReg(12) when register_read_B(12) = '1' else
                xReg(13) when register_read_B(13) = '1' else
                xReg(14) when register_read_B(14) = '1' else
                xReg(15) when register_read_B(15) = '1' else
                xReg(16) when register_read_B(16) = '1' else
                xReg(17) when register_read_B(17) = '1' else
                xReg(18) when register_read_B(18) = '1' else
                xReg(19) when register_read_B(19) = '1' else
                xReg(20) when register_read_B(20) = '1' else
                xReg(21) when register_read_B(21) = '1' else
                xReg(22) when register_read_B(22) = '1' else
                xReg(23) when register_read_B(23) = '1' else
                xReg(24) when register_read_B(24) = '1' else
                xReg(25) when register_read_B(25) = '1' else
                xReg(26) when register_read_B(26) = '1' else
                xReg(27) when register_read_B(27) = '1' else
                xReg(28) when register_read_B(28) = '1' else
                xReg(29) when register_read_B(29) = '1' else
                xReg(30) when register_read_B(30) = '1' else
                xReg(31) when register_read_B(31) = '1' else
                x"00000000";
               

end rtl;
