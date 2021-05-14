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
entity CU_decoder_tb is
end CU_decoder_tb;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_decoder_tb is
component decoder
port(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- instruction register
    ir: in std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    type_of_instruction_int: out std_logic_vector(3 downto 0);
    -- PMP ctrl
    PMP_enable_int: out std_logic;
    PMP_instruction_int: out std_logic;
    PMP_size_int: out std_logic_vector(1 downto 0);
    PMP_rw_int: out std_logic;
    -- MUX ctrl
    DMU_IN_MUX_int: out std_logic;
    DMU_OUT_MUX_int: out std_logic;
    R_MUX_int: out std_logic;
    PMP_MUX_int: out std_logic;
    B_MUX_int: out std_logic;
    A_MUX_int: out std_logic_vector(1 downto 0);
    -- reg ctrl
    reg_read_A_int: out std_logic_vector(4 downto 0);
    reg_read_B_int: out std_logic_vector(4 downto 0);
    reg_write_int: out std_logic_vector(4 downto 0);
    -- CSR ctrl
    CSR_save_int: out std_logic;
    CSR_address_int: out std_logic_vector(11 downto 0);
    CSR_write_int: out std_logic;
    CSR_read_int: out std_logic;
    -- exception ctrl
    iie_CU_int: out std_logic;
    ece_CU_int: out std_logic;
    be_CU_int: out std_logic;
    return_int: out std_logic;
    -- other signals
    ALU_op_int: out std_logic_vector(3 downto 0);
    immediate_int: out std_logic_vector(31 downto 0);
    mask_ctrl_int: out std_logic_vector(1 downto 0)
);
end component;
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- instruction register
    signal ir: std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
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
    signal mask_ctrl_int: std_logic_vector(1 downto 0);
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

-- instantiate uut
begin
uut: decoder port map(
        ir => ir,
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
        mask_ctrl_int => mask_ctrl_int
);

stim: process
    begin
        -- set input signal
        wait for 100ns;
        ir <= "00000000000000000000000000000010";
        wait for 100ns;
        ir <= "00000000000000000000000000000010";
        wait for 100ns;
        ir <= "00000000000000000000000000000010";
        wait for 100ns;
        ir <= "00000000000000000000000000000010";
        wait for 100ns;
        ir <= "00000000000000000000000000000010";                                
        wait for 100ns;
        ir <= "00000000000000000000000000000010";        
                                                    

    end process;
    
end architecture;