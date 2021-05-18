----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/18/2021 12:36:34 PM
-- Design Name: ExceptionControl
-- Module Name: EC_FSM_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This is the testbench to verify the EC_FSM behaviour on Exception Entry
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

library EC_lib;
use EC_lib.Exception_Controll_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity EC_FSM_UV_1_tb is
end EC_FSM_UV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of EC_FSM_UV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    signal EI_flag : STD_LOGIC;
    signal ret : STD_LOGIC;
    signal save_address : STD_LOGIC;
    signal save_PC : STD_LOGIC;
    signal save_IR : STD_LOGIC;
    --clock and reset
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --present state debug
    signal present_state_debug : type_EC_state;
    --halt core signal
    signal halt_core : STD_LOGIC;
    --buffer register signals
    signal buffer_register_w : STD_LOGIC;
    signal buffer_register_CSR_DRA : STD_LOGIC;
    signal modify_mstatus_EI : STD_LOGIC;
    signal modify_mstatus_RET : STD_LOGIC;
    signal reset_buffer : STD_LOGIC;
    --DRA signal
    signal PC_rw : STD_LOGIC;
    --DRA_controll signals
    signal load_PC : STD_LOGIC;
    signal load_IR : STD_LOGIC;
    signal load_PMP : STD_LOGIC;
    --CSR_access_unit signals
    signal load_mepc : STD_LOGIC;
    signal load_mtvec : STD_LOGIC;
    signal load_mstatus : STD_LOGIC;
    signal store_mepc : STD_LOGIC;
    signal store_mcause : STD_LOGIC;
    signal store_mtval : STD_LOGIC;
    signal store_mstatus : STD_LOGIC;
    
signal CSR_access_signals : std_logic_vector(6 downto 0);
signal DRA_control_signals: std_logic_vector(2 downto 0);
signal buffer_register_signals : std_logic_vector(4 downto 0);

signal stop: STD_LOGIC := '0';
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
    constant T : time := 5 ns;

begin

CSR_access_signals <= load_mepc & load_mtvec & load_mstatus & store_mepc & store_mcause & store_mtval & store_mstatus;
DRA_control_signals <= load_PC & load_IR & load_PMP;
buffer_register_signals <= buffer_register_w & buffer_register_CSR_DRA & modify_mstatus_EI & modify_mstatus_RET & reset_buffer;

clk <= not clk after T/2;

stim: process
begin

    reset <= '1';
    save_address <= '1';
    save_IR <= '0';
    save_PC <= '0';
    ret <= '0';
    wait for 23 ns;
    reset <= '0';
    EI_flag <= '1';
    wait for 2*T;
    EI_flag <= '0';
    wait for 5*T;
    stop <= '1';
    wait until stop='1';
    

end process;

check_output: process
begin
    wait for 1 ns;
    assert present_state_debug = WFI report "wrong state, expected: WFI" severity error; 
    assert CSR_access_signals = "0000000" report "CSR_access signals false state: WFI" severity error;
    assert DRA_control_signals = "000" report "DRA_control signals false, state: WFI" severity error;
    assert buffer_register_signals = "00000" report "buffer_register signals false, state: WFI" severity error;
    assert halt_core = '0' report "halt_core signal false, state: WFI" severity error;
    assert PC_rw = '0' report "PC_rw signal false, state: WFI" severity error;
    wait for 27 ns;
    assert present_state_debug = TrapEntry report "wrong state, expected: TrapEntry" severity error; 
    assert CSR_access_signals = "0000000" report "CSR_access signals false state: TrapEntry" severity error;
    assert DRA_control_signals = "100" report "DRA_control signals false, state: TrapEntry" severity error;
    assert buffer_register_signals = "10000" report "buffer_register signals false, state: TrapEntry" severity error;
    assert halt_core = '1' report "halt_core signal false, state: TrapEntry" severity error;
    assert PC_rw = '0' report "PC_rw signal false, state: TrapEntry" severity error;
    wait for 5 ns;
    assert present_state_debug = sMEPC report "wrong state, expected: sMEPC" severity error; 
    assert CSR_access_signals = "0001000" report "CSR_access signals false state: sMEPC" severity error;
    assert DRA_control_signals = "001" report "DRA_control signals false, state: sMEPC" severity error;
    assert buffer_register_signals = "10000" report "buffer_register signals false, state: sMEPC" severity error;
    assert halt_core = '1' report "halt_core signal false, state: sMEPC" severity error;
    assert PC_rw = '0' report "PC_rw signal false, state: sMEPC" severity error;
    wait for 5 ns;
    assert present_state_debug = sMTVAL report "wrong state, expected: sMTVAL" severity error;
    assert CSR_access_signals = "0000010" report "CSR_access signals false state: sMTVAL" severity error;
    assert DRA_control_signals = "000" report "DRA_control signals false, state: sMTVAL" severity error;
    assert buffer_register_signals = "00000" report "buffer_register signals false, state: sMTVAL" severity error;
    assert halt_core = '1' report "halt_core signal false, state: sMTVAL" severity error;
    assert PC_rw = '0' report "PC_rw signal false, state: sMTVAL" severity error;
    wait for 5 ns;
    assert present_state_debug = lMSTATUS report "wrong state, expected: lMSTATUS" severity error;
    assert CSR_access_signals = "0010000" report "CSR_access signals false state: lMSTATUS" severity error;
    assert DRA_control_signals = "000" report "DRA_control signals false, state: lMSTATUS" severity error;
    assert buffer_register_signals = "11100" report "buffer_register signals false, state: lMSTATUS" severity error;
    assert halt_core = '1' report "halt_core signal false, state: lMSTATUS" severity error;
    assert PC_rw = '0' report "PC_rw signal false, state: lMSTATUS" severity error;
    wait for 5 ns;
    assert present_state_debug = sMSTATUS report "wrong state, expected: sMSTATUS" severity error;
    assert CSR_access_signals = "0100001" report "CSR_access signals false state: sMSTATUS" severity error;
    assert DRA_control_signals = "000" report "DRA_control signals false, state: sMSTATUS" severity error;
    assert buffer_register_signals = "11100" report "buffer_register signals false, state: sMSTATUS" severity error;
    assert halt_core = '1' report "halt_core signal false, state: sMSTATUS" severity error;
    assert PC_rw = '0' report "PC_rw signal false, state: sMSTATUS" severity error;
    wait for 5 ns;
    assert present_state_debug = sPC report "wrong state, expected: sPC" severity error;
    assert CSR_access_signals = "0000000" report "CSR_access signals false state: sPC" severity error;
    assert DRA_control_signals = "000" report "DRA_control signals false, state: sPC" severity error;
    assert buffer_register_signals = "00000" report "buffer_register signals false, state: sPC" severity error;
    assert halt_core = '1' report "halt_core signal false, state: sPC" severity error;
    assert PC_rw = '1' report "PC_rw signal false, state: sPC" severity error;
    wait for 5 ns;
    assert present_state_debug = WFI report "wrong state, expected: WFI" severity error;
    assert CSR_access_signals = "0000000" report "CSR_access signals false state: WFI" severity error;
    assert DRA_control_signals = "000" report "DRA_control signals false, state: WFI" severity error;
    assert buffer_register_signals = "00000" report "buffer_register signals false, state: WFI" severity error;
    assert halt_core = '0' report "halt_core signal false, state: WFI" severity error;
    assert PC_rw = '0' report "PC_rw signal false, state: WFI" severity error;
end process;

dut : Exception_Control_FSM
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    EI_flag => EI_flag,
    ret => ret,
    save_address => save_address,
    save_PC => save_PC,
    save_IR => save_IR,
    --clock and reset
    clk => clk,
    reset => reset,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    present_state_debug => present_state_debug,
    --halt core signal
    halt_core => halt_core,
    --buffer register signals
    buffer_register_w => buffer_register_w,
    buffer_register_CSR_DRA => buffer_register_CSR_DRA,
    modify_mstatus_EI => modify_mstatus_EI,
    modify_mstatus_RET => modify_mstatus_RET,
    reset_buffer => reset_buffer,
    --DRA signal
    PC_rw => PC_rw,
    --DRA_controll signals
    load_PC => load_PC,
    load_IR => load_IR,
    load_PMP => load_PMP,
    --CSR_access_unit signals
    load_mepc => load_mepc,
    load_mtvec => load_mtvec,
    load_mstatus => load_mstatus,
    store_mepc => store_mepc,
    store_mcause => store_mcause,
    store_mtval => store_mtval,
    store_mstatus => store_mstatus
);

end rtl;
