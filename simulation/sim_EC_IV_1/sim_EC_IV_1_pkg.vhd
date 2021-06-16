----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 11:12:41 AM
-- Design Name: sim_EC_IV_1
-- Module Name: sim_EC_IV_1_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this package contains stimuli and verification dat for the 
--  sim_EC_IV_1_tb.vhd testbench.
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
use IEEE.std_logic_textio.all;
library std;
use std.textio.all;

----------------------------------------------------------------------------------
--PACKAGE
----------------------------------------------------------------------------------
package sim_EC_IV_1_pkg is
function to_hstring (SLV : std_logic_vector) return string;
----------------------------------------------
--COMPONENTS
----------------------------------------------------------------------------------
component sim_EC_IV_1_registers is
generic(
    IR_data : std_logic_vector(31 downto 0) := x"DEADAFFE";
    PMP_data : std_logic_vector(31 downto 0) := x"BADC0DED"
);
port( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --CSR signals
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_read : in STD_LOGIC;
    CSR_write : in STD_LOGIC;
    CSR_data_in : in STD_LOGIC_VECTOR (31 downto 0);
    --PC write
    PC_write : in STD_LOGIC;
    PC_dra_write : in STD_LOGIC_VECTOR (31 downto 0);
    --halt core = enable signal
    halt_core : in STD_LOGIC;
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --CSR data output
    CSR_data_out : out STD_LOGIC_VECTOR (31 downto 0);
    MEPC : out STD_LOGIC_VECTOR (31 downto 0);
    MTVAL : out STD_LOGIC_VECTOR (31 downto 0);
    MSTATUS : out STD_LOGIC_VECTOR (31 downto 0);
    MTVEC : out STD_LOGIC_VECTOR (31 downto 0);
    MCAUSE : out STD_LOGIC_VECTOR (31 downto 0);
    --dra registers
    PC_dra : out STD_LOGIC_VECTOR (31 downto 0);
    IR_dra : out STD_LOGIC_VECTOR (31 downto 0);
    PMP_dra : out STD_LOGIC_VECTOR (31 downto 0)
);
end component;


----------------------------------------------------------------------------------
--types
----------------------------------------------------------------------------------
type EI_rec is record
    load_afe_P : std_logic;
    storeAMO_afe_P : std_logic;
    instruction_afe_P : std_logic;
    load_ame_P : std_logic;
    storeAMO_ame_P : std_logic;
    instruction_ame_P : std_logic;
    load_afe_AXI : std_logic;
    storeAMO_afe_AXI : std_logic;
    instruction_afe_AXI : std_logic;
    iie_CU : std_logic;
    ece_CU : std_logic;
    be_CU : std_logic;
    iie_CSR : std_logic;
    si_CSR : std_logic;
    ti_CSR : std_logic;
end record;

type result_rec is record
     MEPC : std_logic_vector(31 downto 0);
     MSTATUS : std_logic_vector(31 downto 0);
     MTVEC : std_logic_vector(31 downto 0);
     MTVAL : std_logic_vector(31 downto 0);
     MCAUSE : std_logic_vector(31 downto 0);
     PC : std_logic_vector(31 downto 0);
end record;

type stim_vec is array(natural range <>) of EI_rec;
type result_vec is array(natural range <>) of result_rec; 
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------
constant stimulus : stim_vec(15 downto 0) := (
    0 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    1 => ( load_afe_P => '1', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    2 => ( load_afe_P => '0', storeAMO_afe_P => '1', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    3 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '1', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    4 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '1', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    5 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '1', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    6 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '1', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    7 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '1', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    8 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '1', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    9 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '1', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    10 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '1', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    11 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '1', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    12 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '1', iie_CSR => '0', ti_CSR => '0', si_CSR => '0' ),
    13 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '1', ti_CSR => '0', si_CSR => '0' ),
    14 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '1', si_CSR => '0' ),
    15 => ( load_afe_P => '0', storeAMO_afe_P => '0', instruction_afe_P => '0', load_ame_P => '0', storeAMO_ame_P => '0', instruction_ame_P => '0', load_afe_AXI => '0', storeAMO_afe_AXI => '0', instruction_afe_AXI => '0', iie_CU => '0', ece_CU => '0', be_CU => '0', iie_CSR => '0', ti_CSR => '0', si_CSR => '1' )
);

constant results : result_vec(16 downto 0) := ( --16th test is return test
    0 => (MEPC => x"00000000", MSTATUS => x"00001808", MTVEC => x"ABBA0001", MTVAL => x"00000000", MCAUSE => x"00000000", PC =>x"00000000"),
    1 => (MEPC => x"00000000", MSTATUS => x"00001880", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000005", PC =>x"ABBA0000"),
    2 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000007", PC =>x"ABBA0000"),
    3 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000001", PC =>x"ABBA0000"),
    4 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000004", PC =>x"ABBA0000"),
    5 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000006", PC =>x"ABBA0000"),
    6 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000000", PC =>x"ABBA0000"),
    7 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000005", PC =>x"ABBA0000"),
    8 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000007", PC =>x"ABBA0000"),
    9 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"DEADAFFE", MCAUSE => x"00000001", PC =>x"ABBA0000"),
    10 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"BADC0DED", MCAUSE => x"00000002", PC =>x"ABBA0000"),
    11 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"00000000", MCAUSE => x"0000000B", PC =>x"ABBA0000"),
    12 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"ABBA0000", MCAUSE => x"00000003", PC =>x"ABBA0000"),
    13 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"BADC0DED", MCAUSE => x"00000002", PC =>x"ABBA0000"),
    14 => (MEPC => x"ABBA0000", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"00000000", MCAUSE => x"80000007", PC =>x"ABBA001C"),
    15 => (MEPC => x"ABBA001C", MSTATUS => x"00001800", MTVEC => x"ABBA0001", MTVAL => x"00000000", MCAUSE => x"80000003", PC =>x"ABBA000C"),
    16 => (MEPC => x"ABBA001C", MSTATUS => x"00001880", MTVEC => x"ABBA0001", MTVAL => x"00000000", MCAUSE => x"80000003", PC =>x"ABBA001C")
);

end package;


package body sim_EC_IV_1_pkg is
function to_hstring (SLV : std_logic_vector) return string is
    variable L : LINE;
  begin
    hwrite(L,SLV);
    return L.all;
  end function to_hstring;
end package body;



