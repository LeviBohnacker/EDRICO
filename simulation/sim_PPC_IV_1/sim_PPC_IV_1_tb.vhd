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
    signal pmpcfg_0 : std_logic_vector(7 downto 0);
    signal pmpcfg_1 : std_logic_vector(7 downto 0);
    signal pmpcfg_2 : std_logic_vector(7 downto 0);
    signal pmpcfg_3 : std_logic_vector(7 downto 0);
    signal pmpcfg_4 : std_logic_vector(7 downto 0);
    signal pmpcfg_5 : std_logic_vector(7 downto 0);
    signal pmpcfg_6 : std_logic_vector(7 downto 0);
    signal pmpcfg_7 : std_logic_vector(7 downto 0);
    signal pmpcfg_8 : std_logic_vector(7 downto 0);
    signal pmpcfg_9 : std_logic_vector(7 downto 0);
    signal pmpcfg_10 : std_logic_vector(7 downto 0);
    signal pmpcfg_11 : std_logic_vector(7 downto 0);
    signal pmpcfg_12 : std_logic_vector(7 downto 0);
    signal pmpcfg_13 : std_logic_vector(7 downto 0);
    signal pmpcfg_14 : std_logic_vector(7 downto 0);
    signal pmpcfg_15 : std_logic_vector(7 downto 0);
    signal pmpaddr_0: std_logic_vector(31 downto 0);
    signal pmpaddr_1: std_logic_vector(31 downto 0);
    signal pmpaddr_2: std_logic_vector(31 downto 0);
    signal pmpaddr_3: std_logic_vector(31 downto 0);
    signal pmpaddr_4: std_logic_vector(31 downto 0);
    signal pmpaddr_5: std_logic_vector(31 downto 0);
    signal pmpaddr_6: std_logic_vector(31 downto 0);
    signal pmpaddr_7: std_logic_vector(31 downto 0);
    signal pmpaddr_8: std_logic_vector(31 downto 0);
    signal pmpaddr_9: std_logic_vector(31 downto 0);
    signal pmpaddr_10: std_logic_vector(31 downto 0);
    signal pmpaddr_11: std_logic_vector(31 downto 0);
    signal pmpaddr_12: std_logic_vector(31 downto 0);
    signal pmpaddr_13: std_logic_vector(31 downto 0);
    signal pmpaddr_14: std_logic_vector(31 downto 0);
    signal pmpaddr_15: std_logic_vector(31 downto 0);
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
pmpcfg_0 <= "10001101";    --ROM0
pmpcfg_1 <= "10011111";    --RAM0
pmpcfg_2 <= "10011001";    --ROM1
pmpcfg_3 <= "10000000";    --RAM1_L
pmpcfg_4 <= "10001011";    --RAM1
pmpcfg_5 <= "10011011";    --RAM2
pmpcfg_6 <= "10011011";    --RAM3
pmpcfg_7 <= "10011011";    --RAM4
pmpcfg_8 <= "10011000";    --Region0
pmpcfg_9 <= "10010011";    --Region1
pmpcfg_10 <= "10000000";   --Region2_L
pmpcfg_11 <= "10001111";   --Region2
pmpcfg_12 <= "10011111";   --ROM1 redefined (error test this would allow instrcution and write accesses to a read-only region)
pmpcfg_13 <= "10000101";  --not used
pmpcfg_14 <= "10000101";   --not used
pmpcfg_15 <= "10000101";    --not used
 
 
pmpaddr_0 <= x"00400000";   --ROM0
pmpaddr_0 <= x"005FFFFF";   --RAM0
pmpaddr_0 <= x"009FFFFF";   --ROM1
pmpaddr_0 <= x"00C00000";   --RAM1_L
pmpaddr_0 <= x"14000000";   --RAM1
pmpaddr_0 <= x"1400001F";   --RAM2
pmpaddr_0 <= x"1400005F";   --RAM3
pmpaddr_0 <= x"1400009F";   --RAM4
pmpaddr_0 <= x"140000DF";   --Region0
pmpaddr_0 <= x"14000100";   --Region1
pmpaddr_0 <= x"14000100";  --Region2_L
pmpaddr_0 <= x"FFFFFFFF";  --Region2
pmpaddr_0 <= x"009FFFFF";  --ROM1 redefind
pmpaddr_0 <= x"005FFFFF";  --not used
pmpaddr_0 <= x"003FFFFF";  --not used
pmpaddr_0 <= x"003FFFFF";  --not used

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
    pmpcfg_0 => pmpcfg_0,
    pmpcfg_1 => pmpcfg_1,
    pmpcfg_2 => pmpcfg_2,
    pmpcfg_3 => pmpcfg_3,
    pmpcfg_4 => pmpcfg_4,
    pmpcfg_5 => pmpcfg_5,
    pmpcfg_6 => pmpcfg_6,
    pmpcfg_7 => pmpcfg_7,
    pmpcfg_8 => pmpcfg_8,
    pmpcfg_9 => pmpcfg_9,
    pmpcfg_10 => pmpcfg_10,
    pmpcfg_11 => pmpcfg_11,
    pmpcfg_12 => pmpcfg_12,
    pmpcfg_13 => pmpcfg_13,
    pmpcfg_14 => pmpcfg_14,
    pmpcfg_15 => pmpcfg_15,
    pmpaddr_0 => pmpaddr_0,
    pmpaddr_1 => pmpaddr_1,
    pmpaddr_2 => pmpaddr_2,
    pmpaddr_3 => pmpaddr_3,
    pmpaddr_4 => pmpaddr_4,
    pmpaddr_5 => pmpaddr_5,
    pmpaddr_6 => pmpaddr_6,
    pmpaddr_7 => pmpaddr_7,
    pmpaddr_8 => pmpaddr_8,
    pmpaddr_9 => pmpaddr_9,
    pmpaddr_10 => pmpaddr_10,
    pmpaddr_11 => pmpaddr_11,
    pmpaddr_12 => pmpaddr_12,
    pmpaddr_13 => pmpaddr_13,
    pmpaddr_14 => pmpaddr_14,
    pmpaddr_15 => pmpaddr_15,
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
