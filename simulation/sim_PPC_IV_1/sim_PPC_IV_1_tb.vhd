----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: PMP_PMA_checker
-- Module Name: sim_PPC_IV_1 - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
-- This testbench verifies the behaviour of the PMP_PMA_checker.vhd file
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
use PMP_lib.sim_PPC_IV_1_pkg.ALL;
--add librarys

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_PPC_IV_1 is
end sim_PPC_IV_1;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_PPC_IV_1 is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --clock and reset
    signal clk :  std_logic := '1';
    signal reset :  std_logic;
    --control signals
    signal size :  std_logic_vector (1 downto 0);
    signal readWrite :  std_logic;
    signal instruction :  std_logic;
    signal enable :  std_logic;
    --address to check
    signal address :  std_logic_vector (31 downto 0);
    --pmp register dra
    signal pmpcfg :  type_pmpcfg;
    signal pmpaddr:  type_pmpaddr;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --address outputs
    signal address_out :  std_logic_vector (31 downto 0);
    signal address_dra :  std_logic_vector (31 downto 0);
    --control outputs
    signal enable_out :  std_logic;
    signal readWrite_out :  std_logic;
    signal instruction_out :  std_logic;
    signal size_out :  std_logic_vector (1 downto 0);
    --exception pending signals
    signal load_ame_P :  std_logic;
    signal storeAMO_ame_P :  std_logic;
    signal instruction_ame_P :  std_logic;
    signal load_afe_P :  std_logic;
    signal storeAMO_afe_P :  std_logic;
    signal instruction_afe_P :  std_logic;
    
signal iteration: integer := 0;
constant T : time := 5ns;
begin

clk <= not clk after T/2;
----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin

    reset <= '1';
    wait for 2*T;
    reset <= '0';
    for i in 0 to 35 loop
        error_flag := false;
        --declare inputs
        address <= stimulus_address(i);
        
        --control inputs
        readWrite <= stimulus_control(i)(3);
        instruction <= stimulus_control(i)(2);
        size <= stimulus_control(i)(1 downto 0);
        enable <= '1';
        
        
        
        wait for 3 ns;
		--result checks
        if(results(i)(6) /= enable_out) then
            report "enable_out error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(5) /= load_afe_p) then
            report "load_afe_p error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(4) /= storeAMO_afe_p) then
            report "storeAMO_afe_p error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(3) /= instruction_afe_p) then
            report "instruction_afe_p error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(2) /= load_ame_p) then
            report "load_ame_p error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(1) /= storeAMO_ame_p) then
            report "storeAMO_ame_p error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(0) /= instruction_ame_p) then
            report "instruction_ame_p error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(address_out /= address) then
        report "address_out error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(address_dra /= address) then
        report "address_dra error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(readWrite_out /= stimulus_control(i)(3)) then
        report "readWrite_out error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(instruction_out /= stimulus_control(i)(2)) then
        report "instruction_out error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(size_out /= stimulus_control(i)(1 downto 0)) then
        report "size_out error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        
        assert error_flag = false report "error in test: " & integer'image(i) severity error;
        
        wait for 2 ns;
        iteration <= iteration +1;
    end loop;
    
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_cnt /= 0 report "verification successfull, 0 errors detected!" severity note;
    
    enable <= '0';
    wait;
end process;

----------------------------------------------------------------------------------
--PMP configuration
--  the pmp registers are configured according to the memory map, defined in the
--  PMP_memory_map.txt file.                                                              
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
dut : PMP_PMA_checker
port map
( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --clock and reset
    clk => clk,
    reset => reset,
    --control signals
    size => size,
    readWrite => readWrite,
    instruction => instruction,
    enable => enable,
    --address to check
    address => address,
    --pmp register dra
    pmpcfg => pmpcfg,
    pmpaddr => pmpaddr,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --address outputs
    address_out => address_out,
    address_dra => address_dra,
    --control outputs
    enable_out => enable_out,
    readWrite_out => readWrite_out,
    instruction_out => instruction_out,
    size_out => size_out,
    --exception pending signals
    load_ame_P => load_ame_P,
    storeAMO_ame_P => storeAMO_ame_P,
    instruction_ame_P => instruction_ame_P,
    load_afe_P => load_afe_P,
    storeAMO_afe_P => storeAMO_afe_P,
    instruction_afe_P => instruction_afe_P
);

end rtl;
