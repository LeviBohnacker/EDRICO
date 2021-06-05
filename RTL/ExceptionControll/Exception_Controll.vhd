----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/04/2021 06:14:13 PM
-- Design Name: Exception_Controll
-- Module Name: Exception_Controll - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This is the top file for the Exception Controll unit.
-- 
-- Dependencies: 
--  DRA_controll.vhd
--  CSR_access_controll.vhd
--  arbiter.vhd
--  Exception_Controll_FSM.vhd
--  Exception_Controll_pkg.vhd
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
entity Exception_Controll is
Port ( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --exception/interrupt signals
    load_afe_P : in STD_LOGIC;
    storeAMO_afe_P : in STD_LOGIC;
    instruction_afe_P : in STD_LOGIC;
    load_ame_P : in STD_LOGIC;
    storeAMO_ame_P : in STD_LOGIC;
    instruction_ame_P : in STD_LOGIC;
    load_afe_AXI : in STD_LOGIC;
    storeAMO_afe_AXI : in STD_LOGIC;
    instruction_afe_AXI : in STD_LOGIC;
    iie_CU : in STD_LOGIC;
    ece_CU : in STD_LOGIC;
    be_CU : in STD_LOGIC;
    iie_CSR : in STD_LOGIC;
    si_CSR : in STD_LOGIC;
    ti_CSR : in STD_LOGIC;
    --data inputs
    data_in_EC : in STD_LOGIC_VECTOR (31 downto 0);     --CSR input
    IR_dra : in STD_LOGIC_VECTOR (31 downto 0);         --DRA input
    PMP_dra : in STD_LOGIC_VECTOR (31 downto 0);
    PC_dra : in STD_LOGIC_VECTOR (31 downto 0);
    --return signal
    ret : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --CSR control
    CSR_read_EC : out STD_LOGIC;
    CSR_write_EC : out STD_LOGIC;
    CSR_address_EC : out STD_LOGIC_VECTOR (31 downto 0);
    data_out_EC : out STD_LOGIC_VECTOR (31 downto 0);
    --programm counter
    PC_dra_write : out STD_LOGIC_VECTOR (31 downto 0);
    PC_write : out STD_LOGIC;
    --halt core
    halt_core : out STD_LOGIC
);
end Exception_Controll;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of Exception_Controll is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
--Exception_Controll_FSM inputs:
signal EI_flag: std_logic;
signal save_address: std_logic;
signal save_PC: std_logic;
signal save_IR: std_logic;

--DRA_controll inputs:
signal load_PC, load_IR, load_PMP: std_logic;
signal store_PC: std_logic;

--CSR_access_unit inputs:
signal interrupt: std_logic;
signal exception_code: std_logic_vector(31 downto 0);
signal load_mepc, load_mtvec, load_mstatus: std_logic;
signal store_mepc, store_mcause, store_mtval, store_mstatus: std_logic;

--buffer_register signals:
signal data_in_DRA: std_logic_vector(31 downto 0);
signal buffer_register: std_logic_vector(31 downto 0);
signal data_in_CSR: std_logic_vector(31 downto 0);
signal data_out: std_logic_vector(31 downto 0);
signal buffer_register_w: std_logic;
signal buffer_register_CSR_DRA: std_logic;
signal reset_buffer_register: std_logic;
signal modify_mstatus_EI: std_logic;
signal modify_mstatus_RET: std_logic;

--arbiter control
signal local_reset : STD_LOGIC;
signal buffer_arbiter : STD_LOGIC;

begin

----------------------------------------------------------------------------------
--buffer_register
--  this register is used to exchange data between the DRA_controll and 
--  CSR_access_unit. An additional feature is implemented to modify the MIE and
--  MPIE as well as the MPP fields (according to the module design).
----------------------------------------------------------------------------------
buffer_register_proc: process(clk, reset)
begin
    if(reset = '1') then
        buffer_register <= x"00000000";
    elsif(clk'event and clk='0') then --on falling edge
        if(reset_buffer_register = '1') then
            buffer_register <= x"00000000";
        elsif(buffer_register_w = '1' and buffer_register_CSR_DRA = '1') then
            buffer_register <= data_in_CSR;
        elsif(buffer_register_w = '1' and buffer_register_CSR_DRA = '0') then
            buffer_register <= data_in_DRA;
        end if;
    end if;
end process;

--combinatorioal output network, to modify the data in case mstatus needs to be changed:
data_out <= buffer_register(31 downto 8) & buffer_register(3) & buffer_register(6 downto 4) & '0' & buffer_register(2 downto 0) when modify_mstatus_EI = '1' else
            buffer_register(31 downto 13) & "11" & buffer_register(10 downto 8) & '1' & buffer_register(6 downto 4) & buffer_register(7) & buffer_register(2 downto 0) when modify_mstatus_RET = '1' else
            buffer_register(31 downto 0);
            
            
----------------------------------------------------------------------------------
--Exception_Control_FSM
----------------------------------------------------------------------------------
EC_FSM: Exception_Control_FSM
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
    --halt core signal
    halt_core => halt_core,
    --buffer register signals
    buffer_register_w => buffer_register_w,
    buffer_register_CSR_DRA => buffer_register_CSR_DRA,
    modify_mstatus_EI => modify_mstatus_EI,
    modify_mstatus_RET => modify_mstatus_RET,
    reset_buffer => reset_buffer_register,
    --DRA signal
    PC_rw => pc_write,
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
    store_mstatus => store_mstatus,
    --arbiter control
    local_reset => local_reset,
    buffer_arbiter => buffer_arbiter
);

----------------------------------------------------------------------------------
--DRA_controll
----------------------------------------------------------------------------------
DRA_cont: DRA_controll
port map(
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --dra access signals
    PC_dra_read => PC_dra,
    IR_dra => IR_dra,
    PMP_dra => PMP_dra,
    --control signals
    load_PC => load_PC,
    load_IR => load_IR,
    load_PMP => load_PMP,
    --data input
    data_out => data_out,
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    PC_dra_write => PC_dra_write,
    data_in_dra => data_in_DRA
);

----------------------------------------------------------------------------------
--CSR_access_controll
----------------------------------------------------------------------------------
CSR_cont: CSR_access_controll
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    store_mepc => store_mepc,
    store_mstatus => store_mstatus,
    store_mtval => store_mtval,
    store_mcause => store_mcause,
    load_mtvec => load_mtvec,
    load_mepc => load_mepc,
    load_mstatus => load_mstatus,
    --exception code and interrupt signal
    exception_code => exception_code,
    interrupt => interrupt,
    --data inputs
    data_in_EC => data_in_EC,
    data_out => data_out,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR access signals
    CSR_read_EC => CSR_read_EC,
    CSR_write_EC => CSR_write_EC,
    CSR_address_EC => CSR_address_EC,
    --data outputs
    data_out_EC => data_out_EC,
    data_in_CSR => data_in_CSR
);

----------------------------------------------------------------------------------
--arbiter
----------------------------------------------------------------------------------
arbiter_unit: arbiter
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --exception signals
    load_afe_P => load_afe_P,
    storeAMO_afe_P => storeAMO_afe_P,
    instruction_afe_P => instruction_afe_P,
    load_ame_P => load_ame_P,
    storeAMO_ame_P => storeAMO_ame_P,
    instruction_ame_P => instruction_ame_P,
    load_afe_AXI => load_afe_AXI,
    storeAMO_afe_AXI => storeAMO_afe_AXI,
    instruction_afe_AXI => instruction_afe_AXI,
    iie_CU => iie_CU,
    ece_CU => ece_CU,
    be_CU => be_CU,
    iie_CSR => iie_CSR,
    --interrutp signals
    si_CSR => si_CSR,
    ti_CSR => ti_CSR,
    --arbiter control
    local_reset => local_reset,
    buffer_arbiter => buffer_arbiter,
    --clock and reset
    clk => clk,
    reset => reset,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --safe signals
    save_address => save_address,
    save_PC => save_PC,
    save_IR => save_IR,
    --control signals
    interrupt => interrupt,
    exception_code => exception_code,
    EI_flag => EI_flag
);

end rtl;












