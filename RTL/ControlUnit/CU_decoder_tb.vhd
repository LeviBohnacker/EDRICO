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
library CU_lib;
use CU_lib.CU_pkg.all;
----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity CU_decoder_tb is
end CU_decoder_tb;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_decoder_tb is
component CU_decoder
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
    mask_ctrl_int: out std_logic_vector(2 downto 0)
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
    signal mask_ctrl_int: std_logic_vector(2 downto 0);
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

-- instantiate uut
begin
dut: CU_decoder port map(
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
        immediate_int => immediate_int,        
        mask_ctrl_int => mask_ctrl_int
);

stim: process
    begin
        -- parse through different instruction strings
        --WFI
        ir <= "00010000010100000000000001110011"; --WFI 
        --OPIMM
        ir <= "00000000001000100000000010010011"; --ADDI
        wait for 100ns;
        ir <= "00000000001000100010000010010011"; --SLTI
        wait for 100ns;
        ir <= "00000000001000100011000010010011"; --SLTIU
        wait for 100ns;
        ir <= "00000000001000100100000010010011"; --XORI
        wait for 100ns;
        ir <= "00000000001000100110000010010011"; --ORI                             
        wait for 100ns;
        ir <= "00000000001000100111000010010011"; --ANDI   
        wait for 100ns;
        ir <= "00000000010000100001000010010011"; --SLLI
        wait for 100ns;
        ir <= "00000000010000100101000010010011"; --SRLI 
        wait for 100ns;
        ir <= "01000000010000100101000010010011"; --SLAI
        wait for 100ns;
        --OP
        ir <= "00000000010000100000000010110011"; --ADD                             
        wait for 100ns;
        ir <= "00000000010000100000000010110011"; --SUB
        wait for 100ns;
        ir <= "00000000010000100001000010110011"; --SLL
        wait for 100ns;
        ir <= "00000000010000100010000010110011"; --SLT  
        wait for 100ns;
        ir <= "00000000010000100011000010110011"; --SLTU
        wait for 100ns;
        ir <= "00000000010000100100000010110011"; --XOR
        wait for 100ns;
        ir <= "00000000010000100101000010110011"; --SRL
        wait for 100ns;
        ir <= "01000000010000100101000010110011"; --SRA
        wait for 100ns;
        ir <= "00000000010000100110000010110011"; --OR
        wait for 100ns;
        ir <= "00000000010000100111000010110011"; --AND
        wait for 100ns;
        ir <= "00000000000000000111000010110111"; --LUI
        wait for 100ns;
        ir <= "00000000000000000111000010010111"; --AUIPC
        wait for 100ns;
        ir <= "00000100000100001001000011101111"; --JAL
        wait for 100ns;
        ir <= "00000010101000100000000011100111"; --JALR
        -- branch operation
        wait for 100ns;
        ir <= "10000010011100100000100011100011"; --BEQ
        wait for 100ns;
        ir <= "10000100011100100110100101100011"; --BLTU 
        --exception operations
        wait for 100ns;
        ir <= "00000000000000000000000001110011"; --ECALL
        wait for 100ns;
        ir <= "00000000000100000000000001110011"; --EBREAK
        wait for 100ns;
        ir <= "00110000001000000000000001110011"; --MRET
        wait for 100ns;
        ir <= "00010000010100000000000001110011"; --WFI              
        --CSRR
        wait for 100ns;
        ir <= "00000000010000110001001001110011"; --CSRRW
        wait for 100ns;
        ir <= "00000000010000100101001001110011"; --CSRRWI
    end process;
    
end architecture;