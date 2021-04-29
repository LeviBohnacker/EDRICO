-------------------------------------------------------------------
--File Name:
--  PMP_unit.vhd
--Author:
--  Levi Bohnacker
--Description:
--  module to check an address againsta PMP CSR entry, depending on
--  the readWrite, instruction and size inputs. 
--  if a match is found the address_hit signal is set to high.
--  if a match is found and an excption musst be raised, the
--  excpetion_hit signal is set to high.
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------
--ENTITY
-------------------------------------------------------------------
entity PMP_unit is
port (
    ----------------------------------------------------------------
    --input signals
    ----------------------------------------------------------------
    --PMP register inputs
    pmpcfg : in std_logic_vector(7 downto 0);
    pmpaddr : in std_logic_vector(31 downto 0);
    pmpaddrLow : in std_logic_vector(31 downto 0);
    --control signal inputs
    size: in std_logic_vector(1 downto 0);
    readWrite, instruction : in std_logic;
    --address to check
    address : in std_logic_vector(31 downto 0);
    
    ----------------------------------------------------------------
    --output signals
    ----------------------------------------------------------------
    address_hit: out std_logic;
    exception_hit: out std_logic
);
end entity;


-------------------------------------------------------------------
--ARCHITECTURE
-------------------------------------------------------------------
architecture rtl of PMP_unit is
-------------------------------------------------------------------
--signals
-------------------------------------------------------------------
signal NAPOT_size: integer range 3 to 32;  --hold size of napot region
signal access_size: unsigned(31 downto 0);  --hold size of the access in an 32-bit unsigned
signal address_upper: unsigned(31 downto 0);--hold the upper address of the access (address+access_size)

signal address_hit_int: std_logic; --to loopback address_hit signal
-------------------------------------------------------------------
--constants
-------------------------------------------------------------------

begin
-------------------------------------------------------------------
--NAPOT_gen
--  generate a NAPOT size from the pmpaddr input
-------------------------------------------------------------------
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
                
--caclualte access_size from coded signal to actual number
access_size <= x"00000001" when size = "00" else
               x"00000002" when size = "01" else
               x"00000004" when size = "10" else
               x"00000000"; --is that okay? what happens if size is "11", should not happen but still be defined
                
--calculate upper address border for access.
address_upper <= unsigned(address)+access_size;--overflow should not be a sproblem since RISC-V address space wraps arround (cehck this!)
   
-------------------------------------------------------------------
--address_hit_detection
--  check pmp entry for address hit, depending on the pmpcfg settings
-------------------------------------------------------------------                             
address_hit_detection: process(pmpcfg, pmpaddr, size, NAPOT_size, address)
begin
    if(pmpcfg(7) = '1') then
        case pmpcfg(4 downto 3) is
            --PMP check for TOR configuration
            when "01" =>
                if ((unsigned(address(31 downto 2))>=unsigned(pmpaddrLow(29 downto 0))) and (address_upper(31 downto 2)<=unsigned(pmpaddr(29 downto 0)))) then
                    address_hit_int <= '1';
                else
                    address_hit_int <= '0';
                end if;
            --PMP check for NA4 configuration
            when "10" =>
                if ((address(31 downto 2)=pmpaddr(29 downto 0)) and (std_logic_vector(address_upper(31 downto 2))=pmpaddr(29 downto 0))) then
                    address_hit_int <= '1';
                else
                    address_hit_int <= '0';
                end if;
            --PMP check for NAPOT configuration
            when "11" =>
                if((address(31 downto NAPOT_size)=pmpaddr(29 downto NAPOT_size-2)) and (std_logic_vector(address_upper(31 downto NAPOT_size))=pmpaddr(29 downto NAPOT_size-2))) then
                    address_hit_int <= '1';
                else
                    address_hit_int <= '0';
                end if;
            --PMP check for OFF configuration
            when "00" =>
                address_hit_int <= '0';
        end case;
    else
        address_hit_int <= '0';
    end if;
end process address_hit_detection;  

-------------------------------------------------------------------
--exception_hit detection
--  check for possible exception hit, instruction and the pmpcfg.I 
--  bit must either be both one or both zero to not raise an 
--  exception, if an address_hit is detected (therefore a xor)
--  gate is used.
-------------------------------------------------------------------       
exception_hit <= '0' when address_hit_int='0' else
                 '0' when ((readWrite='1' and pmpcfg(1)='1') or (readWrite='0' and pmpcfg(0)='0')) and (instruction xor pmpcfg(2))='0' else
                 '1';           
              
              

end architecture;