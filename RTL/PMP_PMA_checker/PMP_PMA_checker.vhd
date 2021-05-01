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

library PMP_PMA_lib;
use PMP_PMA_lib.PMP_PMA_pkg.all;

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
    pmpcfg : in type_pmpcfg;
    pmpaddr: in type_pmpaddr;
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
signal enable_PMA: std_logic;
signal enable_PMP: std_logic;
signal address_register: std_logic_vector(31 downto 0);
begin

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
address_register <= address when clk'event and clk='0' and enable = '1' else
                   x"00000000" when reset = '1';
                   
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
