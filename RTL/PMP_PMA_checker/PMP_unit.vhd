----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/01/2021 09:10:02 AM
-- Design Name: PMP_PMA_checker
-- Module Name: PMP_unit
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  module to check an address againsta PMP CSR entry, depending on
--  the readWrite, instruction and size inputs. 
--  if a match is found the address_hit signal is set to high.
--  if a match is found and an excption musst be raised, the
--  excpetion_hit signal is set to high.
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity PMP_unit is
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
end entity;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of PMP_unit is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal NAPOT_size: integer range 3 to 32;  --hold size of napot region
signal address_hit_int: std_logic; --to loopback address_hit signal
----------------------------------------------------------------------------------
--constants
----------------------------------------------------------------------------------

begin
----------------------------------------------------------------------------------
--NAPOT_gen
--  generate a NAPOT size from the pmpaddr input
----------------------------------------------------------------------------------
NAPOT_size <=   3 when pmpaddr(0) = '0' else
                4 when pmpaddr(1 downto 0) = "01" else
                5 when pmpaddr(2 downto 0) = "011" else
                6 when pmpaddr(3 downto 0) = "0111" else
                7 when pmpaddr(4 downto 0) = "0" & x"F" else
                8 when pmpaddr(5 downto 0) = "01" & x"F" else
                9 when pmpaddr(6 downto 0) = "011" & x"F" else
                10 when pmpaddr(7 downto 0) = "0111" & x"F" else
                11 when pmpaddr(8 downto 0) = "0" & x"FF" else
                12 when pmpaddr(9 downto 0) = "01" & x"FF" else
                13 when pmpaddr(10 downto 0) = "011" & x"FF" else
                14 when pmpaddr(11 downto 0) = "0111" & x"FF" else
                15 when pmpaddr(12 downto 0) = "0" & x"FFF" else
                16 when pmpaddr(13 downto 0) = "01" & x"FFF" else
                17 when pmpaddr(14 downto 0) = "011" & x"FFF" else
                18 when pmpaddr(15 downto 0) = "0111" & x"FFF" else
                19 when pmpaddr(16 downto 0) = "0" & x"FFFF" else
                20 when pmpaddr(17 downto 0) = "01" & x"FFFF" else
                21 when pmpaddr(18 downto 0) = "011" & x"FFFF" else
                22 when pmpaddr(19 downto 0) = "0111" & x"FFFF" else
                23 when pmpaddr(20 downto 0) = "0" & x"FFFFF" else
                24 when pmpaddr(21 downto 0) = "01" & x"FFFFF" else
                25 when pmpaddr(22 downto 0) = "011" & x"FFFFF" else
                26 when pmpaddr(23 downto 0) = "0111" & x"FFFFF" else
                27 when pmpaddr(24 downto 0) = "0" & x"FFFFFF" else
                28 when pmpaddr(25 downto 0) = "01" & x"FFFFFF" else
                29 when pmpaddr(26 downto 0) = "011" & x"FFFFFF" else
                30 when pmpaddr(27 downto 0) = "0111" & x"FFFFFF" else
                31 when pmpaddr(28 downto 0) = "0" & x"FFFFFFF" else
                32 when pmpaddr(29 downto 0) = "01" & x"FFFFFFF" else
                32;
               
                

   
----------------------------------------------------------------------------------
--address_hit_detection
--  check pmp entry for address hit, depending on the pmpcfg settings
----------------------------------------------------------------------------------
address_hit_detection: process(pmpcfg, pmpaddr, address_upper, NAPOT_size, address)
begin
    if(pmpcfg(7) = '1') then
        case pmpcfg(4 downto 3) is
            --PMP check for TOR configuration
            when "01" =>
                if ((unsigned(address(31 downto 2))>=unsigned(pmpaddrLow(29 downto 0))) and (unsigned(address(31 downto 2))<unsigned(pmpaddr(29 downto 0))) and (unsigned(address_upper(31 downto 2))<unsigned(pmpaddr(29 downto 0)))) then
                    address_hit_int <= '1';
                else
                    address_hit_int <= '0';
                end if;
            --PMP check for NA4 configuration
            when "10" =>
                if ((address(31 downto 2)=pmpaddr(29 downto 0)) and (address_upper(31 downto 2)=pmpaddr(29 downto 0))) then
                    address_hit_int <= '1';
                else
                    address_hit_int <= '0';
                end if;
            --PMP check for NAPOT configuration
            when "11" =>
                if((address(31 downto NAPOT_size)=pmpaddr(29 downto NAPOT_size-2)) and (address_upper(31 downto NAPOT_size)=pmpaddr(29 downto NAPOT_size-2))) then
                    address_hit_int <= '1';
                else
                    address_hit_int <= '0';
                end if;
            --PMP check for OFF configuration
            when others =>
                address_hit_int <= '0';
        end case;
    else
        address_hit_int <= '0';
    end if;
end process address_hit_detection;  

address_hit <= address_hit_int;

----------------------------------------------------------------------------------
--exception detection
--  check for possible exception hits
----------------------------------------------------------------------------------
load_afe_P <= '1' when readWrite = '0' and pmpcfg(0)='0' and address_hit_int = '1' else
              '0';
              
storeAMO_afe_P <= '1' when readWrite = '1' and pmpcfg(1)='0' and address_hit_int = '1' else
                  '0';
              
instruction_afe_P <= '1' when instruction = '1' and pmpcfg(2) = '0' and address_hit_int = '1' else
                     '0';
end architecture;