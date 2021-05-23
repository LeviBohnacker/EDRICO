----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 10:37:00 AM
-- Design Name: PMP_PMA_checker
-- Module Name: sim_PMP_checker_UV_2_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  this testbench verifies the correct behaviour of the PMP_checker. The
--  verification is based on a memory map and pmp settings defined in the 
--  PMP_memory_map.txt file.
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
use PMP_lib.sim_PMP_checker_UV_1_pkg.ALL;


----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_PMP_checker_UV_2_tb is
end sim_PMP_checker_UV_2_tb;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_PMP_checker_UV_2_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP information
    signal pmpcfg : type_pmpcfg; --array of 16 7-bit std_logic_vector
    signal pmpaddr : type_pmpaddr; --array of 16 32-bit std_logic_vector
    --address to check
    signal address : std_logic_vector(31 downto 0);
    --control signals
    signal readWrite : std_logic;
    signal instruction : std_logic;
    signal enable : std_logic;
    signal size : std_logic_vector(1 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --debug outputs
    signal address_hit_verify : std_logic_vector(15 downto 0);
    signal load_afe_verify : std_logic_vector(15 downto 0);
    signal storeAMO_afe_verify : std_logic_vector(15 downto 0);
    signal instruction_afe_verify : std_logic_vector(15 downto 0);
    signal address_upper_verify : std_logic_vector(31 downto 0);
    --enable signal
    signal enable_pmp : std_logic;
    --exception signals
    signal load_afe_P : std_logic;
    signal instruction_afe_P : std_logic;
    signal storeAMO_afe_P : std_logic;

begin
----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    for i in 0 to 35 loop
        error_flag := false;
        --address inputs
        address <= stimulus_address(i);
        
        --control inputs
        readWrite <= stimulus_control(i)(3);
        instruction <= stimulus_control(i)(2);
        size <= stimulus_control(i)(1 downto 0);
        enable <= '1';
        
        
        wait for 1 ns;
        if(results(i)(3) /= enable_PMP) then
            report "enable_PMP error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(2) /= load_afe_P) then
            report "load_afe_P error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(1) /= storeAMO_afe_P) then
            report "storeAMO_afe_P error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(0) /= instruction_afe_P) then
            report "instruction_afe_P error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        
        assert error_flag = false report "error in test: " & integer'image(i) severity error;
        
        wait for 4 ns;
    end loop;
    
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_cnt /= 0 report "verification successfull, 0 errors detected!" severity note;
    
    wait;
end process;

----------------------------------------------------------------------------------
--PMP configuration
--  the pmp registers are configured according to the memory map, defined in the
--  PMP_memory_map.tyt file.                                                              
----------------------------------------------------------------------------------
pmpcfg <= 
    (
    0 => "10001101",    --ROM0
    1 => "10011111",    --RAM0
    2 => "10011001",    --ROM1
    3 => "10000000",    --RAM1_L
    4 => "10001011",    --RAM1
    5 => "10011011",    --RAM2
    6 => "10011011",    --RAM3
    7 => "10011011",    --RAM4
    8 => "10011000",    --Region0
    9 => "10010011",    --Region1
    10 => "10000000",   --Region2_L
    11 => "10001111",   --Region2
    12 => "10011111",   --ROM1 redefined (error test this would allow instrcution and write accesses to a read-only region)
    13 => "10000101",  --not used
    14 => "10000101",   --not used
    15 => "10000101"    --not used
    );
 
pmpaddr <= 
    (   
    0 => x"00400000",   --ROM0
    1 => x"005FFFFF",   --RAM0
    2 => x"009FFFFF",   --ROM1
    3 => x"00C00000",   --RAM1_L
    4 => x"14000000",   --RAM1
    5 => x"1400001F",   --RAM2
    6 => x"1400005F",   --RAM3
    7 => x"1400009F",   --RAM4
    8 => x"140000DF",   --Region0
    9 => x"14000100",   --Region1
    10 => x"14000100",  --Region2_L
    11 => x"FFFFFFFF",  --Region2
    12 => x"009FFFFF",  --ROM1 redefind
    13 => x"005FFFFF",  --not used
    14 => x"003FFFFF",  --not used
    15 => x"003FFFFF"   --not used
    );   
 
----------------------------------------------------------------------------------
--Design Under Test
----------------------------------------------------------------------------------
dut: PMP_checker
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP information
    pmpcfg => pmpcfg, --array of 16 7-bit std_logic_vector
    pmpaddr => pmpaddr, --array of 16 32-bit std_logic_vector
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
    --debug outputs
    address_hit_verify => address_hit_verify,
    load_afe_verify => load_afe_verify,
    storeAMO_afe_verify => storeAMO_afe_verify,
    instruction_afe_verify => instruction_afe_verify,
    address_upper_verify => address_upper_verify,
    --enable signal
    enable_pmp => enable_pmp,
    --exception signals 
    load_afe_P => load_afe_P,
    instruction_afe_P => instruction_afe_P,
    storeAMO_afe_P => storeAMO_afe_P
);

end rtl;
