----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/13/2021 11:49:17 AM
-- Design Name: ControlUnit
-- Module Name: CU_PC - Behavioral
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module contains the PC as well as dedicated incrementation logic, for
--  normal mode, Jump and Branch instructions
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
entity CU_PC is
port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PCdra and write signal
    PC_dra : in STD_LOGIC_VECTOR (31 downto 0);
    PC_write : in STD_LOGIC;
    --PC load signal
    PC_load : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    --incrementation control signals
    branch_re : in STD_LOGIC;
    type_of_instruction : in STD_LOGIC_VECTOR (3 downto 0);
    --data inputs
    immediate : in STD_LOGIC_VECTOR (31 downto 0);
    data_bus_B : in STD_LOGIC_VECTOR (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    PC_out : out STD_LOGIC_VECTOR (31 downto 0)
);
end CU_PC;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture Behavioral of CU_PC is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal PC : std_logic_vector(31 downto 0);
signal PC_next : std_logic_vector(31 downto 0);
signal operand_A, operand_B : std_logic_vector(31 downto 0);

begin

----------------------------------------------------------------------------------
--calculate PC_next signal
--  add PC+4 for normal operation, PC+immediate if a JAL is executed (or branch
--  is taken) and data_bus_B + immediate if JALR instruction is executed.
----------------------------------------------------------------------------------

operand_A <=    immediate when (type_of_instruction(3) or type_of_instruction(2) or (type_of_instruction(1) and branch_re)) = '1' else
                x"00000004";
                
operand_B <=    data_bus_B when type_of_instruction(3) = '1' else
                PC;

PC_next <=  std_logic_vector(unsigned(operand_A) + unsigned(operand_B));


----------------------------------------------------------------------------------
--update PC
--  process to implement PC register
----------------------------------------------------------------------------------
PC_proc: process(reset, clk)
begin
    if(reset = '1') then
        PC <= (others => '0');
    elsif(clk'event and clk='0') then
        if(PC_write = '1') then
            PC <= PC_dra;
        elsif(PC_load = '1') then
            PC <= PC_next;
        end if;
    end if;
end process;

PC_out <= PC;


end Behavioral;











