----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2021 01:55:05 PM
-- Design Name: 
-- Module Name: DMU_UV_1_tb - Behavioral
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

library DMU_lib;
use DMU_lib.data_mask_unit_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity DMU_UV_1_tb is
end DMU_UV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture Behavioral of DMU_UV_1_tb is

--DUT signals
signal DMU_OUT_MUX_ctrl, DMU_IN_MUX_ctrl : std_logic;
signal mask_ctrl : std_logic_vector(2 downto 0);
signal data_bus_A, LoadBufferRegister, data_load, data_store : std_logic_vector(31 downto 0);

begin

test: process
begin
    --byte sign extend test 0
    wait for 100 ns;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "000";
    LoadBufferRegister <= x"23456789";  
    
    --byte sign extend test 1
    wait for 100 ns;
    assert data_store = x"FFFFFF89" report "byte sign extend test 0 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "000";
    LoadBufferRegister <= x"12341234";
    
    --byte zero extend test 0
    wait for 100 ns;
    assert data_store = x"00000034" report "byte sign extend test 1 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "001";
    LoadBufferRegister <= x"23456789";
    
    --byte zero extend test 1
    wait for 100 ns;
    assert data_store = x"00000089" report "byte zero extend test 0 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "001";
    LoadBufferRegister <= x"12341234"; 

    --halfword sign extend test 0
    wait for 100 ns;
    assert data_store = x"00000034" report "byte zero extend test 1 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "010";
    LoadBufferRegister <= x"AFFEDEAD";  
    
    --halfword sign extend test 1
    wait for 100 ns;
    assert data_store = x"FFFFDEAD" report "halfword sign extend test 0 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "010";
    LoadBufferRegister <= x"ABBA0123";
    
    --halfword zero extend test 0
    wait for 100 ns;
    assert data_store = x"00000123" report "halfword sign extend test 1 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "011";
    LoadBufferRegister <= x"AFFEDEAD";
    
    --halfword zero extend test 1
    wait for 100 ns;
    assert data_store = x"0000DEAD" report "halfword zero extend test 0 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "011";
    LoadBufferRegister <= x"ABBA0123";    
    
    --pass through test 0
    wait for 100 ns;
    assert data_store = x"00000123" report "halfword zero extend test 1 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "100";
    LoadBufferRegister <= x"ABBA0123";
    
    --pass through test 1
    wait for 100 ns;
    assert data_store = x"ABBA0123" report "pass through test 0 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "101";
    LoadBufferRegister <= x"DEADAFFE";
    
    --pass through test 2
    wait for 100 ns;
    assert data_store = x"DEADAFFE" report "pass through test 1 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "110";
    LoadBufferRegister <= x"12345678";
    
    --pass through test 3
    wait for 100 ns;
    assert data_store = x"12345678" report "pass through test 2 error" severity error;
    DMU_IN_MUX_ctrl <= '0';   
    DMU_OUT_MUX_ctrl <= '0';
    mask_ctrl <= "111";
    LoadBufferRegister <= x"98765432";
    
    --MUX test
    wait for 100 ns;
    assert data_store = x"98765432" report "pass through test 3 error" severity error;
    DMU_IN_MUX_ctrl <= '1';
    DMU_OUT_MUX_ctrl <= '1';
    mask_ctrl <= "100";
    data_bus_A <= x"ABBAABBA";
    
    wait for 100 ns;
    assert data_load = x"ABBAABBA" report "MUX test error" severity error;
    
    assert false report "test finished" severity note;
    wait for 10 ns;
    
        
end process;


----------------------------------------------------------------------------------
--design under test
----------------------------------------------------------------------------------
DUT: data_mask_unit
port map(
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --mux control
    DMU_IN_MUX_ctrl => DMU_IN_MUX_ctrl,
    DMU_OUT_MUX_ctrl => DMU_OUT_MUX_ctrl,
    --mask control
    mask_ctrl => mask_ctrl,
    --data inputs
    data_bus_A => data_bus_A,
    LoadBufferRegister => LoadBufferRegister,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    data_load => data_load,
    data_store => data_store
);

end Behavioral;
