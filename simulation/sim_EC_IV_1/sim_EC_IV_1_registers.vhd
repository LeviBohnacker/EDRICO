----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 06/08/2021 11:21:17 PM
-- Design Name: sim_EC_IV_1
-- Module Name: sim_EC_IV_1_registers - Behavioral
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This module contains registers to be modified by the Exception Control 
--  for testing purposes
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
entity sim_EC_IV_1_registers is
generic(
    IR_data : std_logic_vector(31 downto 0) := x"DEADAFFE";
    PMP_data : std_logic_vector(31 downto 0) := x"BADC0DED"
);
port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --CSR signals
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_read : in STD_LOGIC;
    CSR_write : in STD_LOGIC;
    CSR_data_in : in STD_LOGIC_VECTOR (31 downto 0);
    --PC write
    PC_write : in STD_LOGIC;
    PC_dra_write : in STD_LOGIC_VECTOR (31 downto 0);
    --halt core = enable signal
    halt_core : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR data output
    CSR_data_out : out STD_LOGIC_VECTOR (31 downto 0);
    MEPC : out STD_LOGIC_VECTOR (31 downto 0);
    MTVAL : out STD_LOGIC_VECTOR (31 downto 0);
    MSTATUS : out STD_LOGIC_VECTOR (31 downto 0);
    MTVEC : out STD_LOGIC_VECTOR (31 downto 0);
    MCAUSE : out STD_LOGIC_VECTOR (31 downto 0);
    --dra registers
    PC_dra : out STD_LOGIC_VECTOR (31 downto 0);
    IR_dra : out STD_LOGIC_VECTOR (31 downto 0);
    PMP_dra : out STD_LOGIC_VECTOR (31 downto 0)
);
end sim_EC_IV_1_registers;

architecture Behavioral of sim_EC_IV_1_registers is
signal MEPC_int, MTVAL_int, MSTATUS_int, MTVEC_int, MCAUSE_int : STD_LOGIC_VECTOR(31 downto 0);
signal PC_int: STD_LOGIC_VECTOR(31 downto 0);
begin

--write CSR registers (falling edge)
CSR_reg : process(clk, reset, halt_core) begin
    if(reset = '1') then
        MEPC_int <= (others => '0');
        MTVAL_int <= (others => '0');
        MSTATUS_int <= x"00001800";
        MTVEC_int <= (others => '0');
        MCAUSE_int <= (others => '0');
    --update registers only on the falling edge
    elsif(clk'event and clk = '0' and CSR_write = '1'and halt_core = '1') then
        case CSR_address is
            when x"342" =>
                MCAUSE_int <= CSR_data_in;
            when x"300" => 
                MSTATUS_int <= CSR_data_in;
            when x"343" => 
                MTVAL_int <= CSR_data_in;
            when x"305" => 
                MTVEC_int <= CSR_data_in;
            when x"341" =>
                MEPC_int <= CSR_data_in;
        end case;    
    end if;
end process;

--read CSR registers
CSR_data_out <= MCAUSE_int when CSR_address = x"342" and CSR_read = '1' and halt_core = '1' else
                MSTATUS_int when CSR_address = x"300" and CSR_read = '1' and halt_core = '1' else
                MTVAL_int when CSR_address = x"343" and CSR_read = '1' and halt_core = '1' else
                MTVEC_int when CSR_address = x"305" and CSR_read = '1' and halt_core = '1' else
                MEPC_int when CSR_address = x"341" and CSR_read = '1' and halt_core = '1' else
                (others => '0');

--Program Counter
write_PC: process(halt_core, clk, reset) begin
    if(reset = '1') then
        PC_int <= (others => '0');
    elsif(clk'event and clk = '0' and PC_write = '1' and halt_core = '1') then
        PC_int <= PC_dra_write;
    end if;
end process;

--register outputs
PC_dra <= PC_int;
PMP_dra <= x"DEADAFFE";
IR_dra <= x"BADC0DED";

--CSR validation outputs
MCAUSE <= MCAUSE_int;
MSTATUS <= MSTATUS_int;
MTVAL <= MTVAL_int;
MTVEC <= MTVEC_int;
MEPC <= MEPC_int;

end Behavioral;









