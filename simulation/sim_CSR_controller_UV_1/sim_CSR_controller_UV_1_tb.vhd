----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: Register File
-- Module Name: sim_CSR_controller_UV_1_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This testbench verifies the correct behaviour of the CSR_controller.vhd file
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
use RF_lib.sim_CSR_controller_UV_1_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_CSR_controller_UV_1_tb is
end sim_CSR_controller_UV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_CSR_controller_UV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --CSR control signals
    signal CSR_address : STD_LOGIC_VECTOR (11 downto 0);
    signal CSR_write : STD_LOGIC;
    signal CSR_read : STD_LOGIC;
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --CSR select signals
    signal CSR_read_sel : STD_LOGIC_VECTOR (5 downto 0);
    signal CSR_write_sel : STD_LOGIC_VECTOR (32 downto 0);
    --exception signals
    signal illegal_instruction_exception : STD_LOGIC;
begin
----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    for i in 0 to 255 loop
        error_flag := false;
        --declare inputs
        CSR_write <= stimulus_input(i)(13);
        CSR_read <= stimulus_input(i)(12);
        CSR_address <= stimulus_input(i)(11 downto 0);
        
        wait for 1 ns;
		--result checks
        if(results(i)(39) /= illegal_instruction_exception) then
            report "illegal_instruction_exception error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(38 downto 33) /= CSR_read_sel) then
            report "CSR_read_sel error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(32 downto 0) /= CSR_write_sel) then
            report "CSR_write_sel error at iteration: " & integer'image(i) severity error;
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
dut : CSR_controller
port map( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --CSR control signals
    CSR_address => CSR_address,
    CSR_write => CSR_write,
    CSR_read => CSR_read,
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --CSR select signals
    CSR_read_sel => CSR_read_sel,
    CSR_write_sel => CSR_write_sel,
    --exception signals
    illegal_instruction_exception => illegal_instruction_exception
);

end rtl;
