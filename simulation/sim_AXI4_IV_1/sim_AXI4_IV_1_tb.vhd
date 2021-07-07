----------------------------------------------------------------------------------
-- Company: DHWB
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/23/2021 02:51:31 PM
-- Design Name: AXI4_lite_master
-- Module Name: sim_AXI4_IV_1_tb - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This testbench verifies the behaviout of the AXI4_lite_master.vhd file
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
library AXI4M_lib;
use AXI4M_lib.sim_AXI4_IV_1_pkg.ALL;
use AXI4M_lib.AXI4_lite_master_pkg.ALL;


----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity sim_AXI4_IV_1_tb is
end sim_AXI4_IV_1_tb;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of sim_AXI4_IV_1_tb is

----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
    ------------------------------------------------------------------------------
    --AXI channels
    ------------------------------------------------------------------------------
    --clock and reset
    signal M_AXI_ACLK : STD_LOGIC := '0';
    signal M_AXI_ARSTN : STD_LOGIC := '0';
    --read address channel
    signal M_AXI_ARADDR : STD_LOGIC_VECTOR (31 downto 0);
    signal M_AXI_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal M_AXI_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal M_AXI_ARVALID : STD_LOGIC;
    signal M_AXI_ARREADY : STD_LOGIC;
    --read data channel
    signal M_AXI_RDATA : STD_LOGIC_VECTOR (31 downto 0);
    signal M_AXI_RRESP : STD_LOGIC_VECTOR (1 downto 0);
    signal M_AXI_RVALID : STD_LOGIC;
    signal M_AXI_RREADY : STD_LOGIC;
    --write address channel
    signal M_AXI_AWADDR : STD_LOGIC_VECTOR (31 downto 0);
    signal M_AXI_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal M_AXI_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal M_AXI_AWVALID : STD_LOGIC;
    signal M_AXI_AWREADY : STD_LOGIC;
    --write data channel
    signal M_AXI_WDATA : STD_LOGIC_VECTOR (31 downto 0);
    signal M_AXI_WSTRB : STD_LOGIC_VECTOR (3 downto 0);
    signal M_AXI_WVALID : STD_LOGIC;
    signal M_AXI_WREADY : STD_LOGIC;
    --write response channel
    signal M_AXI_BRESP : STD_LOGIC_VECTOR (1 downto 0);
    signal M_AXI_BVALID : STD_LOGIC;
    signal M_AXI_BREADY : STD_LOGIC;
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --control signals
    signal enable : STD_LOGIC;
    signal readWrite : STD_LOGIC;
    signal instruction : STD_LOGIC;
    signal size : STD_LOGIC_VECTOR (1 downto 0);
    --halt core signal
    signal halt_core : STD_LOGIC;
    --clock and reset
    signal clk : STD_LOGIC;
    signal reset : STD_LOGIC := '1';
    --address and data input
    signal address_in : STD_LOGIC_VECTOR (31 downto 0);
    signal data_in : STD_LOGIC_VECTOR (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --system control
    signal memOp_finished : STD_LOGIC;
    signal store_systemData : STD_LOGIC;
    --exception flags
    signal instruction_afe_AXI : STD_LOGIC;
    signal storeAMO_afe_AXI : STD_LOGIC;
    signal load_afe_AXI : STD_LOGIC;
    --data output
    signal data_out : STD_LOGIC_VECTOR(31 downto 0);
    
    
signal check_result: std_logic := '0';
signal update_stimuli : std_logic := '0';
signal iteration : integer := 0;
constant T : time := 5 ns;

begin

M_AXI_ACLK <= not M_AXI_ACLK after T/2;


----------------------------------------------------------------------------------
--verification                                                         
----------------------------------------------------------------------------------
sim: process
variable error_flag : boolean := false;
variable error_cnt : integer := 0;
begin
    M_AXI_ARSTN <= '0';
    reset <= '1';
    wait for 10 ns;
    M_AXI_ARSTN <= '1';
    reset <= '0';
    wait for 4 ns;

    for i in 0 to 45 loop
        iteration <= i;
        update_stimuli <= '1';
        error_flag := false;
        --stimulus inputs
        enable <= stimulus_input(i).enable;
        readWrite <= stimulus_input(i).readWrite;
        instruction <= stimulus_input(i).instruction;
        size <= stimulus_input(i).size;
        halt_core <= stimulus_input(i).halt_core;
        address_in <= stimulus_input(i).address_in;
        data_in <= stimulus_input(i).data_in; 
        --stimulus AXI4
        M_AXI_RDATA  <= stimulus_AXI4_in(i).M_AXI_RDATA;
        M_AXI_ARREADY <= stimulus_AXI4_in(i).M_AXI_ARREADY;
        M_AXI_RRESP <= stimulus_AXI4_in(i).M_AXI_RRESP;
        M_AXI_RVALID <= stimulus_AXI4_in(i).M_AXI_RVALID;
        M_AXI_AWREADY <= stimulus_AXI4_in(i).M_AXI_AWREADY;
        M_AXI_WREADY <= stimulus_AXI4_in(i).M_AXI_WREADY;
        M_AXI_BRESP <= stimulus_AXI4_in(i).M_AXI_BRESP;
        M_AXI_BVALID <= stimulus_AXI4_in(i).M_AXI_BVALID;
        
        wait for 2 ns;
        update_stimuli <= '0';
        check_result <= '1';
		--result checks
        if(results_output(i).memOp_finished /= memOp_finished) then
            report "memOp_finished error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_output(i).memOp_finished)) & ", got: " & to_hstring(std_logic_vector'('0' & memOp_finished)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_output(i).store_systemData /= store_systemData) then
            report "store_systemData error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_output(i).store_systemData)) & ", got: " & to_hstring(std_logic_vector'('0' & store_systemData)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_output(i).load_afe_AXI /= load_afe_AXI) then
            report "load_afe_AXI error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_output(i).load_afe_AXI)) & ", got: " & to_hstring(std_logic_vector'('0' & load_afe_AXI)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_output(i).storeAMO_afe_AXI /= storeAMO_afe_AXI) then
            report "storeAMO_afe_AXI error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_output(i).storeAMO_afe_AXI)) & ", got: " & to_hstring(std_logic_vector'('0' & storeAMO_afe_AXI)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_output(i).instruction_afe_AXI /= instruction_afe_AXI) then
            report "instruction_afe_AXI error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_output(i).instruction_afe_AXI)) & ", got: " & to_hstring(std_logic_vector'('0' & instruction_afe_AXI)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_output(i).data_out /= data_out) then
            report "data_out error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_output(i).data_out) & ", got: " & to_hstring(data_out) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        
        
        --AXI4 output checks
        if(results_AXI4_out(i).M_AXI_AWADDR /= M_AXI_AWADDR) then
            report "M_AXI_AWADDR error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_AXI4_out(i).M_AXI_AWADDR) & ", got: " & to_hstring(M_AXI_AWADDR) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_ARADDR /= M_AXI_ARADDR) then
            report "M_AXI_ARADDR error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_AXI4_out(i).M_AXI_ARADDR) & ", got: " & to_hstring(M_AXI_ARADDR) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_WDATA /= M_AXI_WDATA) then
            report "M_AXI_WDATA error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_AXI4_out(i).M_AXI_WDATA) & ", got: " & to_hstring(M_AXI_WDATA) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_ARCACHE /= M_AXI_ARCACHE) then
            report "M_AXI_ARCACHE error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_AXI4_out(i).M_AXI_ARCACHE) & ", got: " & to_hstring(M_AXI_ARCACHE) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_ARPROT /= M_AXI_ARPROT) then
            report "M_AXI_ARPROT error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_AXI4_out(i).M_AXI_ARPROT) & ", got: " & to_hstring(M_AXI_ARPROT) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_ARVALID /= M_AXI_ARVALID) then
            report "M_AXI_ARVALID error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_AXI4_out(i).M_AXI_ARVALID)) & ", got: " & to_hstring(std_logic_vector'('0' & M_AXI_ARVALID)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_RREADY /= M_AXI_RREADY) then
            report "M_AXI_RREADY error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_AXI4_out(i).M_AXI_RREADY)) & ", got: " & to_hstring(std_logic_vector'('0' & M_AXI_RREADY)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_AWCACHE /= M_AXI_AWCACHE) then
            report "M_AXI_AWCACHE error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_AXI4_out(i).M_AXI_AWCACHE) & ", got: " & to_hstring(M_AXI_AWCACHE) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_AWPROT /= M_AXI_AWPROT) then
            report "M_AXI_AWPROT error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_AXI4_out(i).M_AXI_AWPROT) & ", got: " & to_hstring(M_AXI_AWPROT) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_AWVALID /= M_AXI_AWVALID) then
            report "M_AXI_AWVALID error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_AXI4_out(i).M_AXI_AWVALID)) & ", got: " & to_hstring(std_logic_vector'('0' & M_AXI_AWVALID)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_WSTRB /= M_AXI_WSTRB) then
            report "M_AXI_WSTRB error at iteration: " & integer'image(i) & " | expected: " & to_hstring(results_AXI4_out(i).M_AXI_WSTRB) & ", got: " & to_hstring(M_AXI_WSTRB) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_WVALID /= M_AXI_WVALID) then
            report "M_AXI_WVALID error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_AXI4_out(i).M_AXI_WVALID)) & ", got: " & to_hstring(std_logic_vector'('0' & M_AXI_WVALID)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        if(results_AXI4_out(i).M_AXI_BREADY /= M_AXI_BREADY) then
            report "M_AXI_BREADY error at iteration: " & integer'image(i) & " | expected: " & to_hstring(std_logic_vector'('0' & results_AXI4_out(i).M_AXI_BREADY)) & ", got: " & to_hstring(std_logic_vector'('0' & M_AXI_BREADY)) severity error;
            error_flag := true;
            error_cnt := error_cnt + 1;
        end if;
        
        assert error_flag = false report "error in test: " & integer'image(i) severity error;
        
        wait for 2 ns;
        check_result <= '0';
        wait for 1 ns;
    end loop;
    
    assert error_cnt = 0 report integer'image(error_cnt) & " error(s) detected" severity error;
    assert error_cnt /= 0 report "verification successfull, 0 errors detected!" severity note;
    
    wait;
end process;

----------------------------------------------------------------------------------
--Design Under Test
----------------------------------------------------------------------------------
dut : AXI4_lite_master
port map(
    ------------------------------------------------------------------------------
    --AXI channels
    ------------------------------------------------------------------------------
    --clock and reset
    M_AXI_ACLK => M_AXI_ACLK,
    M_AXI_ARSTN => M_AXI_ARSTN,
    --read address channel
    M_AXI_ARADDR => M_AXI_ARADDR,
    M_AXI_ARCACHE => M_AXI_ARCACHE,
    M_AXI_ARPROT => M_AXI_ARPROT,
    M_AXI_ARVALID => M_AXI_ARVALID,
    M_AXI_ARREADY => M_AXI_ARREADY,
    --read data channel
    M_AXI_RDATA => M_AXI_RDATA,
    M_AXI_RRESP => M_AXI_RRESP,
    M_AXI_RVALID => M_AXI_RVALID,
    M_AXI_RREADY => M_AXI_RREADY,
    --write address channel
    M_AXI_AWADDR => M_AXI_AWADDR,
    M_AXI_AWCACHE => M_AXI_AWCACHE,
    M_AXI_AWPROT => M_AXI_AWPROT,
    M_AXI_AWVALID => M_AXI_AWVALID,
    M_AXI_AWREADY => M_AXI_AWREADY,
    --write data channel
    M_AXI_WDATA => M_AXI_WDATA,
    M_AXI_WSTRB => M_AXI_WSTRB,
    M_AXI_WVALID => M_AXI_WVALID,
    M_AXI_WREADY => M_AXI_WREADY,
    --write response channel
    M_AXI_BRESP => M_AXI_BRESP,
    M_AXI_BVALID => M_AXI_BVALID,
    M_AXI_BREADY => M_AXI_BREADY,
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --control signals
    enable => enable,
    readWrite => readWrite,
    instruction => instruction,
    size => size,
    --halt core signal
    halt_core => halt_core,
    reset => reset,
    --address and data input
    address_in => address_in,
    data_in => data_in,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --system control
    memOp_finished => memOp_finished,
    store_systemData => store_systemData,
    --exception flags
    instruction_afe_AXI => instruction_afe_AXI,
    storeAMO_afe_AXI => storeAMO_afe_AXI,
    load_afe_AXI => load_afe_AXI,
    --data output
    data_out => data_out
  );

end rtl;
