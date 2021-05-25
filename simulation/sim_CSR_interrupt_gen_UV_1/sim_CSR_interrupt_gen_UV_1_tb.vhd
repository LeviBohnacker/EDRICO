----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: 
-- Module Name: _UV_x_tb - rtl
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

--add librarys
library RF_lib;
use RF_lib.CSR_pkg.ALL;
use RF_lib.sim_CSR_interrupt_gen_UV_1_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_CSR_interrupt_gen_UV_1_tb is
end sim_CSR_interrupt_gen_UV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_CSR_interrupt_gen_UV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --enable signals
    signal MSIE : STD_LOGIC;
    signal MTIE : STD_LOGIC;
    signal MIE : STD_LOGIC;
    --pending signals
    signal MSIP : STD_LOGIC;
    signal MTIP : STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --interrupt outputs
    signal mtime_interrupt : STD_LOGIC;
    signal mSW_interrupt : STD_LOGIC;

begin
----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    for i in 0 to 7 loop
        error_flag := false;
        --declare inputs
        MSIE <= stimulus_input(i)(4);
        MTIE <= stimulus_input(i)(3);
        MIE <= stimulus_input(i)(2);
        MSIP <= stimulus_input(i)(1);
        MTIP <= stimulus_input(i)(0);
        
        wait for 1 ns;
		--result checks
        if(results(i)(1) /= mtime_interrupt) then
            report "mtime_interrupt error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(0) /= mSW_interrupt) then
            report "mSW_interrupt error at iteration: " & integer'image(i) severity error;
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
dut : CSR_interrupt_gen 
port map( 
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --enable signals
    MSIE => MSIE,
    MTIE => MTIE,
    MIE => MIE,
    --pending signals
    MSIP => MSIP,
    MTIP => MTIP,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --interrupt outputs
    mtime_interrupt => mtime_interrupt,
    mSW_interrupt => mSW_interrupt
);

end rtl;
