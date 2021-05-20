----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/19/2021 03:12:26 PM
-- Design Name: Exception Control
-- Module Name: DRA_control_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This testbench verifies the proper functionality of the DRA_controll.vhd file
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
use IEEE.NUMERIC_STD.ALL;

library EC_lib;
use EC_lib.Exception_Controll_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity DRA_control_tb is
end DRA_control_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of DRA_control_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --dra access signals
    signal PC_dra_read : std_logic_vector (31 downto 0);
    signal IR_dra : std_logic_vector (31 downto 0);
    signal PMP_dra : std_logic_vector (31 downto 0);
    --control signals
    signal load_PC : std_logic;
    signal load_IR : std_logic;
    signal load_PMP : std_logic;
    --data input
    signal data_out : std_logic_vector(31 downto 0);
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    signal PC_dra_write : std_logic_vector (31 downto 0);
    signal data_in_dra : std_logic_vector (31 downto 0);

begin

stim : process
variable error_cnt : integer := 0;
variable error_flag : boolean := false;
begin
    error_cnt := 0;
    PC_dra_read <= x"DEADAFFE";
    IR_dra <= x"DECAFBAD";
    PMP_dra <= x"A" & x"BAD" & x"1DEA";
    data_out <= x"BAD" & x"C0DED";
    
    wait for 5 ns;
    load_PC <= '1';
    load_IR <= '0';
    load_PMP <= '0';
    
    wait for 1 ns;
    if(data_in_DRA = x"DEADAFFE") then
        error_flag := false;
    else 
        error_cnt := error_cnt + 1;
        error_flag := true;
    end if;
    assert error_flag = false report "error detected, load_PC" severity error;
    
    wait for 5 ns;
    load_PC <= '0';
    load_IR <= '1';
    load_PMP <= '0';
    
    wait for 1 ns;
    if(data_in_DRA = x"DECAFBAD") then
        error_flag := false;
    else 
        error_cnt := error_cnt + 1;
        error_flag := true;
    end if;
    assert error_flag = false report "error detected, load_IR" severity error;
    
    wait for 5 ns;
    load_PC <= '0';
    load_IR <= '0';
    load_PMP <= '1';
    
    wait for 1 ns;
    if(data_in_DRA = x"A" & x"BAD" & x"1DEA") then
        error_flag := false;
    else 
        error_cnt := error_cnt + 1;
        error_flag := true;
    end if;
    assert error_flag = false report "error detected, load_PMP" severity error;
    
    wait for 5 ns;
    load_PC <= '0';
    load_IR <= '0';
    load_PMP <= '0';
    
    wait for 1 ns;
    if(data_in_DRA = x"00000000") then
        error_flag := false;
    else 
        error_cnt := error_cnt + 1;
        error_flag := true;
    end if;
    assert error_flag = false report "error detected, no load signals" severity error;
    
    if(PC_dra_write = x"BAD" & x"C0DED") then
        error_flag := false;
    else 
        error_cnt := error_cnt + 1;
        error_flag := true;
    end if;
    assert error_flag = false report "error detected PC_dra_write signal" severity error;
    
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_cnt /= 0 report "no errors detected" severity note;
    
    wait;

end process;




dut: DRA_controll
port map(
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --dra access signals
    PC_dra_read => PC_dra_read,
    IR_dra => IR_dra,
    PMP_dra => PMP_dra,
    --control signals
    load_PC => load_PC,
    load_IR => load_IR,
    load_PMP => load_PMP,
    --data input
    data_out => data_out,
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    PC_dra_write => PC_dra_write,
    data_in_dra => data_in_dra 
);


end rtl;


























