----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/13/2021 12:33:28 PM
-- Design Name: Control Unit
-- Module Name: CU_top - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this module is a wrapper for all control unit modules, the Instruction Register
--  is implemented without a dedicated component
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

library CU_lib;
use CU_lib.CU_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity CU_top is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------ 
    --reset and clock signals
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    --FSM control signals
    memOP_finished : in STD_LOGIC;
    halt_core : in STD_LOGIC;
    --IR signals
    store_systemData : in STD_LOGIC;
    IR_inp : in STD_LOGIC_VECTOR (31 downto 0);
    --PC data input
    data_bus_B : in STD_LOGIC_VECTOR (31 downto 0);
    branch_re : in std_logic;
    --PC dra signals
    PC_dra : in STD_LOGIC_VECTOR(31 downto 0);
    pc_write : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------ 
    --register outputs
    IR_dra : out STD_LOGIC_VECTOR (31 downto 0);
    PC_out : out STD_LOGIC_VECTOR (31 downto 0);
    --PMP control signals
    PMP_enable : out STD_LOGIC;
    PMP_instruction : out STD_LOGIC;
    PMP_size : out STD_LOGIC_VECTOR (1 downto 0);
    PMP_rw : out STD_LOGIC;
    --MUX control signals
    DMU_IN_MUX_ctrl : out STD_LOGIC;
    DMU_OUT_MUX_ctrl : out STD_LOGIC;
    R_MUX_ctrl : out STD_LOGIC;
    PMP_MUX_ctrl : out STD_LOGIC;
    B_MUX_ctrl : out STD_LOGIC;
    A_MUX_ctrl : out STD_LOGIC_VECTOR(1 downto 0);
    --RV32I RF control signals
    register_read_A : out STD_LOGIC_VECTOR (4 downto 0);
    register_read_B : out STD_LOGIC_VECTOR (4 downto 0);
    register_write : out STD_LOGIC_VECTOR (4 downto 0);
    --CSR control signals
    CSR_address : out STD_LOGIC_VECTOR (11 downto 0);
    save_CSR : out STD_LOGIC;
    write_CSR : out STD_LOGIC;
    read_CSR : out STD_LOGIC;
    --ALU control signals
    ALU_OP : out STD_LOGIC_VECTOR (3 downto 0);
    --data mask unit control signals
    mask_ctrl : out STD_LOGIC_VECTOR (1 downto 0);
    --exception and return signals
    iie_CU : out STD_LOGIC;
    ece_CU : out STD_LOGIC;
    be_CU : out STD_LOGIC;
    ret : out STD_LOGIC;
    --immediate
    immediate : out STD_LOGIC_VECTOR (31 downto 0);
    --instruction finished flag
    instr_finished : out STD_LOGIC
);
end CU_top;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of CU_top is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
--CU outputs
signal PMP_enable_FSM : std_logic;
signal PMP_instruction_FSM : std_logic;
signal PMP_rw_FSM : std_logic;
signal PMP_size_FSM : std_logic_vector(1 downto 0);
signal instruction_fetch : std_logic;
signal execute_enable : std_logic;
signal PC_load : std_logic;
--IR outputs
signal IR : std_logic_vector(31 downto 0);
--decoder outputs
signal type_of_instruction_int : std_logic_vector(3 downto 0);
signal PMP_enable_int : std_logic;
signal PMP_instruction_int : std_logic;
signal PMP_size_int : std_logic_vector(1 downto 0);
signal PMP_rw_int : std_logic;
signal DMU_IN_MUX_int : std_logic;
signal DMU_OUT_MUX_int : std_logic;
signal R_MUX_int : std_logic;
signal PMP_MUX_int : std_logic;
signal B_MUX_int : std_logic;
signal A_MUX_int : std_logic_vector(1 downto 0);
signal reg_read_A_int : std_logic_vector(4 downto 0);
signal reg_read_B_int : std_logic_vector(4 downto 0);
signal reg_write_int : std_logic_vector(4 downto 0);
signal CSR_save_int : std_logic;
signal CSR_address_int : std_logic_vector(11 downto 0);
signal CSR_write_int : std_logic;
signal CSR_read_int : std_logic;
signal iie_CU_int : std_logic;
signal ece_CU_int : std_logic;
signal be_CU_int : std_logic;
signal return_int : std_logic;
signal ALU_op_int : std_logic_vector(3 downto 0);
signal immediate_int : std_logic_vector(31 downto 0);
signal mask_ctrl_int : std_logic_vector(1 downto 0);
--execute buffer outputs
signal type_of_instruction : std_logic_vector(3 downto 0);
signal PMP_enable_EX : std_logic;
signal PMP_instruction_EX : std_logic;
signal PMP_rw_EX : std_logic;
signal PMP_size_EX : std_logic_vector(1 downto 0);
signal immediate_EX : std_logic_vector(31 downto 0);


begin

----------------------------------------------------------------------------------
--FSM of the Control Unit
-- controls execution, and instruction fetch
----------------------------------------------------------------------------------
ControlUnit_FSM: CU_FSM
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    memOP_finished => memOP_finished,
    halt_core => halt_core,
    reset => reset,
    clk => clk,
    type_of_instruction => type_of_instruction,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    PMP_enable_FSM => PMP_enable_FSM,
    PMP_instruction_FSM => PMP_instruction_FSM,
    PMP_size_FSM => PMP_size_FSM,
    PMP_rw_FSM => PMP_rw_FSM,
    instruction_fetch => instruction_fetch,
    execute_enable => execute_enable,
    PC_load => PC_load,
    instruction_finished => instr_finished 
);


----------------------------------------------------------------------------------
--instruction decoder
-- logical network to decode the instruction
----------------------------------------------------------------------------------
decoder: CU_decoder
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- instruction register
    ir => IR,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    type_of_instruction_int => type_of_instruction_int,
    -- PMP ctrl
    PMP_enable_int => PMP_enable_int,
    PMP_instruction_int => PMP_instruction_int,
    PMP_size_int => PMP_size_int,
    PMP_rw_int => PMP_rw_int,
    -- MUX ctrl
    DMU_IN_MUX_int => DMU_IN_MUX_int,
    DMU_OUT_MUX_int => DMU_OUT_MUX_int,
    R_MUX_int => R_MUX_int,
    PMP_MUX_int => PMP_MUX_int,
    B_MUX_int => B_MUX_int,
    A_MUX_int => A_MUX_int,
    -- reg ctrl
    reg_read_A_int => reg_read_A_int,
    reg_read_B_int => reg_read_B_int,
    reg_write_int => reg_write_int,
    -- CSR ctrl
    CSR_save_int => CSR_save_int,
    CSR_address_int => CSR_address_int,
    CSR_write_int => CSR_write_int,
    CSR_read_int => CSR_read_int,
    -- exception ctrl
    iie_CU_int => iie_CU_int,
    ece_CU_int => ece_CU_int,
    be_CU_int => be_CU_int,
    return_int => return_int,
    -- other signals
    ALU_op_int => ALU_op_int,
    immediate_int => immediate_int,
    mask_ctrl_int => mask_ctrl_int 
);

----------------------------------------------------------------------------------
--ExecuteBuffer
--  register to hold the decoded values
----------------------------------------------------------------------------------
ExecuteBuffer : CU_execute_enable
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    -- control signals:
    execute_enable => execute_enable,
    clk => clk,
    reset => reset,
    -- instruction register
    type_of_instruction_int => type_of_instruction_int,
    -- PMP ctrl
    PMP_enable_int => PMP_enable_int,
    PMP_instruction_int => PMP_instruction_int,
    PMP_size_int => PMP_size_int,
    PMP_rw_int => PMP_rw_int,
    -- MUX ctrl
    DMU_IN_MUX_int => DMU_IN_MUX_int,
    DMU_OUT_MUX_int => DMU_OUT_MUX_int,
    R_MUX_int => R_MUX_int,
    PMP_MUX_int => PMP_MUX_int,
    B_MUX_int => B_MUX_int,
    A_MUX_int => A_MUX_int,
    -- reg ctrl
    reg_read_A_int => reg_read_A_int,
    reg_read_B_int => reg_read_B_int,
    reg_write_int => reg_write_int,
    -- CSR ctrl
    CSR_save_int => CSR_save_int,
    CSR_address_int => CSR_address_int,
    CSR_write_int => CSR_write_int,
    CSR_read_int => CSR_read_int,
    -- exception ctrl
    iie_CU_int => iie_CU_int,
    ece_CU_int => ece_CU_int,
    be_CU_int => be_CU_int,
    return_int => return_int,
    -- other signals
    ALU_op_int => ALU_op_int,
    immediate_int => immediate_int,
    mask_ctrl_int => mask_ctrl_int,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    -- instruction register
    type_of_instruction => type_of_instruction,
    -- PMP ctrl
    PMP_enable => PMP_enable_EX,
    PMP_instruction => PMP_instruction_EX,
    PMP_size => PMP_size_EX,
    PMP_rw => PMP_rw_EX,
    -- MUX ctrl
    DMU_IN_MUX => DMU_IN_MUX_ctrl,
    DMU_OUT_MUX => DMU_OUT_MUX_ctrl,
    R_MUX => R_MUX_ctrl,
    PMP_MUX => PMP_MUX_ctrl,
    B_MUX => B_MUX_ctrl,
    A_MUX => A_MUX_ctrl,
    -- reg ctrl
    reg_read_A => register_read_A,
    reg_read_B => register_read_B,
    reg_write => register_write,
    -- CSR ctrl
    CSR_save => save_CSR,
    CSR_address => CSR_address,
    CSR_write => write_CSR,
    CSR_read => read_CSR,
    -- exception ctrl
    iie_CU => iie_CU,
    ece_CU => ece_CU,
    be_CU => be_CU,
    return_out => ret,
    -- other signals
    ALU_op => ALU_op,
    immediate => immediate_EX,
    mask_ctrl => mask_ctrl
);

immediate <= immediate_EX;

----------------------------------------------------------------------------------
--ProgramCounter
--  component to hold and modify the PC
----------------------------------------------------------------------------------
ProgramCounter: CU_PC
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PCdra and write signal
    PC_dra => PC_dra,
    PC_write => PC_write,
    --PC load signal
    PC_load => PC_load,
    --clock and reset
    clk => clk,
    reset => reset,
    --incrementation control signals
    branch_re => branch_re,
    type_of_instruction => type_of_instruction,
    --data inputs
    immediate => immediate_EX,
    data_bus_B => data_bus_B,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    PC_out => PC_out
);

----------------------------------------------------------------------------------
--Instruction Register
--  Register to hold the current instruction
----------------------------------------------------------------------------------
InstructionRegister : process(clk, reset)
begin
    if(reset = '1') then
    
    elsif(clk'event and clk = '1') then
        if(instruction_fetch = '1' and store_systemData = '1') then
            IR <= IR_inp;
        end if;
    end if;
end process;

IR_dra <= IR;

----------------------------------------------------------------------------------
--PMP multiplexer
--  multiplexer to connect the PMP_PMA_checker signals to either the execution
--  buffer or FSM outputs.
----------------------------------------------------------------------------------
PMP_mux: process(instruction_fetch, PMP_enable_EX, PMP_instruction_EX, PMP_size_EX, PMP_rw_EX, PMP_enable_FSM, PMP_instruction_FSM, PMP_size_FSM, PMP_rw_FSM)
begin
    if(instruction_fetch = '1') then
        PMP_enable <= PMP_enable_FSM;
        PMP_instruction <= PMP_instruction_FSM;
        PMP_size <= PMP_size_FSM;
        PMP_rw <= PMP_rw_FSM;
    else
        PMP_enable <= PMP_enable_EX;
        PMP_instruction <= PMP_instruction_EX;
        PMP_size <= PMP_size_EX;
        PMP_rw <= PMP_rw_EX;
    end if;
end process;

end rtl;













