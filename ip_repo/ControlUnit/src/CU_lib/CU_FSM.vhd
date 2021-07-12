----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 12.05.2021 13:34:56
-- Design Name: CU_FSM 
-- Module Name: ControlUnit
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  FSM for Control Unit
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
entity CU_FSM is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    memOP_finished: in std_logic;
    halt_core: in std_logic;
    reset: in std_logic;
    clk: in std_logic;
    type_of_instruction: in std_logic_vector(3 downto 0);
    exception: in std_logic;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    PMP_enable_FSM: out std_logic;
    PMP_instruction_FSM: out std_logic;
    PMP_size_FSM: out std_logic_vector(1 downto 0);
    PMP_rw_FSM: out std_logic;
    instruction_fetch: out std_logic;
    clear_execute_Buffer: out std_logic;
    execute_enable: out std_logic;
    PC_load: out std_logic;
    instruction_finished: out std_logic               
);
end entity;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_FSM is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
type type_CUFSM_state is (FSM_RESET, FSM_HALT_CORE, FSM_FETCH, FSM_EXECUTE, FSM_EXECUTE_MEM, FSM_WAIT);
signal present_state, next_state: type_CUFSM_state;

begin
----------------------------------------------------------------------------------
--sync_process
--  process to hold current status
----------------------------------------------------------------------------------
sync_process: process(halt_core, clk, reset) 
begin
    --if(halt_core = '1') then
    --   present_state <= FSM_HALT_CORE;
    if(reset = '1') then
        present_state <= FSM_RESET;
    elsif(clk'event and clk ='1') then 
        present_state <= next_state;
    end if;
end process sync_process;

comb_process: process(halt_core, memOP_finished, reset, type_of_instruction, present_state)
begin 
    case present_state is
        when FSM_RESET =>
        -- when in FSM reset, either go to halt core or in next clock cycle co to fetch status
            if(halt_core = '1') then
                next_state <= FSM_HALT_CORE;
            else
                next_state <= FSM_FETCH;
            end if;
            PMP_enable_FSM <= '0';
            PMP_instruction_FSM <= '0';
            PMP_size_FSM <= "00";
            PMP_rw_FSM <= '0';
            instruction_fetch <= '0';
            execute_enable <= '0';
            PC_load <= '0';
            instruction_finished <= '0';
            clear_execute_Buffer <= '0';
              

        when FSM_HALT_CORE =>
        -- when in halt core, stay if still active or go to fetch status if halt over
            if(halt_core = '1') then
                next_state <= FSM_HALT_CORE;
            else
                next_state <= FSM_FETCH;
            end if;
            PMP_enable_FSM <= '0';
            PMP_instruction_FSM <= '0';
            PMP_size_FSM <= "00";
            PMP_rw_FSM <= '0';
            instruction_fetch <= '0';
            execute_enable <= '0';
            PC_load <= '0';
            instruction_finished <= '0';
            clear_execute_Buffer <= '1';
                       

        when FSM_FETCH =>
        -- when in fetch either go to halt, go to execute (only if memory operation is finished) or stay in fetch
            if(halt_core = '1') then
                next_state <= FSM_HALT_CORE;
            elsif(memOP_finished = '1') then
                next_state <= FSM_EXECUTE;
            else
                next_state <= FSM_FETCH;
            end if;
            PMP_enable_FSM <= '1';
            PMP_instruction_FSM <= '1';
            PMP_size_FSM <= "10";
            PMP_rw_FSM <= '0';
            instruction_fetch <= '1';
            execute_enable <= '0';
            PC_load <= '0';
            instruction_finished <= '0';
            clear_execute_Buffer <= '1';
           
                      
        
        when FSM_EXECUTE =>
        -- when in execute, go to execute_mem if instruction type is memory type, or go to wait if normal operation
            if(halt_core = '1') then
                next_state <= FSM_HALT_CORE;
            elsif(type_of_instruction(0) = '1') then
                next_state <= FSM_EXECUTE_MEM;
            else
                next_state <= FSM_WAIT;
            end if;
            PMP_enable_FSM <= '0';
            PMP_instruction_FSM <= '0';
            PMP_size_FSM <= "00";
            PMP_rw_FSM <= '0';
            instruction_fetch <= '0';
            execute_enable <= '1';
            PC_load <= '0';
            instruction_finished <= '0';
            clear_execute_Buffer <= '0';
                         

        when FSM_EXECUTE_MEM =>
        -- wait for memory execution or go to wait state if operation finished
            if(halt_core = '1' or exception = '1') then
                next_state <= FSM_HALT_CORE;
            elsif(memOP_finished = '1') then
                next_state <= FSM_WAIT;
            else
                next_state <= FSM_EXECUTE_MEM;
            end if;
            PMP_enable_FSM <= '0';
            PMP_instruction_FSM <= '0';
            PMP_size_FSM <= "00";
            PMP_rw_FSM <= '0';
            instruction_fetch <= '0';
            execute_enable <= '0';
            PC_load <= '0';
            instruction_finished <= '0'; 
            clear_execute_Buffer <= '0';
          

        when FSM_WAIT =>
        -- when in wait either go to halt core or to fetch state in next clock cycle
            if(halt_core = '1') then
                next_state <= FSM_HALT_CORE;
            else
                next_state <= FSM_FETCH;
            end if;
            PMP_enable_FSM <= '0';
            PMP_instruction_FSM <= '1';
            PMP_size_FSM <= "10";
            PMP_rw_FSM <= '0';
            instruction_fetch <= '1';
            execute_enable <= '0';
            PC_load <= '1';
            instruction_finished <= '1';
            clear_execute_Buffer <= '0';
                        
    end case;
end process comb_process;
end architecture;

