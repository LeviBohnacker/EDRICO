----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/13/2021 12:18:42 PM
-- Design Name: ControlUnit
-- Module Name: CU_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package contains all components for the Control Unit
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
--PACKAGE
----------------------------------------------------------------------------------
package CU_pkg is
----------------------------------------------------------------------------------
--components
----------------------------------------------------------------------------------
component CU_PC is
port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PCdra and write signal
    PC_dra : in STD_LOGIC_VECTOR (31 downto 0);
    PC_write : in STD_LOGIC;
    --PC load signal
    PC_load : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    --incrementation control signals
    branch_re : in STD_LOGIC;
    type_of_instruction : in STD_LOGIC_VECTOR (3 downto 0);
    --data inputs
    immediate : in STD_LOGIC_VECTOR (31 downto 0);
    data_bus_B : in STD_LOGIC_VECTOR (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    PC_out : out STD_LOGIC_VECTOR (31 downto 0)
);
end component;

component CU_FSM is
port (
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
    instruction_finished: out std_logic
);
end component;

component CU_decoder is
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

component CU_execute_enable is
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
end component;

end package;