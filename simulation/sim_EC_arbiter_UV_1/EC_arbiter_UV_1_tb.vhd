----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/19/2021 08:30:03 PM
-- Design Name: Exception Control
-- Module Name: EC_arbiter_UV_1_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This testbench verifies the correct functionality of the arbtier.vhd file
--  inside the EC_lib
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

library EC_lib;
use EC_lib.Exception_Controll_pkg.ALL;
use EC_lib.EC_arbiter_UV_1_pkg.ALL;

entity EC_arbiter_UV_1_tb is
end EC_arbiter_UV_1_tb;

architecture rtl of EC_arbiter_UV_1_tb is

    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --exception signals
    signal load_afe_P : STD_LOGIC;
    signal storeAMO_afe_P : STD_LOGIC;
    signal instruction_afe_P : STD_LOGIC;
    signal load_ame_P : STD_LOGIC;
    signal storeAMO_ame_P : STD_LOGIC;
    signal instruction_ame_P : STD_LOGIC;
    signal load_afe_AXI : STD_LOGIC;
    signal storeAMO_afe_AXI : STD_LOGIC;
    signal instruction_afe_AXI : STD_LOGIC;
    signal iie_CU : STD_LOGIC;
    signal ece_CU : STD_LOGIC;
    signal be_CU : STD_LOGIC;
    signal iie_CSR : STD_LOGIC;
    --interrutp signals
    signal si_CSR : STD_LOGIC;
    signal ti_CSR : STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --safe signals
    signal save_address : STD_LOGIC;
    signal save_PC : STD_LOGIC;
    signal save_IR : STD_LOGIC;
    --control signals
    signal interrupt : STD_LOGIC;
    signal exception_code : STD_LOGIC_VECTOR(31 downto 0);
    signal EI_flag : STD_LOGIC;
    
signal stim_in : std_logic_vector(14 downto 0);

begin

dut: arbiter
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --exception signals
    load_afe_P => stim_in(0),
    storeAMO_afe_P => stim_in(1),
    instruction_afe_P => stim_in(2),
    load_ame_P => stim_in(3),
    storeAMO_ame_P => stim_in(4),
    instruction_ame_P => stim_in(5),
    load_afe_AXI => stim_in(6),
    storeAMO_afe_AXI => stim_in(7),
    instruction_afe_AXI => stim_in(8),
    iie_CU => stim_in(9),
    ece_CU => stim_in(10),
    be_CU => stim_in(11),
    iie_CSR => stim_in(12),
    --interrutp signals
    si_CSR => stim_in(13),
    ti_CSR => stim_in(14),
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --safe signals
    save_address => save_address,
    save_PC => save_PC,
    save_IR => save_IR,
    --control signals
    interrupt => interrupt,
    exception_code => exception_code,
    EI_flag => EI_flag
);

sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    for i in 0 to 19 loop
    
        stim_in <= stimulus(i);
    
        --signal assignements to have a good wave form view
        load_afe_P <= stimulus(i)(0);
        storeAMO_afe_P <= stimulus(i)(1);
        instruction_afe_P <= stimulus(i)(2);
        load_ame_P <= stimulus(i)(3);
        storeAMO_ame_P <= stimulus(i)(4);
        instruction_ame_P <= stimulus(i)(5);
        load_afe_AXI <= stimulus(i)(6);
        storeAMO_afe_AXI <= stimulus(i)(7);
        instruction_afe_AXI <= stimulus(i)(8);
        iie_CU <= stimulus(i)(9);
        ece_CU <= stimulus(i)(10);
        be_CU <= stimulus(i)(11);
        iie_CSR <= stimulus(i)(12);
        si_CSR <= stimulus(i)(13);
        ti_CSR <= stimulus(i)(14);
        
        wait for 1 ns;
        if(results(i)(31 downto 0) /= exception_code) then
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(32) /= save_address) then
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(33) /= save_IR) then
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(34) /= save_PC) then
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(35) /= EI_flag) then
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(36) /= interrupt) then
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        
        assert error_flag = false report "error in test: " & integer'image(i) severity error;
        
        wait for 4 ns;
    end loop;
    
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_flag = true report "verification successfull, 0 errors detected!" severity note;
    
    wait;
end process;

end rtl;
