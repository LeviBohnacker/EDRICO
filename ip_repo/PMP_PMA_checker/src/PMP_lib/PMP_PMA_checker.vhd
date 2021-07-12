----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/01/2021 10:42:59 PM
-- Design Name: PMP_PMA_checker
-- Module Name: PMP_PMA_checker - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this is the module that enforces memory protection checks and memory
--  attributes on addresses
-- 
-- Dependencies: 
--  PMP_checker.vhd
--  PMA_checker.vhd
--  PMP_PMA_pkg.vhd
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library PMP_lib;
use PMP_lib.PMP_PMA_pkg.all;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity PMP_PMA_checker is
port 
( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --clock and reset
    clk : in std_logic;
    reset : in std_logic;
    --control signals
    size : in std_logic_vector (1 downto 0);
    readWrite : in std_logic;
    instruction : in std_logic;
    enable : in std_logic;
    --address to check
    address : in std_logic_vector (31 downto 0);
    --pmp register dra
    pmpcfg_0 : in std_logic_vector(7 downto 0);
    pmpcfg_1 : in std_logic_vector(7 downto 0);
    pmpcfg_2 : in std_logic_vector(7 downto 0);
    pmpcfg_3 : in std_logic_vector(7 downto 0);
    pmpcfg_4 : in std_logic_vector(7 downto 0);
    pmpcfg_5 : in std_logic_vector(7 downto 0);
    pmpcfg_6 : in std_logic_vector(7 downto 0);
    pmpcfg_7 : in std_logic_vector(7 downto 0);
    pmpcfg_8 : in std_logic_vector(7 downto 0);
    pmpcfg_9 : in std_logic_vector(7 downto 0);
    pmpcfg_10 : in std_logic_vector(7 downto 0);
    pmpcfg_11 : in std_logic_vector(7 downto 0);
    pmpcfg_12 : in std_logic_vector(7 downto 0);
    pmpcfg_13 : in std_logic_vector(7 downto 0);
    pmpcfg_14 : in std_logic_vector(7 downto 0);
    pmpcfg_15 : in std_logic_vector(7 downto 0);
    pmpaddr_0: in std_logic_vector(31 downto 0);
    pmpaddr_1: in std_logic_vector(31 downto 0);
    pmpaddr_2: in std_logic_vector(31 downto 0);
    pmpaddr_3: in std_logic_vector(31 downto 0);
    pmpaddr_4: in std_logic_vector(31 downto 0);
    pmpaddr_5: in std_logic_vector(31 downto 0);
    pmpaddr_6: in std_logic_vector(31 downto 0);
    pmpaddr_7: in std_logic_vector(31 downto 0);
    pmpaddr_8: in std_logic_vector(31 downto 0);
    pmpaddr_9: in std_logic_vector(31 downto 0);
    pmpaddr_10: in std_logic_vector(31 downto 0);
    pmpaddr_11: in std_logic_vector(31 downto 0);
    pmpaddr_12: in std_logic_vector(31 downto 0);
    pmpaddr_13: in std_logic_vector(31 downto 0);
    pmpaddr_14: in std_logic_vector(31 downto 0);
    pmpaddr_15: in std_logic_vector(31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --address outputs
    address_out : out std_logic_vector (31 downto 0);
    address_dra : out std_logic_vector (31 downto 0);
    --control outputs
    enable_out : out std_logic;
    readWrite_out : out std_logic;
    instruction_out : out std_logic;
    size_out : out std_logic_vector (1 downto 0);
    --exception pending signals
    load_ame_P : out std_logic;
    storeAMO_ame_P : out std_logic;
    instruction_ame_P : out std_logic;
    load_afe_P : out std_logic;
    storeAMO_afe_P : out std_logic;
    instruction_afe_P : out std_logic
);
end PMP_PMA_checker;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of PMP_PMA_checker is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal pmpcfg : type_pmpcfg;
signal pmpaddr: type_pmpaddr;
signal enable_PMA: std_logic;
signal enable_PMP: std_logic;
signal address_register: std_logic_vector(31 downto 0);
signal enable_register : std_logic;
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
--PMP_checker
--  module to enforce physical memory protection rules on addresses
----------------------------------------------------------------------------------
PMPchecker: PMP_checker
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP information
    pmpcfg => pmpcfg,
    pmpaddr => pmpaddr,
    --address to check
    address => address,
    --control signals
    readWrite => readWrite,
    instruction => instruction,
    enable => enable,
    size => size,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --enable signal
    enable_pmp => enable_PMP,
    --exception signals
    load_afe_P => load_afe_P,
    instruction_afe_P => instruction_afe_P,
    storeAMO_afe_P => storeAMO_afe_P
);

----------------------------------------------------------------------------------
--PMA_checker
--  module to enforce physical memory attributs (address alligend?) on addresses
----------------------------------------------------------------------------------
PMAchecker: PMA_checker
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --control signals
    size => size,
    readWrite => readWrite,
    instruction => instruction,
    enable => enable,
    --address to check
    address => address,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --enable signals
    enable_PMA => enable_PMA,
    --exception signals
    load_ame_P => load_ame_P,
    storeAMO_ame_P =>storeAMO_ame_P,
    instruction_ame_P => instruction_ame_P
);

----------------------------------------------------------------------------------
--address_register
--  register to hold currently/last checked address. Updated on falling edge,
--  if enable is high with asynchronous reset.
----------------------------------------------------------------------------------
address_reg: process(reset , clk)
begin
    if(reset = '1') then
        address_register <= x"00000000";
        enable_register <= '0';
    elsif(clk'event and clk = '0' and enable = '1') then
        address_register <= address;
        --enable_register <= enable_PMA and enable_PMP;
    end if;
end process;                   
                   
----------------------------------------------------------------------------------
--output signals
----------------------------------------------------------------------------------
--enable out, only when both PMP and PMA checks are performed successfully 
enable_out <= enable_PMA and enable_PMP;
--address outputs
address_dra <= address_register;
address_out <= address_register;
--control signals
readWrite_out <= readWrite;
instruction_out <= instruction;
size_out <= size;
end rtl;
