----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/22/2021 10:34:01 AM
-- Design Name: PMP_PMA_checker
-- Module Name: sim_PMP_unit_UV_1 - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This testbench tests the functionality of the PMP_unit component used in
--  the PMP_checker.
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
use PMP_lib.sim_PMP_unit_UV_1_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_PMP_unit_UV_1 is
end sim_PMP_unit_UV_1;


----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_PMP_unit_UV_1 is

    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP register inputs
    signal pmpcfg : std_logic_vector(7 downto 0);
    signal pmpaddr : std_logic_vector(31 downto 0);
    signal pmpaddrLow : std_logic_vector(31 downto 0);
    --control signal inputs
    signal address_upper: std_logic_vector(31 downto 0);
    signal readWrite, instruction : std_logic;
    --address to check
    signal address : std_logic_vector(31 downto 0);
    
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    signal address_hit: std_logic;
    signal load_afe_P: std_logic;
    signal storeAMO_afe_P: std_logic;
    signal instruction_afe_P: std_logic;
    
    --signal to check pmpaddr signals in physical address space
    signal phys_pmpaddr : std_logic_vector(31 downto 0);
    signal phys_pmpaddrLOW : std_logic_vector(31 downto 0);
begin

----------------------------------------------------------------------------------
--test
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    for i in 0 to 31 loop
        error_flag := false;
        --pmp intputs
        pmpcfg <= stimulus_pmp(i mod 16)(71 downto 64);
        pmpaddr <= stimulus_pmp(i mod 16)(63 downto 32);
        pmpaddrLow <= stimulus_pmp(i mod 16)(31 downto 0);
        --assigning to physical address signals for debug porposes
        phys_pmpaddr <= stimulus_pmp(i mod 16)(61 downto 32) & "00";
        phys_pmpaddrLOW <= stimulus_pmp(i mod 16)(29 downto 0) & "00";
        
        --control inputs
        readWrite <= stimulus_control(i)(1);
        instruction <= stimulus_control(i)(0);
        
        --address inputs
        address <= stimulus_address(i)(65 downto 34); --upper two bits ignored since EDRICO does not implement virtual addresses
        address_upper <= stimulus_address(i)(31 downto 0); --upper two bits ignored since EDRICO does not implement virtual addresses
        
        
        wait for 1 ns;
        if(verify_output(i)(3) /= instruction_afe_P) then
            report "instruction_afe_P error at iteration: " & integer'image(i);
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(verify_output(i)(2) /= storeAMO_afe_P) then
            report "storeAMO_afe_P error at iteration: " & integer'image(i);
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(verify_output(i)(1) /= load_afe_P) then
            report "load_afe_P error at iteration: " & integer'image(i);
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(verify_output(i)(0) /= address_hit) then
            report "address_hit error at iteration: " & integer'image(i);
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
--design under test
----------------------------------------------------------------------------------
dut : PMP_unit
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --PMP register inputs
    pmpcfg => pmpcfg,
    pmpaddr => pmpaddr,
    pmpaddrLow => pmpaddrLow,
    --control signal inputs
    address_upper => address_upper,
    readWrite => readWrite,
    instruction => instruction,
    --address to check
    address => address,
    
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    address_hit => address_hit,
    load_afe_P => load_afe_P,
    storeAMO_afe_P => storeAMO_afe_P,
    instruction_afe_P => instruction_afe_P 
);

end rtl;
