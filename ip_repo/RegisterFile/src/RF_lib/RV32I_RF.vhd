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
use IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity RV32I_RF is
port (
    ------------------------------------------------------------------------------
    --input signals 
    ------------------------------------------------------------------------------
    --control singlas
    register_write : in STD_LOGIC_VECTOR (4 downto 0);
    register_read_A : in STD_LOGIC_VECTOR (4 downto 0);
    register_read_B : in STD_LOGIC_VECTOR (4 downto 0);
    --data in
    data_in : in STD_LOGIC_VECTOR (31 downto 0);
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals 
    ------------------------------------------------------------------------------
    data_bus_A : out STD_LOGIC_VECTOR (31 downto 0);
    data_bus_B : out STD_LOGIC_VECTOR (31 downto 0);
    ------------------------------------------------------------------------------
    --debug outputs
    ------------------------------------------------------------------------------
    x1 : out STD_LOGIC_VECTOR(31 downto 0);
    x2 : out STD_LOGIC_VECTOR(31 downto 0);
    x3 : out STD_LOGIC_VECTOR(31 downto 0);
    x4 : out STD_LOGIC_VECTOR(31 downto 0);
    x5 : out STD_LOGIC_VECTOR(31 downto 0);
    x6 : out STD_LOGIC_VECTOR(31 downto 0);
    x7 : out STD_LOGIC_VECTOR(31 downto 0);
    x8 : out STD_LOGIC_VECTOR(31 downto 0);
    x9 : out STD_LOGIC_VECTOR(31 downto 0);
    x10 : out STD_LOGIC_VECTOR(31 downto 0);
    x11 : out STD_LOGIC_VECTOR(31 downto 0);
    x12 : out STD_LOGIC_VECTOR(31 downto 0);
    x13 : out STD_LOGIC_VECTOR(31 downto 0);
    x14 : out STD_LOGIC_VECTOR(31 downto 0);
    x15 : out STD_LOGIC_VECTOR(31 downto 0);
    x16 : out STD_LOGIC_VECTOR(31 downto 0);
    x17 : out STD_LOGIC_VECTOR(31 downto 0);
    x18 : out STD_LOGIC_VECTOR(31 downto 0);
    x19 : out STD_LOGIC_VECTOR(31 downto 0);
    x20 : out STD_LOGIC_VECTOR(31 downto 0);
    x21 : out STD_LOGIC_VECTOR(31 downto 0);
    x22 : out STD_LOGIC_VECTOR(31 downto 0);
    x23 : out STD_LOGIC_VECTOR(31 downto 0);
    x24 : out STD_LOGIC_VECTOR(31 downto 0);
    x25 : out STD_LOGIC_VECTOR(31 downto 0);
    x26 : out STD_LOGIC_VECTOR(31 downto 0);
    x27 : out STD_LOGIC_VECTOR(31 downto 0);
    x28 : out STD_LOGIC_VECTOR(31 downto 0);
    x29 : out STD_LOGIC_VECTOR(31 downto 0);
    x30 : out STD_LOGIC_VECTOR(31 downto 0);
    x31 : out STD_LOGIC_VECTOR(31 downto 0)
);
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
----------------------------------------------------------------------------------
--debug outputs
----------------------------------------------------------------------------------
x1 <= xReg(1);
x2 <= xReg(2);
x3 <= xReg(3);
x4 <= xReg(4);
x5 <= xReg(5);
x6 <= xReg(6);
x7 <= xReg(7);
x8 <= xReg(8);
x9 <= xReg(9);
x10 <= xReg(10);
x11 <= xReg(11);
x12 <= xReg(12);
x13 <= xReg(13);
x14 <= xReg(14);
x15 <= xReg(15);
x16 <= xReg(16);
x17 <= xReg(17);
x18 <= xReg(18);
x19 <= xReg(19);
x20 <= xReg(20);
x21 <= xReg(21);
x22 <= xReg(22);
x23 <= xReg(23);
x24 <= xReg(24);
x25 <= xReg(25);
x26 <= xReg(26);
x27 <= xReg(27);
x28 <= xReg(28);
x29 <= xReg(29);
x30 <= xReg(30);
x31 <= xReg(31);

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
        if(register_write /= "00000") then
            xReg(to_integer(unsigned(register_write))) <= data_in;
        end if;
    end if;
end process;

----------------------------------------------------------------------------------
--output A mux
--  multiplexer to connect the right register to the corresponding data bus A
----------------------------------------------------------------------------------
data_bus_A <=   xReg(0) when register_read_A = "00000" else
                xReg(1) when register_read_A = "00001" else
                xReg(2) when register_read_A = "00010" else
                xReg(3) when register_read_A = "00011" else
                xReg(4) when register_read_A = "00100" else
                xReg(5) when register_read_A = "00101" else
                xReg(6) when register_read_A = "00110" else
                xReg(7) when register_read_A = "00111" else
                xReg(8) when register_read_A = "01000" else
                xReg(9) when register_read_A = "01001" else
                xReg(10) when register_read_A = "01010" else
                xReg(11) when register_read_A = "01011" else
                xReg(12) when register_read_A = "01100" else
                xReg(13) when register_read_A = "01101" else
                xReg(14) when register_read_A = "01110" else
                xReg(15) when register_read_A = "01111" else
                xReg(16) when register_read_A = "10000" else
                xReg(17) when register_read_A = "10001" else
                xReg(18) when register_read_A = "10010" else
                xReg(19) when register_read_A = "10011" else
                xReg(20) when register_read_A = "10100" else
                xReg(21) when register_read_A = "10101" else
                xReg(22) when register_read_A = "10110" else
                xReg(23) when register_read_A = "10111" else
                xReg(24) when register_read_A = "11000" else
                xReg(25) when register_read_A = "11001" else
                xReg(26) when register_read_A = "11010" else
                xReg(27) when register_read_A = "11011" else
                xReg(28) when register_read_A = "11100" else
                xReg(29) when register_read_A = "11101" else
                xReg(30) when register_read_A = "11110" else
                xReg(31) when register_read_A = "11111" else
                x"00000000";
                
----------------------------------------------------------------------------------
--output B mux
--  multiplexer to connect the right register to the corresponding data bus B
----------------------------------------------------------------------------------
data_bus_B <=   xReg(0) when register_read_B = "00000" else
                xReg(1) when register_read_B = "00001" else
                xReg(2) when register_read_B = "00010" else
                xReg(3) when register_read_B = "00011" else
                xReg(4) when register_read_B = "00100" else
                xReg(5) when register_read_B = "00101" else
                xReg(6) when register_read_B = "00110" else
                xReg(7) when register_read_B = "00111" else
                xReg(8) when register_read_B = "01000" else
                xReg(9) when register_read_B = "01001" else
                xReg(10) when register_read_B = "01010" else
                xReg(11) when register_read_B = "01011" else
                xReg(12) when register_read_B = "01100" else
                xReg(13) when register_read_B = "01101" else
                xReg(14) when register_read_B = "01110" else
                xReg(15) when register_read_B = "01111" else
                xReg(16) when register_read_B = "10000" else
                xReg(17) when register_read_B = "10001" else
                xReg(18) when register_read_B = "10010" else
                xReg(19) when register_read_B = "10011" else
                xReg(20) when register_read_B = "10100" else
                xReg(21) when register_read_B = "10101" else
                xReg(22) when register_read_B = "10110" else
                xReg(23) when register_read_B = "10111" else
                xReg(24) when register_read_B = "11000" else
                xReg(25) when register_read_B = "11001" else
                xReg(26) when register_read_B = "11010" else
                xReg(27) when register_read_B = "11011" else
                xReg(28) when register_read_B = "11100" else
                xReg(29) when register_read_B = "11101" else
                xReg(30) when register_read_B = "11110" else
                xReg(31) when register_read_B = "11111" else
                x"00000000";
               

end rtl;
