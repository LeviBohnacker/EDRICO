----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/16/2021 08:17:06 PM
-- Design Name: AXI4_lite_master
-- Module Name: AXI4_lite_master - rtl
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This is the top module of the AXI4 master interface
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

library AXI4M_lib;
use AXI4M_lib.AXI4_lite_master_pkg.ALL;

----------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------
entity AXI4_lite_master is
port (
    ------------------------------------------------------------------------------
    --AXI channels
    ------------------------------------------------------------------------------
    --clock and reset
    M_AXI_ACLK : in STD_LOGIC;
    M_AXI_ARSTN : in STD_LOGIC;
    --read address channel
    M_AXI_ARADDR : out STD_LOGIC_VECTOR (31 downto 0);
    M_AXI_ARCACHE : out STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_ARPROT : out STD_LOGIC_VECTOR (2 downto 0);
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    --read data channel
    M_AXI_RDATA : in STD_LOGIC_VECTOR (31 downto 0);
    M_AXI_RRESP : in STD_LOGIC_VECTOR (1 downto 0);
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC;
    --write address channel
    M_AXI_AWADDR : out STD_LOGIC_VECTOR (31 downto 0);
    M_AXI_AWCACHE : out STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_AWPROT : out STD_LOGIC_VECTOR (2 downto 0);
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    --write data channel
    M_AXI_WDATA : out STD_LOGIC_VECTOR (31 downto 0);
    M_AXI_WSTRB : out STD_LOGIC_VECTOR (3 downto 0);
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    --write response channel
    M_AXI_BRESP : in STD_LOGIC_VECTOR (1 downto 0);
    M_AXI_BVALID : in STD_LOGIC;
    M_AXI_BREADY : out STD_LOGIC;
    ------------------------------------------------------------------------------
    --input signals
    ------------------------------------------------------------------------------
    --control signals
    enable : in STD_LOGIC;
    readWrite : in STD_LOGIC;
    instruction : in STD_LOGIC;
    size : in STD_LOGIC_VECTOR (1 downto 0);
    --halt core signal
    halt_core : in STD_LOGIC;
    --clock and reset
    reset : in STD_LOGIC;
    --address and data input
    address_in : in STD_LOGIC_VECTOR (31 downto 0);
    data_in : in STD_LOGIC_VECTOR (31 downto 0);
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --system control
    memOp_finished : out STD_LOGIC;
    store_systemData : out STD_LOGIC;
    --exception flags
    instruction_afe_AXI : out STD_LOGIC;
    storeAMO_afe_AXI : out STD_LOGIC;
    load_afe_AXI : out STD_LOGIC;
    --data output
    data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end AXI4_lite_master;

----------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------
architecture rtl of AXI4_lite_master is
----------------------------------------------------------------------------------
--signals
----------------------------------------------------------------------------------
signal reset_local : std_logic;
signal load_address : std_logic;
signal load_data : std_logic;

signal address_register : std_logic_vector(31 downto 0);
signal data_register : std_logic_vector(31 downto 0);


begin


----------------------------------------------------------------------------------
--AXI4 lite master control unit
----------------------------------------------------------------------------------
AXI4_LM_CU: AXI4_lite_master_control_unit
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
    --controll signals
    enable => enable,
    readWrite => readWrite,
    instruction => instruction,
    size => size,
    --halt core
    halt_core => halt_core,
    --clock and reset
    reset => reset,
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --system control
    memOp_finished => memOp_finished,
    store_systemData => store_systemData,
    --exception flags
    load_afe_AXI => load_afe_AXI,
    storeAMO_afe_AXI => storeAMO_afe_AXI,
    instruction_afe_AXI => instruction_afe_AXI,
    --register control
    load_address => load_address,
    load_data => load_data
);

----------------------------------------------------------------------------------
--address register
----------------------------------------------------------------------------------
addr_reg: process(M_AXI_ACLK, reset, M_AXI_ARSTN, reset_local)
begin
    if(reset = '1' or M_AXI_ARSTN = '0') then
        address_register <= (others => '0');
    elsif(M_AXI_ACLK'event and M_AXI_ACLK = '1') then
        if(reset_local = '1') then
            address_register <= (others => '0');
        elsif(load_address = '1') then
            address_register <= address_in;
        end if;
    end if;
end process;

----------------------------------------------------------------------------------
--data register
----------------------------------------------------------------------------------
data_reg: process(M_AXI_ACLK, reset, M_AXI_ARSTN, reset_local)
begin
    if(reset = '1' or M_AXI_ARSTN = '1') then
        data_register <= (others => '0');
    elsif(M_AXI_ACLK'event and M_AXI_ACLK = '1') then
        if(reset_local = '1') then
            data_register <= (others => '1');
        elsif(load_data = '1') then
            data_register <= data_in;
        end if;
    end if;
end process;

----------------------------------------------------------------------------------
--address and data assignements
----------------------------------------------------------------------------------
M_AXI_AWADDR <= address_register;
M_AXI_ARADDR <= address_register;

M_AXI_WDATA <= data_register;

data_out <= M_AXI_RDATA;

end rtl;










