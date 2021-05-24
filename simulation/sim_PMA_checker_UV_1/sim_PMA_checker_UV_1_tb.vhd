----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: 
-- Module Name: sim_PMA_checker_UV_1_tb - rtl
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

library PMP_lib;
use PMP_lib.PMP_PMA_pkg.ALL;
use PMP_lib.sim_PMA_checker_UV_1_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_PMA_checker_UV_1_tb is
end sim_PMA_checker_UV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_PMA_checker_UV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --control signals
    signal size : std_logic_vector(1 downto 0);
    signal readWrite : std_logic;
    signal instruction : std_logic;
    signal enable : std_logic;
    --address to check
    signal address : std_logic_vector (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --enable signals
    signal enable_PMA : std_logic;
    --exception signals
    signal load_ame_P : std_logic;
    signal storeAMO_ame_P : std_logic;
    signal instruction_ame_P : std_logic;

begin
----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    for i in 0 to 5 loop
        error_flag := false;
        --address inputs
        address <= stimulus_address(i rem 3);
        
        --control inputs
        readWrite <= stimulus_control(i)(3);
        instruction <= stimulus_control(i)(2);
        size <= stimulus_control(i)(1 downto 0);
        enable <= '1';
        
        
        wait for 1 ns;
        --result_vect(3) = enable_PMA, result_vect(2) = load_ame_P, result_vect(1) = storeAMO_ame_P. result_vect(0) = instruction_ame_P

        if(results(i)(3) /= enable_PMA) then
            report "enable_PMP error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(2) /= load_ame_P) then
            report "load_afe_P error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(1) /= storeAMO_ame_P) then
            report "storeAMO_afe_P error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(0) /= instruction_ame_P) then
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
--Design Under Test
----------------------------------------------------------------------------------
dut : PMA_checker
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
    storeAMO_ame_P => storeAMO_ame_P,
    instruction_ame_P => instruction_ame_P 
);

end rtl;
