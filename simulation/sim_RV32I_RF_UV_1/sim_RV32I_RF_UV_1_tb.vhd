----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: RV32I_RF
-- Module Name: sim_RV32I_RF_UV_1_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This testbench verifies the correct behaviout of the RV32I_RF.vhd file
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
use RF_lib.RF_pkg.ALL;
use RF_lib.sim_RV32I_RF_UV_1_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_RV32I_RF_UV_1_tb is
end sim_RV32I_RF_UV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_RV32I_RF_UV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --input signals 
    ------------------------------------------------------------------------------
    --control singlas
    signal register_write : STD_LOGIC_VECTOR (4 downto 0);
    signal register_read_A : STD_LOGIC_VECTOR (4 downto 0);
    signal register_read_B : STD_LOGIC_VECTOR (4 downto 0);
    --data in
    signal data_in : STD_LOGIC_VECTOR (31 downto 0);
    --clock and reset
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals 
    ------------------------------------------------------------------------------
    signal data_bus_A : STD_LOGIC_VECTOR (31 downto 0);
    signal data_bus_B : STD_LOGIC_VECTOR (31 downto 0);

constant T : time := 5 ns;

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
    wait for 20 ns;
    reset <= '0';
    for i in 0 to 63 loop
        error_flag := false;
        --declare inputs
        register_write <= stimulus_control(i)(14 downto 10);
        register_read_A <= stimulus_control(i)(9 downto 5);
        register_read_B <= stimulus_control(i)(4 downto 0);
        
        data_in <= stimulus_data(i);
        
        wait for 1 ns;
		--result checks
        if(results(i)(63 downto 32) /= data_bus_A) then
            report "data_bus_A error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        --result checks
        if(results(i)(31 downto 0) /= data_bus_B) then
            report "data_bus_B error at iteration: " & integer'image(i) severity error;
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
dut : RV32I_RF
port map(
    ------------------------------------------------------------------------------
    --input signals 
    ------------------------------------------------------------------------------
    --control singlas
    register_write => register_write,
    register_read_A => register_read_A,
    register_read_B => register_read_B,
    --data in
    data_in => data_in,
    --clock and reset
    clk => clk,
    reset => reset,
    ------------------------------------------------------------------------------
    --output signals 
    ------------------------------------------------------------------------------
    data_bus_A => data_bus_A,
    data_bus_B => data_bus_B
);

end rtl;
