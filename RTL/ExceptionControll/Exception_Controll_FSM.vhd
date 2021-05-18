----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/04/2021 02:42:19 PM
-- Design Name: Exception_Controll
-- Module Name: Exception_Controll_FSM - Behavioral
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  impelmentation of FSM to controll trap entry and exits
-- 
-- Dependencies: 
--  Exception_Controll_pkg.vhd
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library EC_lib;
use EC_lib.Exception_Controll_pkg.all;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity Exception_Control_FSM is
Port ( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    EI_flag : in STD_LOGIC;
    ret : in STD_LOGIC;
    save_address : in STD_LOGIC;
    save_PC : in STD_LOGIC;
    save_IR : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --halt core signal
    halt_core : out STD_LOGIC;
    --buffer register signals
    buffer_register_w : out STD_LOGIC;
    buffer_register_CSR_DRA : out STD_LOGIC;
    modify_mstatus_EI : out STD_LOGIC;
    modify_mstatus_RET : out STD_LOGIC;
    reset_buffer : out STD_LOGIC;
    --DRA signal
    PC_rw : out STD_LOGIC;
    --DRA_controll signals
    load_PC : out STD_LOGIC;
    load_IR : out STD_LOGIC;
    load_PMP : out STD_LOGIC;
    --CSR_access_unit signals
    load_mepc : out STD_LOGIC;
    load_mtvec : out STD_LOGIC;
    load_mstatus : out STD_LOGIC;
    store_mepc : out STD_LOGIC;
    store_mcause : out STD_LOGIC;
    store_mtval : out STD_LOGIC;
    store_mstatus : out STD_LOGIC
);
end Exception_Control_FSM;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of Exception_Control_FSM is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal present_state, next_state : type_EC_state;

begin

----------------------------------------------------------------------------------
--sync_process
--  process to hold current status
----------------------------------------------------------------------------------
sync_process: process(clk, reset) 
begin
    if(reset='1') then
        present_state <= WFI;
    elsif(clk'event and clk='1') then 
        present_state <= next_state;
    end if;
end process;

comb_process: process(present_state, reset, save_address, save_PC, save_IR)
begin
    if(reset='1') then
        next_state <= WFI;
        --halt core signal
        halt_core <= '0';
        --buffer register signals
        buffer_register_w <= '0';
        buffer_register_CSR_DRA <= '0';
        modify_mstatus_EI <= '0';
        modify_mstatus_RET <= '0';
        reset_buffer <= '0';
        --DRA signal
        PC_rw <= '0';
        --DRA_controll signals
        load_PC <= '0';
        load_IR <= '0';
        load_PMP <= '0';
        --CSR_access_unit signals
        load_mepc <= '0';
        load_mtvec <= '0';
        load_mstatus <= '0';
        store_mepc <= '0';
        store_mcause <= '0';
        store_mtval <= '0';
        store_mstatus <= '0';
    else
        case present_state is
            when WFI =>
                --next state generation
                if(EI_flag = '1') then
                    next_state <= TrapEntry;
                elsif(ret = '1') then
                    next_state <= TrapExit;
                else
                    next_state <= WFI;
                end if;
                --halt core signal
                halt_core <= '0';
                --buffer register signals
                buffer_register_w <= '0';
                buffer_register_CSR_DRA <= '0';
                modify_mstatus_EI <= '0';
                modify_mstatus_RET <= '0';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '0';
                --DRA_controll signals
                load_PC <= '0';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '0';
                load_mstatus <= '0';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '0';
            when TrapEntry =>
                --next state generation
                next_state <= sMEPC;
                --halt core signal
                halt_core <= '1';
                --buffer register signals
                buffer_register_w <= '1';
                buffer_register_CSR_DRA <= '0';
                modify_mstatus_EI <= '0';
                modify_mstatus_RET <= '0';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '0';
                --DRA_controll signals
                load_PC <= '1';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '0';
                load_mstatus <= '0';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '0';
            when sMEPC =>
                --next state generation
                next_state <= sMTVAL;
                --halt core signal
                halt_core <= '0';
                --buffer register signals
                buffer_register_CSR_DRA <= '0';
                modify_mstatus_EI <= '0';
                modify_mstatus_RET <= '0';
                --DRA signal
                PC_rw <= '0';
                
                --determine how buffer_register is loaded
                if(save_address = '1') then
                    load_PMP <= '1';
                    load_IR <= '0';
                    load_PC <= '0';
                    reset_buffer <= '0';
                    buffer_register_w <= '1';
                elsif(save_IR = '1') then
                    load_PMP <= '0';
                    load_IR <= '1';
                    load_PC <= '0';
                    reset_buffer <= '0';
                    buffer_register_w <= '1';
                elsif(save_PC = '1') then
                    load_PMP <= '0';
                    load_IR <= '0';
                    load_PC <= '1';
                    reset_buffer<= '0';
                    buffer_register_w <= '1';
                else 
                    load_PMP <= '0';
                    load_IR <= '0';
                    load_PC <= '0';
                    reset_buffer <= '1';
                    buffer_register_w <= '0';
                end if;
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '0';
                load_mstatus <= '0';
                store_mepc <= '1';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '0';
            when sMTVAL =>
                --next state generation
                next_state <= lMSTATUS;
                --halt core signal
                halt_core <= '0';
                --buffer register signals
                buffer_register_w <= '0';
                buffer_register_CSR_DRA <= '0';
                modify_mstatus_EI <= '0';
                modify_mstatus_RET <= '0';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '0';
                --DRA_controll signals
                load_PC <= '0';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '0';
                load_mstatus <= '0';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '1';
                store_mstatus <= '0';            
            when lMSTATUS =>
                --next state generation
                next_state <= sMSTATUS;
                --halt core signal
                halt_core <= '0';
                --buffer register signals
                buffer_register_w <= '1';
                buffer_register_CSR_DRA <= '1';
                modify_mstatus_EI <= '1';
                modify_mstatus_RET <= '0';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '0';
                --DRA_controll signals
                load_PC <= '0';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '0';
                load_mstatus <= '1';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '0';            
            when sMSTATUS =>
                --next state generation
                next_state <= sPC;
                --halt core signal
                halt_core <= '0';
                --buffer register signals
                buffer_register_w <= '1';
                buffer_register_CSR_DRA <= '1';
                modify_mstatus_EI <= '1';
                modify_mstatus_RET <= '0';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '0';
                --DRA_controll signals
                load_PC <= '0';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '1';
                load_mstatus <= '0';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '1';            
            when sPC =>
                --next state generation
                next_state <= WFI;
                --halt core signal
                halt_core <= '0';
                --buffer register signals
                buffer_register_w <= '0';
                buffer_register_CSR_DRA <= '0';
                modify_mstatus_EI <= '0';
                modify_mstatus_RET <= '0';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '1';
                --DRA_controll signals
                load_PC <= '0';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '0';
                load_mstatus <= '0';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '0';            
            when TrapExit =>
                --next state generation
                next_state <= sPC_ex;
                --halt core signal
                halt_core <= '1';
                --buffer register signals
                buffer_register_w <= '1';
                buffer_register_CSR_DRA <= '1';
                modify_mstatus_EI <= '0';
                modify_mstatus_RET <= '0';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '0';
                --DRA_controll signals
                load_PC <= '0';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '1';
                load_mtvec <= '0';
                load_mstatus <= '0';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '0';            
            when sPC_ex =>
                --next state generation
                next_state <= sMSTATUS_ex;
                --halt core signal
                halt_core <= '0';
                --buffer register signals
                buffer_register_w <= '1';
                buffer_register_CSR_DRA <= '1';
                modify_mstatus_EI <= '0';
                modify_mstatus_RET <= '0';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '1';
                --DRA_controll signals
                load_PC <= '0';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '0';
                load_mstatus <= '1';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '0';            
            when sMSTATUS_ex =>
                --next state generation
                next_state <= WFI;
                --halt core signal
                halt_core <= '0';
                --buffer register signals
                buffer_register_w <= '0';
                buffer_register_CSR_DRA <= '0';
                modify_mstatus_EI <= '0';
                modify_mstatus_RET <= '1';
                reset_buffer <= '0';
                --DRA signal
                PC_rw <= '0';
                --DRA_controll signals
                load_PC <= '0';
                load_IR <= '0';
                load_PMP <= '0';
                --CSR_access_unit signals
                load_mepc <= '0';
                load_mtvec <= '0';
                load_mstatus <= '0';
                store_mepc <= '0';
                store_mcause <= '0';
                store_mtval <= '0';
                store_mstatus <= '1';            
        end case;        
    end if;
end process;

end rtl;
