----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Noah Woelki
-- 
-- Create Date: 05/10/2021 16:04:15 AM
-- Design Name: cu_decode_unit
-- Module Name: Control Unit
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  Decoding unit decodes incoming instruction once its loaded from memory
--  
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
entity cu_decode_unit is
port (
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
    reg_read_A_int: out std_logic_vector(31 downto 0);
    reg_read_B_int: out std_logic_vector(31 downto 0);
    reg_write_int: out std_logic_vector(31 downto 0);
    -- CSR ctrl
    CSR_save_int: out std_logic;
    CSR_address_int: out std_logic_vector(31 downto 0);
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
end entity;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of cu_decode_unit is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
type instruction_cluster is (INVALID, LOAD, STORE, BRANCH, JALR, JAL, FENCE, OPIMM, OP, SYSTEM, MRET, WFI, AUIPC, LUI);
signal decoded_cluster : instruction_cluster;
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

begin
    process(ir)
    begin
    -- default values for safety reasons while instruction fetch not ready
        type_of_instruction_int <= "0000";
        PMP_enable_int <= '0';
        PMP_instruction_int <= '0';
        PMP_size_int <= "00";
        PMP_rw_int <= '0';
        DMU_IN_MUX_int <= '0';
        DMU_OUT_MUX_int <= '0';
        R_MUX_int <= '0';
        PMP_MUX_int <= '0';
        B_MUX_int <= '0';
        A_MUX_int <= "00";
        reg_read_A_int <= "00000000000000000000000000000000";
        reg_read_B_int <= "00000000000000000000000000000000";
        reg_write_int <= "00000000000000000000000000000000";
        CSR_save_int <= '0';
        CSR_address_int <= "00000000000000000000000000000000";
        CSR_write_int <= '0';
        CSR_read_int <= '0';
        iie_CU_int <= '0';
        ece_CU_int <= '0';
        be_CU_int <= '0';
        return_int <= '0';
        ALU_op_int <= "1111";
        immediate_int <= "00000000000000000000000000000000";
        mask_ctrl_int <= "00";

        case ir(1 downto 0) is
            when "00" =>
                decoded_cluster <= INVALID;
            when others =>
                case ir(4 downto 2) is
                    when "000" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= LOAD;
                            when "01" => decoded_cluster <= STORE;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= BRANCH;
                        end case;
                    when "001" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= INVALID;
                            when "01" => decoded_cluster <= INVALID;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= JALR;
                        end case;                   
                    when "010" =>
                        decoded_cluster <= INVALID;
                    when "011" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= FENCE;
                            when "01" => decoded_cluster <= INVALID;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= JAL;
                        end case; 
                    when "100" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= OPIMM;
                            when "01" => decoded_cluster <= OP;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= SYSTEM;
                        end case;  
                    when "101" =>
                        case ir(6 downto 5) is
                            when "00" => decoded_cluster <= AUIPC;
                            when "01" => decoded_cluster <= LUI;
                            when "10" => decoded_cluster <= INVALID;
                            when "11" => decoded_cluster <= INVALID;
                        end case;  
                    when "110" =>
                        decoded_cluster <= INVALID; 
                end case;
        end case;
    end process;
end architecture;