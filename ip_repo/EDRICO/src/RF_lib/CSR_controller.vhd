----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/06/2021 06:31:49 PM
-- Design Name: CSR_RF
-- Module Name: CSR_controller - Behavioral
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module translates the CSR_address, _write and _read signals to the
--  select signals. If a not implemented register is accessed or a write is 
--  issued to a read only register, an illegal-instruction exception is raised.
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
use IEEE.numeric_std.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity CSR_controller is
Port ( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --CSR control signals
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_write : in STD_LOGIC;
    CSR_read : in STD_LOGIC;
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --CSR select signals
    CSR_read_sel : out STD_LOGIC_VECTOR (5 downto 0);
    CSR_write_sel : out STD_LOGIC_VECTOR (32 downto 0);
    --exception signals
    illegal_instruction_exception : out STD_LOGIC
);
end CSR_controller;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture Behavioral of CSR_controller is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal CSR_read_sel_int: std_logic_vector(5 downto 0);

begin

----------------------------------------------------------------------------------
--CSR_read_sel gen
--  generate CSR_read_sel signal from CSR_address signals.
----------------------------------------------------------------------------------
CSR_read_sel_int <= "000001" when CSR_address = x"300" else    --mstatus
                    "000010" when CSR_address = x"B82" else    --minstretH
                    "000011" when CSR_address = x"304" else    --mie
                    "000100" when CSR_address = x"305" else    --mtvec
                    "000101" when CSR_address = x"320" else    --mcountinhibit
                    "000110" when CSR_address = x"340" else    --mscratch
                    "000111" when CSR_address = x"341" else    --mepc
                    "001000" when CSR_address = x"342" else    --mcause
                    "001001" when CSR_address = x"343" else    --mtval
                    "001010" when CSR_address = x"344" else    --mip
                    "001011" when CSR_address = x"3A0" else    --pmpcfg0
                    "001100" when CSR_address = x"3A1" else    --pmpcfg1
                    "001101" when CSR_address = x"3A2" else    --pmpcfg2
                    "001110" when CSR_address = x"3A3" else    --pmpcfg3
                    "001111" when CSR_address = x"3B0" else    --pmpaddr0
                    "010000" when CSR_address = x"3B1" else    --pmpaddr1
                    "010001" when CSR_address = x"3B2" else    --pmpaddr2
                    "010010" when CSR_address = x"3B3" else    --pmpaddr3
                    "010011" when CSR_address = x"3B4" else    --pmpaddr4
                    "010100" when CSR_address = x"3B5" else    --pmpaddr5
                    "010101" when CSR_address = x"3B6" else    --pmpaddr6
                    "010110" when CSR_address = x"3B7" else    --pmpaddr7
                    "010111" when CSR_address = x"3B8" else    --pmpaddr8
                    "011000" when CSR_address = x"3B9" else    --pmpaddr9
                    "011001" when CSR_address = x"3BA" else    --pmpaddr10
                    "011010" when CSR_address = x"3BB" else    --pmpaddr11
                    "011011" when CSR_address = x"3BC" else    --pmpaddr12
                    "011100" when CSR_address = x"3BD" else    --pmpaddr13
                    "011101" when CSR_address = x"3BE" else    --pmpaddr14
                    "011110" when CSR_address = x"3BF" else    --pmpaddr15
                    "011111" when CSR_address = x"B00" else    --mcycle
                    "100000" when CSR_address = x"B02" else    --minstret
                    "100001" when CSR_address = x"B80" else    --mcycleH
                    "100010" when CSR_address = x"301" else    --misa
                    "000000" when ((unsigned(CSR_address) >= x"323" and unsigned(CSR_address) <= x"33F") or (unsigned(CSR_address) >= x"B03" and unsigned(CSR_address) <= x"B1F") or (unsigned(CSR_address) >= x"B83" and unsigned(CSR_address) <= x"B9F") or (unsigned(CSR_address) >= x"F11" and unsigned(CSR_address) <= x"F14")) else --hardwired to zero registers 
                    "111111"; --cause illegal instruction_exception
CSR_read_sel <= CSR_read_sel_int when (CSR_read = '1' and CSR_read_sel_int /= "111111") else
                (others => '0');

----------------------------------------------------------------------------------
--CSR_write_sel gen
--  generate CSR_write_sel signal from CSR_read_sel_int signal if it does not
--  access a read-only signal and if the CSR_write signal is high. If a write is 
--  issued to a register which is hardwired to zero, simply no register will be
--  written.
----------------------------------------------------------------------------------
set_write_sel:process(CSR_read_sel_int, CSR_write)
variable CSR_write_buffer: std_logic_vector(32 downto 0);
begin
    if(CSR_read_sel_int = "100010" or CSR_read_sel_int = "000000" or CSR_read_sel_int = "111111" or CSR_read_sel_int = "UUUUUU" or CSR_write = '0') then
        CSR_write_sel <= (others => '0');
    else
        CSR_write_buffer := (others => '0');
        CSR_write_buffer(to_integer(unsigned(CSR_read_sel_int))-1) := '1';
        CSR_write_sel <= CSR_write_buffer;
    end if;
end process;

----------------------------------------------------------------------------------
--illegal_instruction_exception gen
--  generate a illegal instruction exception pending signal if either a not 
--  implemented register is accessed, or read-only register is written.
----------------------------------------------------------------------------------
illegal_instruction_exception <= '1' when CSR_read_sel_int = "111111" and (CSR_read='1' or CSR_write='1') else  --when a not implemented CSR is accessed
                                 '1' when (CSR_read_sel_int = "100010" and CSR_write = '1') or ((CSR_address = x"F11" or CSR_address = x"F12" or CSR_address = x"F13" or CSR_address = x"F14") and CSR_write = '1') else    --when a write to a read-only CSR is issued
                                 '0';
                
                


end Behavioral;
