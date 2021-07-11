----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/04/2021 02:43:06 PM
-- Design Name: Exception_Controll
-- Module Name: Exception_Controll_pkg - Behavioral
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  contains type for Exception_Controll_FSM states and components
-- 
-- Dependencies: 
--  DRA_controll.vhd
--  CSR_access_controll.vhd
--  Exception_Controll_FSM.vhd
--  arbiter.vhd
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Exception_Controll_pkg is

----------------------------------------------------------------------------------
--TYPES
----------------------------------------------------------------------------------
type type_EC_state is (WFI, TrapEntry, sMEPC, sMTVAL, lMSTATUS, sMSTATUS, lMTVEC, sPC, TrapExit, sPC_ex, sMSTATUS_ex);

----------------------------------------------------------------------------------
--COMPONENTS
----------------------------------------------------------------------------------
component Exception_Controll is
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
    CSR_address_EC : out STD_LOGIC_VECTOR (11 downto 0);
    data_out_EC : out STD_LOGIC_VECTOR (31 downto 0);
    --programm counter
    PC_dra_write : out STD_LOGIC_VECTOR (31 downto 0);
    PC_write : out STD_LOGIC;
    --halt core
    halt_core : out STD_LOGIC
--    --debug outputs:
--    present_state_debug : out type_EC_state;
--    next_state_debug : out type_EC_state;
--        --Exception_Controll_FSM inputs:
--         EI_flag_deb: out std_logic;
--         save_address_deb: out std_logic;
--         save_PC_deb: out std_logic;
--         save_IR_deb: out std_logic;
        
--        --DRA_controll inputs:
--         load_PC_deb, load_IR_deb, load_PMP_deb: out std_logic;
--         store_PC_deb: out std_logic;
        
--        --CSR_access_unit inputs:
--         interrupt_deb: out std_logic;
--         exception_code_deb: out std_logic_vector(31 downto 0);
--         load_mepc_deb, load_mtvec_deb, load_mstatus_deb: out std_logic;
--         store_mepc_deb, store_mcause_deb, store_mtval_deb, store_mstatus_deb: out std_logic;
        
--        --buffer_register signals:
--         data_in_DRA_deb: out std_logic_vector(31 downto 0);
--         buffer_register_deb: out std_logic_vector(31 downto 0);
--         data_in_CSR_deb: out std_logic_vector(31 downto 0);
--         data_out_deb: out std_logic_vector(31 downto 0);
--         buffer_register_w_deb: out std_logic;
--         buffer_register_CSR_DRA_deb: out std_logic;
--         reset_buffer_register_deb: out std_logic;
--         modify_mstatus_EI_deb: out std_logic;
--         modify_mstatus_RET_deb: out std_logic;
        
--        --arbiter control
--         local_reset_deb : out STD_LOGIC;
--         buffer_arbiter_deb : out STD_LOGIC
);
end component;


component arbiter is
Port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --exception signals
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
    --interrutp signals
    si_CSR : in STD_LOGIC;
    ti_CSR : in STD_LOGIC;
    --arbiter control
    buffer_arbiter : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --safe signals
    save_address : out STD_LOGIC;
    save_PC : out STD_LOGIC;
    save_IR : out STD_LOGIC;
    --control signals
    interrupt : out STD_LOGIC;
    exception_code : out STD_LOGIC_VECTOR(31 downto 0);
    EI_flag : out STD_LOGIC
);
end component;

component Exception_Control_FSM is
Port ( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    EI_flag : in STD_LOGIC;
    ret : in STD_LOGIC;
    save_address : in STD_LOGIC;
    save_PC : in STD_LOGIC;
    save_IR : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --debug current state output
    --present_state_debug : out type_EC_state;
    --next_state_debug : out type_EC_state;
    --halt core signal
    halt_core : out STD_LOGIC;
    --buffer register signals
    buffer_register_w : out STD_LOGIC;
    buffer_register_CSR_DRA : out STD_LOGIC;
    modify_mstatus_EI : out STD_LOGIC;
    modify_mstatus_RET : out STD_LOGIC;
    reset_buffer : out STD_LOGIC;
    --DRA signal
    PC_rw : out STD_LOGIC;
    --DRA_controll signals
    load_PC : out STD_LOGIC;
    load_IR : out STD_LOGIC;
    load_PMP : out STD_LOGIC;
    --CSR_access_unit signals
    load_mepc : out STD_LOGIC;
    load_mtvec : out STD_LOGIC;
    load_mstatus : out STD_LOGIC;
    store_mepc : out STD_LOGIC;
    store_mcause : out STD_LOGIC;
    store_mtval : out STD_LOGIC;
    store_mstatus : out STD_LOGIC;
    --arbiter control
    buffer_arbiter : out STD_LOGIC
);
end component;

component CSR_access_controll is
port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --controll signals
    store_mepc : in std_logic;
    store_mstatus : in std_logic;
    store_mtval : in std_logic;
    store_mcause : in std_logic;
    load_mtvec : in std_logic;
    load_mepc : in std_logic;
    load_mstatus : in std_logic;
    --exception code and interrupt signal
    exception_code : in std_logic_vector (31 downto 0);
    interrupt : in std_logic;
    --data inputs
    data_in_EC : in std_logic_vector (31 downto 0);
    data_out : in std_logic_vector (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR access signals
    CSR_read_EC : out std_logic;
    CSR_write_EC : out std_logic;
    CSR_address_EC : out std_logic_vector (11 downto 0);
    --data outputs
    data_out_EC : out std_logic_vector (31 downto 0);
    data_in_CSR : out std_logic_vector (31 downto 0)
);
end component;

component DRA_controll is
port(
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --dra access signals
    PC_dra_read : in std_logic_vector (31 downto 0);
    IR_dra : in std_logic_vector (31 downto 0);
    PMP_dra : in std_logic_vector (31 downto 0);
    --control signals
    load_PC : in std_logic;
    load_IR : in std_logic;
    load_PMP : in std_logic;
    --data input
    data_out : in std_logic_vector(31 downto 0);
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    PC_dra_write : out std_logic_vector (31 downto 0);
    data_in_dra : out std_logic_vector (31 downto 0)
);
end component;

end Exception_Controll_pkg;