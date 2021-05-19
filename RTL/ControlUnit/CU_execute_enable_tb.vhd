----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 14.05.2021 14:36:33
-- Design Name: CU_execute_enable_tb
-- Module Name: CU_execute_enable_tb
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  testbench 
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
entity CU_execute_enable_tb is
end CU_execute_enable_tb;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_execute_enable_tb is
component CU_execute_enable
port(
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
end component;
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- control signals:
    signal execute_enable: std_logic;
    signal clk: std_logic;
    signal reset: std_logic;
    -- instruction register
    signal type_of_instruction_int: std_logic_vector(3 downto 0);
    -- PMP ctrl
    signal PMP_enable_int: std_logic;
    signal PMP_instruction_int: std_logic;
    signal PMP_size_int: std_logic_vector(1 downto 0);
    signal PMP_rw_int: std_logic;
    -- MUX ctrl
    signal DMU_IN_MUX_int: std_logic;
    signal DMU_OUT_MUX_int: std_logic;
    signal R_MUX_int: std_logic;
    signal PMP_MUX_int: std_logic;
    signal B_MUX_int: std_logic;
    signal A_MUX_int: std_logic_vector(1 downto 0);
    -- reg ctrl
    signal reg_read_A_int: std_logic_vector(4 downto 0);
    signal reg_read_B_int: std_logic_vector(4 downto 0);
    signal reg_write_int: std_logic_vector(4 downto 0);
    -- CSR ctrl
    signal CSR_save_int: std_logic;
    signal CSR_address_int: std_logic_vector(11 downto 0);
    signal CSR_write_int: std_logic;
    signal CSR_read_int: std_logic;
    -- exception ctrl
    signal iie_CU_int: std_logic;
    signal ece_CU_int: std_logic;
    signal be_CU_int: std_logic;
    signal return_int: std_logic;
    -- other signals
    signal ALU_op_int: std_logic_vector(3 downto 0);
    signal immediate_int: std_logic_vector(31 downto 0);
    signal mask_ctrl_int: std_logic_vector(2 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ----------------------------------------------------------------
    -- instruction register
    signal type_of_instruction: std_logic_vector(3 downto 0);
    -- PMP ctrl
    signal PMP_enable: std_logic;
    signal PMP_instruction: std_logic;
    signal PMP_size: std_logic_vector(1 downto 0);
    signal PMP_rw: std_logic;
    -- MUX ctrl
    signal DMU_IN_MUX: std_logic;
    signal DMU_OUT_MUX: std_logic;
    signal R_MUX: std_logic;
    signal PMP_MUX: std_logic;
    signal B_MUX: std_logic;
    signal A_MUX: std_logic_vector(1 downto 0);
    -- reg ctrl
    signal reg_read_A: std_logic_vector(4 downto 0);
    signal reg_read_B: std_logic_vector(4 downto 0);
    signal reg_write: std_logic_vector(4 downto 0);
    -- CSR ctrl
    signal CSR_save: std_logic;
    signal CSR_address: std_logic_vector(11 downto 0);
    signal CSR_write: std_logic;
    signal CSR_read: std_logic;
    -- exception ctrl
    signal iie_CU: std_logic;
    signal ece_CU: std_logic;
    signal be_CU: std_logic;
    signal return_out: std_logic;
    -- other signals
    signal ALU_op: std_logic_vector(3 downto 0);
    signal immediate: std_logic_vector(31 downto 0);
    signal mask_ctrl: std_logic_vector(2 downto 0);
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

-- instantiate uut
begin
dut: exec_enable port map(

        execute_enable => execute_enable,
        clk => clk,
        reset => reset,

        type_of_instruction_int => type_of_instruction_int,
        PMP_enable_int => PMP_enable_int,
        PMP_instruction_int => PMP_instruction_int,
        PMP_size_int => PMP_size_int,
        PMP_rw_int => PMP_rw_int,
        DMU_IN_MUX_int => DMU_IN_MUX_int,
        DMU_OUT_MUX_int => DMU_OUT_MUX_int,
        R_MUX_int => R_MUX_int,
        PMP_MUX_int => PMP_MUX_int,
        B_MUX_int => B_MUX_int,
        A_MUX_int => A_MUX_int,
        reg_read_A_int => reg_read_A_int,
        reg_read_B_int => reg_read_B_int,
        reg_write_int => reg_write_int,
        CSR_save_int => CSR_save_int,
        CSR_address_int => CSR_address_int,
        CSR_write_int => CSR_write_int,
        CSR_read_int => CSR_read_int,
        iie_CU_int => iie_CU_int,
        ece_CU_int => ece_CU_int,
        be_CU_int => be_CU_int,
        return_int => return_int,
        ALU_op_int => ALU_op_int,
        immediate_int => immediate_int,
        mask_ctrl_int => mask_ctrl_int,


        type_of_instruction => type_of_instruction,
        PMP_enable => PMP_enable,
        PMP_instruction => PMP_instruction,
        PMP_size => PMP_size,
        PMP_rw => PMP_rw,
        DMU_IN_MUX => DMU_IN_MUX,
        DMU_OUT_MUX => DMU_OUT_MUX,
        R_MUX => R_MUX,
        PMP_MUX => PMP_MUX,
        B_MUX => B_MUX,
        A_MUX => A_MUX,
        reg_read_A => reg_read_A,
        reg_read_B => reg_read_B,
        reg_write => reg_write,
        CSR_save => CSR_save,
        CSR_address => CSR_address,
        CSR_write => CSR_write,
        CSR_read => CSR_read,
        iie_CU => iie_CU,
        ece_CU => ece_CU,
        be_CU => be_CU,
        return_out => return_out,
        ALU_op => ALU_op,
        immediate => immediate,
        mask_ctrl => mask_ctrl
);

stim: process
    begin
        reset <= '0';
        clk <= '1';
        execute_enable <= '0';

        type_of_instruction_int <= "0010";
        PMP_enable_int <= '1';
        PMP_instruction_int <= '1';
        PMP_size_int <= "10";
        PMP_rw_int <= '0';
        DMU_IN_MUX_int <= '0';
        DMU_OUT_MUX_int <= '1';
        R_MUX_int <= '1';
        PMP_MUX_int <= '0';
        B_MUX_int <= '0';
        A_MUX_int <= "01";
        reg_read_A_int <= "01100";
        reg_read_B_int <= "00001";
        reg_write_int <= "00010";
        CSR_save_int <= '0';
        CSR_address_int <= "000000000000";
        CSR_write_int <= '0';
        CSR_read_int <= '0';
        iie_CU_int <= '0';
        ece_CU_int <= '0';
        be_CU_int <= '0';
        return_int <= '1';
        ALU_op_int <= "0010";
        immediate_int <= "00000001000000000001000000000000";
        mask_ctrl_int <= "100";
        
        wait for 100ns;
        --simulate falling edge and execute_enable = 1
        clk <= '0';
        execute_enable <= '1';

        wait for 10ns;
        --reset clock to 1
        clk <= '1';

        wait for 100ns;
        --simulate execute_enable = 1 but also reset = 1
        clk <= '0';
        reset <= '1';
        execute_enable <= '1';



    end process;
    
end architecture;