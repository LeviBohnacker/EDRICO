----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 12.05.2021 13:34:56
-- Design Name: CU_execute_enable 
-- Module Name: ControlUnit
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  Execute enable guides through decoded instructions if the fetch is executed correctly
--  Working on asynchronous reset for halt core event.
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
entity CU_execute_enable is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- control signals:
    execute_enable: in std_logic;
    clk: in std_logic;
    reset: in std_logic;
    -- instruction register
    type_of_instruction_int: in std_logic_vector(3 downto 0);
    -- PMP ctrl
    PMP_enable_int: in std_logic;
    PMP_instruction_int: in std_logic;
    PMP_size_int: in std_logic_vector(1 downto 0);
    PMP_rw_int: in std_logic;
    -- MUX ctrl
    DMU_IN_MUX_int: in std_logic;
    DMU_OUT_MUX_int: in std_logic;
    R_MUX_int: in std_logic;
    PMP_MUX_int: in std_logic;
    B_MUX_int: in std_logic;
    A_MUX_int: in std_logic_vector(1 downto 0);
    -- reg ctrl
    reg_read_A_int: in std_logic_vector(4 downto 0);
    reg_read_B_int: in std_logic_vector(4 downto 0);
    reg_write_int: in std_logic_vector(4 downto 0);
    -- CSR ctrl
    CSR_save_int: in std_logic;
    CSR_address_int: in std_logic_vector(11 downto 0);
    CSR_write_int: in std_logic;
    CSR_read_int: in std_logic;
    -- exception ctrl
    iie_CU_int: in std_logic;
    ece_CU_int: in std_logic;
    be_CU_int: in std_logic;
    return_int: in std_logic;
    -- other signals
    ALU_op_int: in std_logic_vector(3 downto 0);
    immediate_int: in std_logic_vector(31 downto 0);
    mask_ctrl_int: in std_logic_vector(2 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    -- instruction register
    type_of_instruction: out std_logic_vector(3 downto 0);
    -- PMP ctrl
    PMP_enable: out std_logic;
    PMP_instruction: out std_logic;
    PMP_size: out std_logic_vector(1 downto 0);
    PMP_rw: out std_logic;
    -- MUX ctrl
    DMU_IN_MUX: out std_logic;
    DMU_OUT_MUX: out std_logic;
    R_MUX: out std_logic;
    PMP_MUX: out std_logic;
    B_MUX: out std_logic;
    A_MUX: out std_logic_vector(1 downto 0);
    -- reg ctrl
    reg_read_A: out std_logic_vector(4 downto 0);
    reg_read_B: out std_logic_vector(4 downto 0);
    reg_write: out std_logic_vector(4 downto 0);
    -- CSR ctrl
    CSR_save: out std_logic;
    CSR_address: out std_logic_vector(11 downto 0);
    CSR_write: out std_logic;
    CSR_read: out std_logic;
    -- exception ctrl
    iie_CU: out std_logic;
    ece_CU: out std_logic;
    be_CU: out std_logic;
    return_out: out std_logic;
    -- other signals
    ALU_op: out std_logic_vector(3 downto 0);
    immediate: out std_logic_vector(31 downto 0);
    mask_ctrl: out std_logic_vector(2 downto 0)
);
end entity;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_execute_enable is
begin

exec_en: process(clk, execute_enable, reset)
begin
    if(reset = '1') then
    -- if reset, default value for all signals
        type_of_instruction <= "0000";
        PMP_enable <= '0';
        PMP_instruction <= '0';
        PMP_size <= "00";
        PMP_rw <= '0';
        DMU_IN_MUX<= '0';
        DMU_OUT_MUX <= '0';
        R_MUX <= '0';
        PMP_MUX <= '0';
        B_MUX <= '0';
        A_MUX <= "00";
        reg_read_A <= "00000";
        reg_read_B <= "00000";
        reg_write <= "00000";
        CSR_save <= '0';
        CSR_address <= "000000000000";
        CSR_write <= '0';
        CSR_read <= '0';
        iie_CU <= '0';
        ece_CU <= '0';
        be_CU <= '0';
        return_out <= '0';
        ALU_op <= "0000";
        mask_ctrl <= "100";
    elsif(clk'event and clk = '0' and execute_enable = '1') then
    -- if clock is falling and execute_enable is 1, signals are fed through
        type_of_instruction <= type_of_instruction_int;
        PMP_enable <= PMP_enable_int;
        PMP_instruction <= PMP_instruction_int;
        PMP_size <= PMP_size_int;
        PMP_rw <= PMP_rw_int;
        DMU_IN_MUX<= DMU_IN_MUX_int;
        DMU_OUT_MUX <= DMU_OUT_MUX_int;
        R_MUX <= R_MUX_int;
        PMP_MUX <= PMP_MUX_int;
        B_MUX <= B_MUX_int;
        A_MUX <= A_MUX_int;
        reg_read_A <= reg_read_A_int;
        reg_read_B <= reg_read_B_int;
        reg_write <= reg_write_int;
        CSR_save <= CSR_save_int;
        CSR_address <= CSR_address_int;
        CSR_write <= CSR_write_int;
        CSR_read <= CSR_read_int;
        iie_CU <= iie_CU_int;
        ece_CU <= ece_CU_int;
        be_CU <= be_CU_int;
        return_out <= return_int;
        ALU_op <= ALU_op_int;
        mask_ctrl <= mask_ctrl_int;   
    end if;     
end process exec_en;
end architecture;