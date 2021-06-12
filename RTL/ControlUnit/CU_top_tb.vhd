----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Noah Woelki 
-- 
-- Create Date: 08.06.2021 16:09:45
-- Design Name: 
-- Module Name: CU_top_tb - Behavioral
-- Project Name: EDRICO
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for Control Unit top
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

--add libraries
library CU_lib;

entity CU_top_tb is
end CU_top_tb;

architecture Behavioral of CU_top_tb is

begin
component CU_top
port(
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
    mask_ctrl : out STD_LOGIC_VECTOR (2 downto 0);
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
end component;

--signals
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------ 
    --reset and clock signals
    signal reset : STD_LOGIC;
    signal clk : STD_LOGIC := '0';
     --FSM control signals
    signal memOP_finished : STD_LOGIC;
    signal halt_core : STD_LOGIC;
     --IR signals
    signal store_systemData : STD_LOGIC;
    signal IR_inp : STD_LOGIC_VECTOR (31 downto 0);
     --PC data input
    signal data_bus_B : STD_LOGIC_VECTOR (31 downto 0);
    signal branch_re : std_logic;
     --PC dra signals
    signal PC_dra : STD_LOGIC_VECTOR(31 downto 0);
    signal pc_write : STD_LOGIC;
     ------------------------------------------------------------------------------
     --output signals
     ------------------------------------------------------------------------------ 
     --register outputs
    signal IR_dra : STD_LOGIC_VECTOR (31 downto 0);
    signal PC_out : STD_LOGIC_VECTOR (31 downto 0);
     --PMP control signals
    signal PMP_enable : STD_LOGIC;
    signal PMP_instruction : STD_LOGIC;
    signal PMP_size : STD_LOGIC_VECTOR (1 downto 0);
    signal PMP_rw : STD_LOGIC;
     --MUX control signals
    signal DMU_IN_MUX_ctrl : STD_LOGIC;
    signal DMU_OUT_MUX_ctrl : STD_LOGIC;
    signal R_MUX_ctrl : STD_LOGIC;
    signal PMP_MUX_ctrl : STD_LOGIC;
    signal B_MUX_ctrl : STD_LOGIC;
    signal A_MUX_ctrl : STD_LOGIC_VECTOR(1 downto 0);
     --RV32I RF control signals
    signal register_read_A : STD_LOGIC_VECTOR (4 downto 0);
    signal register_read_B : STD_LOGIC_VECTOR (4 downto 0);
    signal register_write : STD_LOGIC_VECTOR (4 downto 0);
     --CSR control signals
    signal CSR_address : STD_LOGIC_VECTOR (11 downto 0);
    signal save_CSR : STD_LOGIC;
    signal write_CSR : STD_LOGIC;
    signal read_CSR : STD_LOGIC;
     --ALU control signals
    signal ALU_OP : STD_LOGIC_VECTOR (3 downto 0);
     --data mask unit control signals
    signal mask_ctrl : STD_LOGIC_VECTOR (2 downto 0);
     --exception and return signals
    signal iie_CU : STD_LOGIC;
    signal ece_CU : STD_LOGIC;
    signal be_CU : STD_LOGIC;
    signal ret : STD_LOGIC;
     --immediate
    signal immediate : STD_LOGIC_VECTOR (31 downto 0);
     --instruction finished flag
    signal instr_finished : STD_LOGIC

constant T : time := 5 ns;
begin

clk <= not clk after T/2;

dut: CU_top port map(
    --input
    reset => reset,
    clk => clk,
    memOP_finished => memOP_finished,
    halt_core => halt_core,
    store_systemData => store_systemData,
    IR_inp => IR_inp,
    data_bus_B => data_bus_B, 
    branch_re => branch_re,
    PC_dra => PC_dra,
    pc_write => pc_write,
    --output
    IR_dra => IR_dra,
    PC_out => PC_out,
    PMP_enable => PMP_enable,
    PMP_instruction => PMP_instruction,
    PMP_size => PMP_size,
    PMP_rw => PMP_rw,
    DMU_IN_MUX_ctrl => DMU_IN_MUX_ctrl,
    DMU_OUT_MUX_ctrl => DMU_OUT_MUX_ctrl,
    R_MUX_ctrl => R_MUX_ctrl,
    PMP_MUX_ctrl => PMP_MUX_ctrl,
    B_MUX_ctrl => B_MUX_ctrl,
    A_MUX_ctrl => A_MUX_ctrl,
    register_read_A => register_read_A,
    register_read_B => register_read_B,
    register_write => register_write,
    CSR_address => CSR_address,
    save_CSR => save_CSR,
    write_CSR => write_CSR,
    read_CSR => read_CSR,
    ALU_OP => ALU_OP,
    mask_ctrl => mask_ctrl,
    iie_CU => iie_CU,
    ece_CU => ece_CU, 
    be_CU => be_CU,
    ret => ret, 
    immediate => immediate,
    instr_finished => instr_finished
);

sim: process
-- first 4 cycles of instruction


-- +----+---------+------------------------------------------------+----------------------------------------------------------------------+
-- | CC | Action  |                  Description                   |                               Signals                                |
-- +----+---------+------------------------------------------------+----------------------------------------------------------------------+
-- |  1 | rising  | pass PC and read/instruction/enable for PMP    | PC_dra(s), PMP_enable(s), PMP_instruction(s), PMP_size(s), PMP_rw(s) |
-- |  1 | falling | no action ???                                  |                                                                      |
-------------------------------------------------------------------------------------------------------------------------------------------
-- |  2 | rising  | PC Control adds +4 to PC                       | PC_out(c)                                                            |
-- |  2 | falling | no action ???                                  |                                                                      |
-------------------------------------------------------------------------------------------------------------------------------------------
-- |  3 | rising  | no action                                      |                                                                      |
-- |  3 | falling | no action                                      |                                                                      |
-------------------------------------------------------------------------------------------------------------------------------------------
-- |  4 | rising  | Instruction read -> start decode               | IR_inp(s), store_systemData(s), memOP_finished(s), IR_dra(c)         |
-- |  4 | falling | All signals must be stable, execute_enable set | PMP_enable(c) to immediate(c)                                        |
-- +----+---------+------------------------------------------------+----------------------------------------------------------------------+
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin


end process;



end Behavioral;
