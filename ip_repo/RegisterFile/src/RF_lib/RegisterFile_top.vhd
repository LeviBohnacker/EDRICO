----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/11/2021 07:08:31 PM
-- Design Name: RegisterFile_top
-- Module Name: RegisterFile_top - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this is the top module of the register file for EDRICO
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

library PMP_lib;
use PMP_lib.PMP_PMA_pkg.ALL;

library RF_lib;
use RF_lib.RF_pkg.ALL;
use RF_lib.CSR_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity RegisterFile_top is
port ( 
    -----------------------------------------------------------------------------
    --input signals
    -----------------------------------------------------------------------------#
    --clock and reset
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    --data inputs
    data_in : in STD_LOGIC_VECTOR (31 downto 0);
    msip_dra : in STD_LOGIC;
    mtip_dra : in STD_LOGIC;
    --CSR controll signals
    CSR_save : in STD_LOGIC;
    CSR_address : in STD_LOGIC_VECTOR (11 downto 0);
    CSR_write : in STD_LOGIC;
    CSR_read : in STD_LOGIC;
    --instruction finished flag
    instr_finished : in STD_LOGIC;
    --RV32I register controll signals
    register_write : in STD_LOGIC_VECTOR (4 downto 0);
    register_read_A : in STD_LOGIC_VECTOR (4 downto 0);
    register_read_B : in STD_LOGIC_VECTOR (4 downto 0);
    -----------------------------------------------------------------------------
    --output signals
    -----------------------------------------------------------------------------
    --interrupt/exception outputs
    iie_CSR : out STD_LOGIC;
    mti_CSR : out STD_LOGIC;
    msi_CSR : out STD_LOGIC;
    --data outputs
    data_bus_A : out STD_LOGIC_VECTOR (31 downto 0);
    data_bus_B : out STD_LOGIC_VECTOR (31 downto 0);
    pmpcfg_0 : out std_logic_vector(7 downto 0);
    pmpcfg_1 : out std_logic_vector(7 downto 0);
    pmpcfg_2 : out std_logic_vector(7 downto 0);
    pmpcfg_3 : out std_logic_vector(7 downto 0);
    pmpcfg_4 : out std_logic_vector(7 downto 0);
    pmpcfg_5 : out std_logic_vector(7 downto 0);
    pmpcfg_6 : out std_logic_vector(7 downto 0);
    pmpcfg_7 : out std_logic_vector(7 downto 0);
    pmpcfg_8 : out std_logic_vector(7 downto 0);
    pmpcfg_9 : out std_logic_vector(7 downto 0);
    pmpcfg_10 : out std_logic_vector(7 downto 0);
    pmpcfg_11 : out std_logic_vector(7 downto 0);
    pmpcfg_12 : out std_logic_vector(7 downto 0);
    pmpcfg_13 : out std_logic_vector(7 downto 0);
    pmpcfg_14 : out std_logic_vector(7 downto 0);
    pmpcfg_15 : out std_logic_vector(7 downto 0);
    pmpaddr_0: out std_logic_vector(31 downto 0);
    pmpaddr_1: out std_logic_vector(31 downto 0);
    pmpaddr_2: out std_logic_vector(31 downto 0);
    pmpaddr_3: out std_logic_vector(31 downto 0);
    pmpaddr_4: out std_logic_vector(31 downto 0);
    pmpaddr_5: out std_logic_vector(31 downto 0);
    pmpaddr_6: out std_logic_vector(31 downto 0);
    pmpaddr_7: out std_logic_vector(31 downto 0);
    pmpaddr_8: out std_logic_vector(31 downto 0);
    pmpaddr_9: out std_logic_vector(31 downto 0);
    pmpaddr_10: out std_logic_vector(31 downto 0);
    pmpaddr_11: out std_logic_vector(31 downto 0);
    pmpaddr_12: out std_logic_vector(31 downto 0);
    pmpaddr_13: out std_logic_vector(31 downto 0);
    pmpaddr_14: out std_logic_vector(31 downto 0);
    pmpaddr_15: out std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --debug outputs
    ------------------------------------------------------------------------------
    x1 : out STD_LOGIC_VECTOR(31 downto 0);
    x2 : out STD_LOGIC_VECTOR(31 downto 0);
    x3 : out STD_LOGIC_VECTOR(31 downto 0);
    x4 : out STD_LOGIC_VECTOR(31 downto 0);
    x5 : out STD_LOGIC_VECTOR(31 downto 0);
    x6 : out STD_LOGIC_VECTOR(31 downto 0);
    x7 : out STD_LOGIC_VECTOR(31 downto 0);
    x8 : out STD_LOGIC_VECTOR(31 downto 0);
    x9 : out STD_LOGIC_VECTOR(31 downto 0);
    x10 : out STD_LOGIC_VECTOR(31 downto 0);
    x11 : out STD_LOGIC_VECTOR(31 downto 0);
    x12 : out STD_LOGIC_VECTOR(31 downto 0);
    x13 : out STD_LOGIC_VECTOR(31 downto 0);
    x14 : out STD_LOGIC_VECTOR(31 downto 0);
    x15 : out STD_LOGIC_VECTOR(31 downto 0);
    x16 : out STD_LOGIC_VECTOR(31 downto 0);
    x17 : out STD_LOGIC_VECTOR(31 downto 0);
    x18 : out STD_LOGIC_VECTOR(31 downto 0);
    x19 : out STD_LOGIC_VECTOR(31 downto 0);
    x20 : out STD_LOGIC_VECTOR(31 downto 0);
    x21 : out STD_LOGIC_VECTOR(31 downto 0);
    x22 : out STD_LOGIC_VECTOR(31 downto 0);
    x23 : out STD_LOGIC_VECTOR(31 downto 0);
    x24 : out STD_LOGIC_VECTOR(31 downto 0);
    x25 : out STD_LOGIC_VECTOR(31 downto 0);
    x26 : out STD_LOGIC_VECTOR(31 downto 0);
    x27 : out STD_LOGIC_VECTOR(31 downto 0);
    x28 : out STD_LOGIC_VECTOR(31 downto 0);
    x29 : out STD_LOGIC_VECTOR(31 downto 0);
    x30 : out STD_LOGIC_VECTOR(31 downto 0);
    x31 : out STD_LOGIC_VECTOR(31 downto 0);
    mcycle_debug : out std_logic_vector(31 downto 0);
    mcycleH_debug : out std_logic_vector(31 downto 0);
    minstret_debug : out std_logic_vector(31 downto 0);
    minstretH_debug : out std_logic_vector(31 downto 0);
    mcountinhibit_debug : out std_logic_vector(31 downto 0);
    mstatus_debug : out std_logic_vector(31 downto 0);
    misa_debug : out std_logic_vector(31 downto 0);
    mie_debug : out std_logic_vector(31 downto 0);
    mtvec_debug : out std_logic_vector(31 downto 0);
    mscratch_debug : out std_logic_vector(31 downto 0);
    mepc_debug : out std_logic_vector(31 downto 0);
    mcause_debug : out std_logic_vector(31 downto 0);
    mtval_debug : out std_logic_vector(31 downto 0);
    mip_debug : out std_logic_vector(31 downto 0)
);
end RegisterFile_top;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of RegisterFile_top is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal pmpaddr : type_pmpaddr;
signal pmpcfg : type_pmpcfg;
signal CSR_data_bus_B, RV32I_data_bus_B : std_logic_vector(31 downto 0);
signal RV32I_data_in : std_logic_vector(31 downto 0);

begin
----------------------------------------------------------------------------------
--pmp signal associations
----------------------------------------------------------------------------------
pmpcfg(0) <= pmpcfg_0;
pmpcfg(1) <= pmpcfg_1;
pmpcfg(2) <= pmpcfg_2;
pmpcfg(3) <= pmpcfg_3;
pmpcfg(4) <= pmpcfg_4;
pmpcfg(5) <= pmpcfg_5;
pmpcfg(6) <= pmpcfg_6;
pmpcfg(7) <= pmpcfg_7;
pmpcfg(8) <= pmpcfg_8;
pmpcfg(9) <= pmpcfg_9;
pmpcfg(10) <= pmpcfg_10;
pmpcfg(11) <= pmpcfg_11;
pmpcfg(12) <= pmpcfg_12;
pmpcfg(13) <= pmpcfg_13;
pmpcfg(14) <= pmpcfg_14;
pmpcfg(15) <= pmpcfg_15;
pmpaddr(0) <= pmpaddr_0;
pmpaddr(1) <= pmpaddr_1;
pmpaddr(2) <= pmpaddr_2;
pmpaddr(3) <= pmpaddr_3;
pmpaddr(4) <= pmpaddr_4;
pmpaddr(5) <= pmpaddr_5;
pmpaddr(6) <= pmpaddr_6;
pmpaddr(7) <= pmpaddr_7;
pmpaddr(8) <= pmpaddr_8;
pmpaddr(9) <= pmpaddr_9;
pmpaddr(10) <= pmpaddr_10;
pmpaddr(11) <= pmpaddr_11;
pmpaddr(12) <= pmpaddr_12;
pmpaddr(13) <= pmpaddr_13;
pmpaddr(14) <= pmpaddr_14;
pmpaddr(15) <= pmpaddr_15;

----------------------------------------------------------------------------------
--RV32I register file
----------------------------------------------------------------------------------
RV32I_RF_mod: RV32I_RF
port map(
    ------------------------------------------------------------------------------
    --input signals 
    ------------------------------------------------------------------------------
    --control singals
    register_write => register_write,
    register_read_A => register_read_A,
    register_read_B => register_read_B,
    --data in
    data_in => RV32I_data_in,
    --clock and reset
    clk => clk,
    reset => reset,
    ------------------------------------------------------------------------------
    --output signals 
    ------------------------------------------------------------------------------
    data_bus_A => data_bus_A,
    data_bus_B => RV32I_data_bus_B,
    ------------------------------------------------------------------------------
    --debug outputs 
    ------------------------------------------------------------------------------
    x1 => x1,
    x2 => x2,
    x3 => x3,
    x4 => x4,
    x5 => x5,
    x6 => x6,
    x7 => x7,
    x8 => x8,
    x9 => x9,
    x10 => x10,
    x11 => x11,
    x12 => x12,
    x13 => x13,
    x14 => x14,
    x15 => x15,
    x16 => x16,
    x17 => x17,
    x18 => x18,
    x19 => x19,
    x20 => x20,
    x21 => x21,
    x22 => x22,
    x23 => x23,
    x24 => x24,
    x25 => x25,
    x26 => x26,
    x27 => x27,
    x28 => x28,
    x29 => x29,
    x30 => x30,
    x31 => x31
);

----------------------------------------------------------------------------------
--CSR register file
----------------------------------------------------------------------------------
CSR_mod: CSR_top
port map( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --data input
    data_in => RV32I_data_in,
    --interrupt pending bit dra's
    MSIP_dra => msip_dra,
    MTIP_dra => mtip_dra,
    --clock and reset
    clk => clk,
    reset => reset,
    --instruction finished flag
    instr_finished => instr_finished,
    --CSR controll signals
    CSR_address => CSR_address,
    CSR_read => CSR_read,
    CSR_write => CSR_write,
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    data_bus_B => CSR_data_bus_B,
    --pmp dra outputs
    pmpcfg_dra => pmpcfg,
    pmpaddr_dra => pmpaddr,
    --interrupt pending flags
    iie_CSR => iie_CSR,
    mtime_interrupt => mti_CSR,
    mSW_interrupt => msi_CSR,
    mcycle_debug => mcycle_debug,
    mcycleH_debug => mcycleH_debug,
    minstret_debug => minstret_debug,
    minstretH_debug => minstretH_debug,
    mcountinhibit_debug => mcountinhibit_debug,
    mstatus_debug => mstatus_debug,
    misa_debug => misa_debug,
    mie_debug => mie_debug,
    mtvec_debug => mtvec_debug,
    mscratch_debug => mscratch_debug,
    mepc_debug => mepc_debug,
    mcause_debug => mcause_debug,
    mtval_debug => mtval_debug,
    mip_debug => mip_debug
);

----------------------------------------------------------------------------------
--data_bus_B output mux
----------------------------------------------------------------------------------
data_bus_B <=   RV32I_data_bus_B when CSR_read = '0' else
                CSR_data_bus_B;
                
----------------------------------------------------------------------------------
--data_in RV32I RF mux
----------------------------------------------------------------------------------
RV32I_data_in <=    data_in when CSR_save = '0' else
                    CSR_data_bus_B;

end rtl;
