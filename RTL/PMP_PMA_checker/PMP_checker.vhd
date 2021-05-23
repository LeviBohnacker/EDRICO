----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/01/2021 09:10:02 AM
-- Design Name: PMP_PMA_checker
-- Module Name: PMP_checker
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  module to instantiate the PMP_unit modules and determine 
--  whether or not an access is enabled. If exceptions are raised,
--  the PMP_checker determines which sort of exception (load, 
--  instruction or storeAMO access fault exceptions are possible).
-- Dependencies: 
--  PMP_unit.vhd
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library PMP_lib;
use PMP_lib.PMP_PMA_pkg.all;

entity PMP_checker is
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
    address_hit_verify : out std_logic_vector(15 downto 0);
    load_afe_verify : out std_logic_vector(15 downto 0);
    storeAMO_afe_verify : out std_logic_vector(15 downto 0);
    instruction_afe_verify : out std_logic_vector(15 downto 0);
    address_upper_verify : out std_logic_vector(31 downto 0);
    --enable signal
    enable_pmp: out std_logic;
    --exception signals
    load_afe_P: out std_logic;
    instruction_afe_P: out std_logic;
    storeAMO_afe_P: out std_logic
);
end entity;

architecture rtl of PMP_checker is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal access_size: std_logic_vector(31 downto 0);  --hold upper border for access
signal address_upper: std_logic_vector(31 downto 0); --hold access size in 32-bit binary
signal address_hit: std_logic_vector(15 downto 0); --16-bit address_hit vector
signal load_afe_P_unit: std_logic_vector(15 downto 0); --16-bit exception_hit vector
signal storeAMO_afe_P_unit: std_logic_vector(15 downto 0); --16-bit exception_hit vector
signal instruction_afe_P_unit: std_logic_vector(15 downto 0); --16-bit exception_hit vector
signal enable_int: std_logic; --internal enable signal
signal exception_vect: std_logic_vector(2 downto 0); --internal exception signal exception_vect(2) = load_afe_P, exception_vect(1) = storeAMO_afe_P, exception_vect(0) = instruction_afe_P
begin
--debug outputs
address_hit_verify <=address_hit;
load_afe_verify <= load_afe_P_unit;
storeAMO_afe_verify <= storeAMO_afe_P_unit;
instruction_afe_verify <= instruction_afe_P_unit;
address_upper_verify <= address_upper;


----------------------------------------------------------------------------------
--upper address calc
--  calculate upper bounds of access
----------------------------------------------------------------------------------
--caclualte access_size from coded signal to actual number
access_size <= x"00000000" when size = "00" else
               x"00000001" when size = "01" else
               x"00000003" when size = "10" else
               x"00000000"; --is that okay? what happens if size is "11", should not happen but still be defined
               
--calculate upper address border for access.
address_upper <= std_logic_vector(unsigned(address)+unsigned(access_size));--overflow should not be a sproblem since RISC-V address space wraps arround (cehck this!)
         
----------------------------------------------------------------------------------
--PMP unit generation
--  implement 16 PMPunits
----------------------------------------------------------------------------------  
--first PMP unit outside generate since pmpaddrLOW must be set to x"00000000"   
unit0: PMP_unit
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP register inputs
    pmpcfg => pmpcfg(0),
    pmpaddr => pmpaddr(0),
    pmpaddrLow => x"00000000",
    --control signal inputs
    address_upper => address_upper,
    readWrite => readWrite,
    instruction => instruction,
    --address to check
    address => address,
    
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    address_hit => address_hit(0),
    load_afe_P => load_afe_P_unit(0),
    storeAMO_afe_P => storeAMO_afe_P_unit(0),
    instruction_afe_P => instruction_afe_P_unit(0)
); 

--generation of upper 15 PMP_unit instances
unit_gen: for k in 1 to 15 generate
    unit: PMP_unit
    port map(
        ------------------------------------------------------------------------------
        --input signals
        ------------------------------------------------------------------------------
        --PMP register inputs
        pmpcfg => pmpcfg(k),
        pmpaddr => pmpaddr(k),
        pmpaddrLow => pmpaddr(k-1),
        --control signal inputs
        address_upper => address_upper,
        readWrite => readWrite,
        instruction => instruction,
        --address to check
        address => address,
        
        ------------------------------------------------------------------------------
        --output signals
        ------------------------------------------------------------------------------
        address_hit => address_hit(k),
        load_afe_P => load_afe_P_unit(k),
        storeAMO_afe_P => storeAMO_afe_P_unit(k),
        instruction_afe_P => instruction_afe_P_unit(k)
    ); 
end generate;

----------------------------------------------------------------------------------
--exception signal generation
--  multiplexer and logic network to generate the exception signals on a hit 
--  (and for the correct hit, if multiple are detected) 
----------------------------------------------------------------------------------  
exception_vect <=  load_afe_P_unit(0) & storeAMO_afe_P_unit(0) & instruction_afe_P_unit(0) when address_hit(0) = '1' else
                   load_afe_P_unit(1) & storeAMO_afe_P_unit(1) & instruction_afe_P_unit(1) when address_hit(1 downto 0) = "10" else
                   load_afe_P_unit(2) & storeAMO_afe_P_unit(2) & instruction_afe_P_unit(2) when address_hit(2 downto 0) = "100" else
                   load_afe_P_unit(3) & storeAMO_afe_P_unit(3) & instruction_afe_P_unit(3) when address_hit(3 downto 0) = x"8" else
                   load_afe_P_unit(4) & storeAMO_afe_P_unit(4) & instruction_afe_P_unit(4) when address_hit(4 downto 0) = "1" & x"0" else
                   load_afe_P_unit(5) & storeAMO_afe_P_unit(5) & instruction_afe_P_unit(5) when address_hit(5 downto 0) = "10" & x"0" else
                   load_afe_P_unit(6) & storeAMO_afe_P_unit(6) & instruction_afe_P_unit(6) when address_hit(6 downto 0) = "100" & x"0" else
                   load_afe_P_unit(7) & storeAMO_afe_P_unit(7) & instruction_afe_P_unit(7) when address_hit(7 downto 0) = x"80" else
                   load_afe_P_unit(8) & storeAMO_afe_P_unit(8) & instruction_afe_P_unit(8) when address_hit(8 downto 0) = "1" & x"00" else
                   load_afe_P_unit(9) & storeAMO_afe_P_unit(9) & instruction_afe_P_unit(9) when address_hit(9 downto 0) = "10" & x"00" else
                   load_afe_P_unit(10) & storeAMO_afe_P_unit(10) & instruction_afe_P_unit(10) when address_hit(10 downto 0) = "100" & x"00" else
                   load_afe_P_unit(11) & storeAMO_afe_P_unit(11) & instruction_afe_P_unit(11) when address_hit(11 downto 0) = x"800" else
                   load_afe_P_unit(12) & storeAMO_afe_P_unit(12) & instruction_afe_P_unit(12) when address_hit(12 downto 0) = "1" & x"000" else
                   load_afe_P_unit(13) & storeAMO_afe_P_unit(13) & instruction_afe_P_unit(13) when address_hit(13 downto 0) = "10" & x"000" else
                   load_afe_P_unit(14) & storeAMO_afe_P_unit(14) & instruction_afe_P_unit(14) when address_hit(14 downto 0) = "100" & x"000" else
                   load_afe_P_unit(15) & storeAMO_afe_P_unit(15) & instruction_afe_P_unit(15) when address_hit(15 downto 0) = x"8000" else
                   "000"; 
                  
--connect raised exceptions to the corresponding outputs
load_afe_P <= exception_vect(2) and enable;
storeAMO_afe_P <= exception_vect(1) and enable;
instruction_afe_P <= exception_vect(0) and enable;                  


----------------------------------------------------------------------------------
--enable_PMP signal generation
--  multiplexer to generate an enbale_PMP signal depending on which PMP unit 
--  detected a hit
----------------------------------------------------------------------------------  
enable_int <= not (exception_vect(2) or exception_vect(1) or exception_vect(0));
enable_PMP <= enable_int and enable;
              
      
end architecture;
