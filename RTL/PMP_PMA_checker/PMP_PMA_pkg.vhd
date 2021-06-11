----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2021 09:10:02 AM
-- Design Name: 
-- Module Name:  - 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

package PMP_PMA_pkg is

----------------------------------------------------------------------------------
--TYPES
----------------------------------------------------------------------------------
type type_pmpcfg is array (15 downto 0) of std_logic_vector(7 downto 0);
type type_pmpaddr is array (15 downto 0) of std_logic_vector(31 downto 0);

----------------------------------------------------------------------------------
--COMPONENTS
----------------------------------------------------------------------------------
component PMP_PMA_checker is
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
end component;

component PMP_unit is
port (
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP register inputs
    pmpcfg : in std_logic_vector(7 downto 0);
    pmpaddr : in std_logic_vector(31 downto 0);
    pmpaddrLow : in std_logic_vector(31 downto 0);
    --control signal inputs
    address_upper: in std_logic_vector(31 downto 0);
    readWrite, instruction : in std_logic;
    --address to check
    address : in std_logic_vector(31 downto 0);
    
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    address_hit: out std_logic;
    load_afe_P: out std_logic;
    storeAMO_afe_P: out std_logic;
    instruction_afe_P: out std_logic
);
end component;

component PMA_checker is
port ( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --control signals
    size : in std_logic_vector(1 downto 0);
    readWrite : in std_logic;
    instruction : in std_logic;
    enable : in std_logic;
    --address to check
    address : in std_logic_vector (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --enable signals
    enable_PMA : out std_logic;
    --exception signals
    load_ame_P : out std_logic;
    storeAMO_ame_P : out std_logic;
    instruction_ame_P : out std_logic
);
end component;

component PMP_checker is
port(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP information
    pmpcfg: in type_pmpcfg; --array of 16 7-bit std_logic_vector
    pmpaddr: in type_pmpaddr; --array of 16 32-bit std_logic_vector
    --address to check
    address: in std_logic_vector(31 downto 0);
    --control signals
    readWrite: in std_logic;
    instruction: in std_logic;
    enable: in std_logic;
    size: in std_logic_vector(1 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --debug outputs
    --address_hit_verify : out std_logic_vector(15 downto 0);
    --load_afe_verify : out std_logic_vector(15 downto 0);
    --storeAMO_afe_verify : out std_logic_vector(15 downto 0);
    --instruction_afe_verify : out std_logic_vector(15 downto 0);
    --address_upper_verify : out std_logic_vector(31 downto 0);
    --enable signal
    enable_pmp: out std_logic;
    --exception signals
    load_afe_P: out std_logic;
    instruction_afe_P: out std_logic;
    storeAMO_afe_P: out std_logic
);
end component;

end package;