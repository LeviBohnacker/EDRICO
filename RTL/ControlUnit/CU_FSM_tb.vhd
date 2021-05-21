----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 14.05.2021 14:36:33
-- Design Name: CU_decoder_tb
-- Module Name: CU_decoder_tb
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  testbench for decoding process, insert different instruction strings to
--  test the decoding procedure
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity CU_FSM_tb is
end CU_FSM_tb;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_FSM_tb is
component CU_FSM
port(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    memOP_finished: in std_logic;
    halt_core: in std_logic;
    reset: in std_logic;
    clk: in std_logic;
    type_of_instruction: in std_logic_vector(3 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    PMP_enable_FSM: out std_logic;
    PMP_instruction_FSM: out std_logic;
    PMP_size_FSM: out std_logic_vector(1 downto 0);
    PMP_rw_FSM: out std_logic;
    instruction_fetch: out std_logic;
    execute_enable: out std_logic;
    PC_load: out std_logic;
    instruction_finished: out std_logic;
    debug_state: out std_logic_vector(4 downto 0)
);
end component;
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
--inputs
    signal memOP_finished: std_logic := '0';
    signal halt_core: std_logic := '0';
    signal reset: std_logic := '0';
    signal clk: std_logic := '0';
    signal type_of_instruction: std_logic_vector(3 downto 0) := "0000";
--outputs
    signal PMP_enable_FSM: std_logic;
    signal PMP_instruction_FSM: std_logic;
    signal PMP_size_FSM: std_logic_vector(1 downto 0);
    signal PMP_rw_FSM: std_logic;
    signal instruction_fetch: std_logic;
    signal execute_enable: std_logic;
    signal PC_load: std_logic;
    signal instruction_finished: std_logic;
    signal debug_state: std_logic_vector(4 downto 0);

begin
clk <= not clk after 2.5ns;
dut: CU_FSM port map(
    memOP_finished => memOP_finished,
    halt_core => halt_core,
    reset => reset,
    clk => clk,
    type_of_instruction => type_of_instruction,
    PMP_enable_FSM => PMP_enable_FSM,
    PMP_instruction_FSM => PMP_instruction_FSM,
    PMP_size_FSM => PMP_size_FSM,
    PMP_rw_FSM => PMP_rw_FSM,
    instruction_fetch => instruction_fetch,
    execute_enable => execute_enable,
    PC_load => PC_load,
    instruction_finished => instruction_finished,
    debug_state => debug_state
);

--states: FSM_RESET, FSM_HALT_CORE, FSM_FETCH, FSM_EXECUTE, FSM_EXECUTE_MEM, FSM_WAIT
stim: process
--to test the FSM all states and processes have to be covered. therefore different parts of testing are implemented 
begin
    --reset signal
    reset <= '1';
    wait for 1ns;
    reset <= '0';   
    
    wait for 5ns;
    memOp_finished <= '1';
    wait for 2ns;
    memOp_finished <= '0';
        
    wait for 10ns;
    memOp_finished <= '1';
    type_of_instruction <= "0001";
    wait for 5ns; 
    memOp_finished <= '0';
    wait for 10ns;
    memOp_finished <= '1';
    wait for 10ns;
    halt_core <= '1';
    wait for 10ns;
    halt_core <= '0';
    wait for 10ns;
    
    
end process;

--check_output: process
--begin
--    wait for 1ns;
--    assert debug_state = "00001" report "NOT in FSM_RESET!" severity error;
--    assert PMP_enable_FSM = '0' report "PMP_enable_FSM wrong" severity error;
--    assert PMP_instruction_FSM = '0' report "PMP_instruction_FSM wrong" severity error;
--    assert PMP_size_FSM = '0' report "PMP_size_FSM wrong" severity error;
--    assert PMP_rw_FSM = '0' report "PMP_rw_FSM wrong" severity error;
--    assert instruction_fetch = '0' report "instruction_fetch wrong" severity error;
--    assert execute_enable = '0' report "execute_enable wrong" severity error;
--    assert PC_load = '0' report "PC_load wrong" severity error;
--    assert instruction_finished = '0' report "instruction_finished wrong" severity error;
--end process;  
end architecture;