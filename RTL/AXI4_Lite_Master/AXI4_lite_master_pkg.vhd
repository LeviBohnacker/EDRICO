----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Levi Bohnacker
-- 
-- Create Date: 05/16/2021 10:06:58 PM
-- Design Name: AXI4_lite_master
-- Module Name: AXI4_lite_master_pkg
-- Project Name: EDRICO
-- Target Devices: Arty Z7
-- Tool Versions: 
-- Description: 
--  This package contains all the components for the AXI4-Master
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

----------------------------------------------------------------------------------
--PACKAGE
----------------------------------------------------------------------------------
package AXI4_lite_master_pkg is

----------------------------------------------------------------------------------
--components
----------------------------------------------------------------------------------
component AXI4_lite_master_control_unit is
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
    --controll signals
    enable : in STD_LOGIC;
    readWrite : in STD_LOGIC;
    instruction : in STD_LOGIC;
    size : in STD_LOGIC_VECTOR(1 downto 0);
    --halt core
    halt_core : in STD_LOGIC;
    --reset
    reset : in STD_LOGIC;
    ------------------------------------------------------------------------------
    --output signals
    ------------------------------------------------------------------------------
    --system control
    memOp_finished : out STD_LOGIC;
    store_systemData : out STD_LOGIC;
    --exception flags
    load_afe_AXI : out STD_LOGIC;
    storeAMO_afe_AXI : out STD_LOGIC;
    instruction_afe_AXI : out STD_LOGIC;
    --register control
    load_address : out STD_LOGIC;
    load_data : out STD_LOGIC
);
end component;

component AXI4_lite_master is
port (
    ------------------------------------------------------------------------------
    --AXI channels
    ------------------------------------------------------------------------------
    --clock and reset
    M_AXI_ACLK : out STD_LOGIC;
    M_AXI_ARSTN : out STD_LOGIC;
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
    clk : in STD_LOGIC;
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
end component;

end package;


