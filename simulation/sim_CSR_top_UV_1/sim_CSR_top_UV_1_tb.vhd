----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: CSR_top
-- Module Name: sim_CSR_top_UV_1_tb - rtl
-- Project Name: EDRIOC
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This testbench verifies the correct behaviout of the CSR_top.vhd file
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
use RF_lib.sim_CSR_top_UV_1_pkg.ALL;

library PMP_lib;
use PMP_lib.PMP_PMA_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_CSR_top_UV_1_tb is
end sim_CSR_top_UV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_CSR_top_UV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --data input
    signal data_in : STD_LOGIC_VECTOR (31 downto 0);
    --interrupt pending bit dra's
    signal MSIP_dra : STD_LOGIC;
    signal MTIP_dra : STD_LOGIC;
    --clock and reset
    signal clk : STD_LOGIC := '1';
    signal reset: STD_LOGIC;
    --instruction finished flag
    signal instr_finished : STD_LOGIC;
    --CSR controll signals
    signal CSR_address : STD_LOGIC_VECTOR (11 downto 0);
    signal CSR_read : STD_LOGIC;
    signal CSR_write : STD_LOGIC;
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    signal data_bus_B : STD_LOGIC_VECTOR (31 downto 0);
    --pmp dra outputs
    signal pmpcfg_dra : type_pmpcfg;
    signal pmpaddr_dra : type_pmpaddr;
    --interrupt pending flags
    signal iie_CSR: STD_LOGIC;
    signal mtime_interrupt : STD_LOGIC;
    signal mSW_interrupt : STD_LOGIC;


constant T : time := 10 ns;

begin
----------------------------------------------------------------------------------
--clock generation                                                         
----------------------------------------------------------------------------------
clk <= not clk after T/2;


----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    reset <= '1';
    CSR_read <= '0';
    CSR_write <= '0';
    CSR_address <= x"000";
    wait for 20 ns;
    
    reset <= '0';
    for i in 0 to 255 loop
        error_flag := false;
        --declare inputs
        data_in <= stimulus_data(i);
        CSR_write <= stimulus_control(i)(13);
        CSR_read <= stimulus_control(i)(12);        
        CSR_address <= stimulus_control(i)(11 downto 0);
        MSIP_dra <= stimulus_input(i mod 8)(2);
        MTIP_dra <= stimulus_input(i mod 8)(1);
        instr_finished <= stimulus_input(i mod 8)(0);
        wait for 1 ns;
		--result checks
        if(results(i)(31 downto 0) /= data_bus_B) then
            report "data_bus_B error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results(i)(32) /= iie_CSR) then
            report "iie_CSR error at iteration: " & integer'image(i) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        
        assert error_flag = false report "error in test: " & integer'image(i) severity error;
        
        wait for 9 ns;
    end loop;
    
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_cnt /= 0 report "verification successfull, 0 errors detected!" severity note;
    
    wait;
end process;

----------------------------------------------------------------------------------
--Design Under Test
----------------------------------------------------------------------------------
dut : CSR_top
port map( 
    -------------------------------------------------------------------------------
    --input signals
    -------------------------------------------------------------------------------
    --data input
    data_in => data_in,
    --interrupt pending bit dra's
    MSIP_dra => MSIP_dra,
    MTIP_dra => MTIP_dra,
    --clock and reset
    clk => clk,
    reset => reset,
    --instruction finished flag
    instr_finished => instr_finished,
    --CSR controll signals
    CSR_address => CSR_address,
    CSR_read => CSR_read,
    CSR_write => CSR_write,
    -------------------------------------------------------------------------------
    --output signals
    -------------------------------------------------------------------------------
    --data output
    data_bus_B => data_bus_B,
    --pmp dra outputs
    pmpcfg_dra => pmpcfg_dra,
    pmpaddr_dra => pmpaddr_dra,
    --interrupt pending flags
    iie_CSR => iie_CSR,
    mtime_interrupt => mtime_interrupt,
    mSW_interrupt => mSW_interrupt 
);

end rtl;
